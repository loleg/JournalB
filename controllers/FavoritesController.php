<?php
require_once('disqus/disqusapi.php');

use Newscoop\Entity\Article;

/*
 *  Custom controller for Journal-B.ch services
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
	
	private function checkDisqusLogin() {
	
		$jbdisqus = $this->getRequest()->getCookie('jbdisqus');
		if (!isset($jbdisqus)) {
			if (!$this->getDisqusLogin($this->getRequest())) {		
				$this->_redirect('https://disqus.com/api/oauth/2.0/authorize/?' .
					'client_id=' . $this->PUBLIC_KEY . '&' .
					'scope=' . 'read' . '&' .
					'response_type=' . 'code' . '&' .
					'redirect_uri=' . $this->redirect
				);
			} else {
				$jbdisqus = $this->getRequest()->getCookie('jbdisqus');
			}
		}
				
		$this->userid = 	$jbdisqus['userid'];
		$this->username = 	$jbdisqus['username'];
		$this->token = 		$jbdisqus['token'];
		$this->refresh = 	$jbdisqus['refresh'];
			
		if (!isset($this->userid)) {
			die('no userid, logging out');
			$this->_redirect('/services/disqus.php', array(
				'logout'=>1
			));
		}
		
		$this->disqusapi = new DisqusAPI($this->SECRET_KEY);
	}
	
	private function getDisqusLogin($request) {
		// Get the code for request access
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
		}
	
		//header( 'Location: ' . $homepage );
		
		//die('Thanks, ' . $tokdata->username);

	}
	
	/**
     * Find article by number
     *
     * @param int $num
     * @return Newscoop\Entity\Article
     */
	private function getArticleById($num) {
	
		return $this->_helper->entity->getRepository('Newscoop\Entity\Article')->findOneBy(array(
            'number' => $num,
        ));
        
	}
	
	/* User favorites */
	public function indexAction() {
			/*
		$this->checkDisqusLogin();
			
		$articleIds = array();
		
		$activities =
			$this->disqusapi->users->listActivity(array(
				'user'=>$this->userid, 'include'=>'user', 'limit'=>50
			));
		
		foreach ($activities as $k => $v) {
			if (strstr($v->type, "like") && 
				$v->object->forum->id == $this->shortname) {

				// get article number from link				
				if (preg_match('/\/de\/[0-9a-z]*\/[a-z]*\/([0-9]+)\//', 
					$v->object->thread->link, $matches)) {
					
					// add article to array
					$articleIds[] = $matches[1];
				}
			}
		}
		
		foreach ($articleIds as $id) { 
			$article = getArticleById($matches[1]);
					if ($article) {
						$articles[] = $article;
					}}
		*/
		// -- Test --
		$articles = array();
		$articles[] = $this->getArticleById(194);
		$articles[] = $this->getArticleById(208);
		$articles[] = $this->getArticleById(203);
		//
		
		// Convert Article entity list to MetaArticles
		$this->view->articles = array_map(function($article) {
            return new \MetaArticle($article->getLanguageId(), $article->getNumber());
        }, $articles);
		
	}		
			
	/* Star a page */
	/*
	public function voteAction() {
	
		checkDisqusLogin();
	
		$vote = intval($_GET['vote']) or die('Invalid request');
		$page = urldecode($_GET['dofave']);
		if (strstr($page, 'http:') == FALSE) {
			$page = $_SERVER['HTTP_REFERER'];
		}
		$title = urldecode($_GET['title']);

		if (strstr($page, $homepage) == FALSE) {
			die('Invalid request ' . $page);
		}
		
		echo($title . ' ' . $page);
			
		$threads =
			$api->forums->listThreads(array(
				'forum'=>$shortname, 'thread:link'=>$page
			));
		
		//var_dump($threads);
		
		$id = -1;
		
		if (count($threads) == 0) {
			
			// Try creating
			$thread = $api->threads->create(array(
					'forum'=>$shortname, 'title'=>$title, 'url'=>$page
				));
			$id = $thread->id;
			
			error_log('Created thread id: ' . $id);
				
		} elseif (count($threads) == 1) {
		
			// Take existing match
			$id = $threads[0]->id;
			
			error_log('Found thread id: ' . $id);
			
		}
		
		if ($id > 0) {
		
			$api->threads->vote(array(
				'vote'=>$vote, 'thread'=>$id
			));
			
			// save to cache
			if (isset($_SESSION['jbdisqus'])) {
				$_SESSION['jbdisqus']['faves'][] = $threads[0];
			}
			
			echo(' - OK');
			
		} else {
		
			echo(' - ERROR');
			error_log("Could not vote on thread: " . $page);

		}
	}
	*/
}

?>