<?php
require_once('disqus/disqusapi.php');

use Newscoop\Entity\Article;

/*
 *  Custom controller for Journal-B.ch web services
 *  - Note: copy into newscoop/application/controllers
 */
class FavoritesController extends Zend_Controller_Action
{

	/** @var Newscoop\Entity\Repository\ArticleRepository */
    private $articleRepository;
        
	public function init()
    {
        $this->articleRepository = $this->_helper->entity->getRepository('Newscoop\Entity\Article');
        
        return $this;
    }
	
	/** @var int */
    private $userid;
	/** @var string */
    private $username;
	/** @var string */
    private $token;
	/** @var int */
    private $refresh;
    /** @var DisqusAPI */
    private $disqusapi;
    
    // Account details
	private $shortname = 'journalb-lab'; 
	private $PUBLIC_KEY = "S2zPf5GHF44MxrBrcsjhUP8aZD5SHIdoSBqB1l10NBtMkjhC1AZAEPpWSqYZauFa";
	private $SECRET_KEY = "Em5o6RFV2YKZgTowuo6QprVZ8WwLZ5SdhL9hmkAORZXsW5jzbJiPCGZgT6sfYqXr";
	private $homepage = "http://bern.lab.sourcefabric.org";
	private $redirect = "http://bern.lab.sourcefabric.org/favorites";
	
	// If we are not logged in, redirect us to login
	private function ensureDisqusLogin($gotologin = true) {
	
		if (!empty($this->userid)) { return true; }
	
		$jbdisqus = $this->getRequest()->getCookie('jbdisqus');
		if (!isset($jbdisqus)) {
			if (!$this->getDisqusLogin($this->getRequest())) {
				if ($gotologin) {
					$this->_redirect('https://disqus.com/api/oauth/2.0/authorize/?' .
						'client_id=' . $this->PUBLIC_KEY . '&' .
						//'scope=' . 'read' . '&' .
						'response_type=' . 'code' . '&' .
						'redirect_uri=' . $this->redirect
					);
				} else {
					return false;
				}
			} else {
				// Get cookie again now that we've processed the login
				$jbdisqus = $this->getRequest()->getCookie('jbdisqus');
			}
		}
				
		$this->userid = 	$jbdisqus['userid'];
		$this->username = 	$jbdisqus['username'];
		$this->token = 		$jbdisqus['token'];
		$this->refresh = 	$jbdisqus['refresh'];
			
		if (!isset($this->userid)) {
			// Could not obtain user ID, probably authentication declined
			return $this->logoutAction();
		}
		
		$this->disqusapi = new DisqusAPI($this->SECRET_KEY);
		
		return true;
	}
	
	// Process the token code for request access
	private function getDisqusLogin($request) {
	
		$CODE = $request->getParam('code');
		if (!isset($CODE)) { return false; }
				
		// Request the access token
		extract($_POST);
		
		$authorize = "authorization_code";
		$url = 'https://disqus.com/api/oauth/2.0/access_token/?';
		$fields = array(
			'grant_type'=>urlencode($authorize),
			'client_id'=>urlencode($this->PUBLIC_KEY),
			'client_secret'=>urlencode($this->SECRET_KEY),
			'redirect_uri'=>urlencode($this->redirect),
			'code'=>urlencode($CODE)
		);
		$fields_string = '';
		
		//url-ify the data for the POST
		foreach($fields as $key=>$value) { $fields_string .= $key.'='.$value.'&'; }
		rtrim($fields_string, "&");
		
		//open connection
		$ch = curl_init();
		
		//set the url, number of POST vars, POST data
		curl_setopt($ch,CURLOPT_URL,$url);
		curl_setopt($ch,CURLOPT_POST,count($fields));
		curl_setopt($ch,CURLOPT_POSTFIELDS,$fields_string);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);
		
		//execute post
		$resultdata = curl_exec($ch);
		
		//close connection
		curl_close($ch);
		
