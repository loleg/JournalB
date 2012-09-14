<?php
require_once('disqus/disqusapi.php');

/*
 *  Custom controller for Journal-B.ch services
 *  - Note: copy into newscoop/application/controllers
 */
class FavoritesController extends Zend_Controller_Action
{
	
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
	
	public function checkDisqusLogin() {
	
		$jbdisqus = $this->getRequest()->getCookie('jbdisqus');
		if (!isset($jbdisqus)) {
			$this->_redirect('/services/disqus.php', array(
				'auth'=>1
			));
		}
				
		$this->userid = 	$jbdisqus['userid'];
		$this->username = 	$jbdisqus['username'];
		$this->token = 		$jbdisqus['token'];
		$this->refresh = 	$jbdisqus['refresh'];
			
		if (!isset($this->userid)) {
			$this->_redirect('/services/disqus.php', array(
				'logout'=>1
			));
		}
		
		$this->disqusapi = new DisqusAPI($this->SECRET_KEY);
	}
	
	/* User favorites */
	public function indexAction() {
		
		$this->checkDisqusLogin();
			
		$results = array();
		
		$activities =
			$this->disqusapi->users->listActivity(array(
				'user'=>$this->userid, 'include'=>'user', 'limit'=>50
			));
			
		foreach ($activities as $k => $v) {
			if (strstr($v->type, "like") && 
				$v->object->forum->id == $this->shortname) {
				
				$results[] = $v->object->thread;
				
			}
		}
		
		$this->view->articles = $results;
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