		//get the token if available
		if (!strstr($resultdata, "access_token")) {
			die('Error: could not log into Disqus.');
			
		} else {
			$tokdata = json_decode($resultdata);
			if ($tokdata === NULL) die('Error parsing json');
			
			setcookie('jbdisqus[userid]', 	$tokdata->user_id, $expires);
			setcookie('jbdisqus[username]',	$tokdata->username, $expires);
			setcookie('jbdisqus[token]', 	$tokdata->access_token, $expires);
			setcookie('jbdisqus[refresh]', 	$tokdata->refresh_token, $expires);
			
			// go to home page after logging in
			$this->_redirect('/');
		}

	}
	
	/**
     * Find article by number
     *
     * @param int $num
     * @return Newscoop\Entity\Article
     */
	private function getArticleById($num) {
		return $this->articleRepository->findOneBy(array(
	        'number' => $num,
	    ));
	}
	
	/**
     * Get the article ID from its URL
     *
     * @param string $url
     * @return int
     */
	private function getArticleIdent($url) {
		if (preg_match('/\/de\/[0-9a-z]*\/[a-z]*\/([0-9]+)\//', $url, $matches)) {
			if (isset($matches[1]) && is_numeric($matches[1])) {
				return intval($matches[1]);
			}
		}
		return null;
	}
	
	/* User favorites */
	public function indexAction() {
			
		if (!$this->ensureDisqusLogin(false)) {
			$this->view->nologin = true; 
			return; 
		}
			
		$articles = array();
				
		if (xcache_isset('jb_faves_' . $this->userid)) {
			// Get favorites cached in server
			foreach (xcache_get('jb_faves_' . $this->userid) as $f) {
				$id = $this->getArticleIdent($f);
				if ($id != null) {
					$article = $this->getArticleById($id);
					if ($article !== null) {
						$articles[] = $article;
					}
				}
			}
		
		} else { 
			// Get favorites from user's Disqus activities
			$activities =
				$this->disqusapi->users->listActivity(array(
					'user'=>$this->userid, 'include'=>'user', 'limit'=>100
				));
			
			$faves = array();
			
			foreach ($activities as $k => $v) {
				if (strstr($v->type, "like") && 
					//$v->object->vote == 1 && 
					$v->object->forum->id == $this->shortname) {

					// get article number from Disqus link
					$url = $v->object->thread->link;
					$id = $this->getArticleIdent($url);
					if ($id != null) {
						// add article if we can find it in Newscoop
						$article = $this->getArticleById($id);
						if ($article !== null) {
							$articles[] = $article;
							$faves[] = $url;
						}
					}
				}
			}
			
			// save to cache
			xcache_set('jb_faves_' . $this->userid, $faves);			
		}
		
		/* -- Test --
		//$articles = array();
		$articles[] = $this->getArticleById(194);
		$articles[] = $this->getArticleById(208);
		$articles[] = $this->getArticleById(203);
		*/
		//die(count($articles)." articles");
		
		// Convert Article entity list to MetaArticles
		$this->view->articles = array_map(function($article) {
            return new \MetaArticle($article->getLanguageId(), $article->getNumber());
        }, $articles);
		
	}
	
	// Get a shortlist of our favorites if we're logged in
	public function myfavesAction() {
	
		// make sure the script is not being rendered
		$this->_helper->layout()->setLayout('empty');
		$this->_helper->viewRenderer->setNoRender(true);
		
		if (!$this->ensureDisqusLogin(false)) { die('NOLOGIN'); }
		
		// reload our cache if needed
		if (!xcache_isset('jb_faves_' . $this->userid)) {
			$this->indexAction();
		}
		
		die (json_encode(array(
			'username'=>$this->username,
			'favorites'=>xcache_get('jb_faves_' . $this->userid)
		)));
			
	}
	
	// Returns key of array hit if there is a subtring match
	private function array_part_search($needle = null, $haystack_array = null, $skip = 0) {
		if ($needle == null || $haystack_array == null) return false;
		foreach ($haystack_array as $key => $eval) {
			if ($skip != 0) $eval = substr($eval, $skip);
			if (stristr($eval, $needle) !== false) return $key;
		}
		return false;
	}
	
	// Ensures the browser does not cache
	private function nocacheResponse() {
		$this->getResponse()
			->setHeader('Pragma', 'no-cache', true)
			->setHeader('Cache-Control', 'no-cache');
	}
			
	/* Star a page */
	public function voteAction() {
	
		$request = $this->getRequest();
		
		// make sure the script is not being rendered
		$this->_helper->layout()->setLayout('empty');
		$this->_helper->viewRenderer->setNoRender(true);
		
		$vote = $request->getParam('vote') or die('vote required');
		$title = $request->getParam('title') or die('title required');
		$page = $request->getParam('url') or die('url required');
			
		$title = urldecode($title);
		$page = urldecode($page);
		$vote = intval($vote) or die('Invalid vote');
		if ($vote < 0) { $vote = 0; } // don't dislike pages
		
		if (strstr($page, $this->homepage) == FALSE) { die('Invalid request ' . $page); }
		
		$page = str_replace($this->homepage, "", $page);
		$ident = $this->getArticleIdent($page);
		
		echo($vote . ' / ' . $title . ' / ' . $ident);
				
		$this->ensureDisqusLogin();
		
		$this->nocacheResponse();
		
		// Find this thread
		$threads =
			$this->disqusapi->forums->listThreads(array(
				'forum'=>$this->shortname, 'thread:ident'=>$ident
			));
		
		$id = -1;
		if (count($threads) == 0) {
			// Try creating
			$thread = $this->disqusapi->threads->create(array(
					'forum'=>$this->shortname, 
					'title'=>$title, 
					'url'=>$this->homepage . $page,
					'identifier'=>$ident
				));
			$id = $thread->id;
			echo(' / created thread: ' . $id);
			
		} else {
			// Take existing match
			$id = $threads[0]->id;
			echo(' / found thread: ' . $id);
		}
		
		if ($id > 0) {
			// Now vote for it
			$voteresult = $this->disqusapi->threads->vote(array(
				'vote'=>$vote, 'thread'=>$id, 'forum'=>$this->shortname
			));
			
			// Save to cache
			$faves = xcache_get('jb_faves_' . $this->userid);
			if ($vote > 0) {
				if (!$this->array_part_search($page, $faves)) {
					$faves[] = $page;
					echo (' / added');
				}
			} else {
				$votekey = $this->array_part_search($page, $faves);
				if ($votekey !== false) {
					unset($faves[$votekey]);
					echo (' / removed');
				}
			}
			echo(' / OK / cached: ' . count($faves));
			xcache_set('jb_faves_' . $this->userid, $faves);
			die(var_export($voteresult, true));
			
		} else {
			error_log("Could not vote on thread: " . $page);
			die(' / ERROR');

		}
	}
	
	// Sign into the service
	public function loginAction() {
		$this->ensureDisqusLogin();
		$this->_redirect('/');
	}
	
	// Sign out of our service
	public function logoutAction() {
		setcookie('jbdisqus[userid]', "", time() - 3600);
		setcookie('jbdisqus[username]', "", time() - 3600);
		setcookie('jbdisqus[token]', "", time() - 3600);
		setcookie('jbdisqus[refresh]', "", time() - 3600);
		setcookie('jbdisqus', "", time() - 3600);
		\Zend_Session::destroy(true);
		$this->_redirect('/');
	}
	
}

?>
