<?php

date_default_timezone_set('Europe/Berlin');

require_once(dirname(__FILE__) . '/disqusapi.php');

// Production setup
$homepage = "http://bern.lab.sourcefabric.org";
$redirect = "http://bern.lab.sourcefabric.org/services/disqus.php";

// Local testing
$homepage = "http://localhost:8888/newscoop/";
$redirect = "http://localhost:8888/services/disqus.php";

// Account details
$shortname = 'journalb-lab'; 
$PUBLIC_KEY = "S2zPf5GHF44MxrBrcsjhUP8aZD5SHIdoSBqB1l10NBtMkjhC1AZAEPpWSqYZauFa";
$SECRET_KEY = "Em5o6RFV2YKZgTowuo6QprVZ8WwLZ5SdhL9hmkAORZXsW5jzbJiPCGZgT6sfYqXr";

// 1 year expiry
$expires = time() + 31536000;

if (isset($_GET['logout'])) {

	setcookie("jbdisqus", "", time() - 3600);
	header( 'Location: ' . $homepage ); // http://disqus.com/logout/?redirect= to logout Disqus too

} elseif (isset($_COOKIE['jbdisqus'])) {

	$userid = 	$_COOKIE['jbdisqus']['userid'];
	$username = $_COOKIE['jbdisqus']['username'];
	$token = 	$_COOKIE['jbdisqus']['token'];
	$refresh = 	$_COOKIE['jbdisqus']['refresh'];
	
	$api = new DisqusAPI($SECRET_KEY);
	
	if (isset($_GET['myfaves'])) {
	
		$arr = array('user'=>$username, 'faves'=>array());
		
		$activities =
			$api->users->listActivity(array(
				'user'=>$userid, 'include'=>'user', 'limit'=>50
			));
			
		foreach ($activities as $k => $v) {
			// TODO use in query?
			if (strstr($v->type, "like") && $v->object->forum->id == $shortname) {
				
				$arr['faves'][] = $v->object->thread;
				//var_dump($v->object->thread);
				
			}
		}
		
		echo json_encode($arr);
		
	} elseif (isset($_GET['dofave']) && isset($_GET['vote'])) {
	
		$vote = intval($_GET['vote']) or die('Invalid request');
		$page = urldecode($_GET['dofave']);
		if (strstr($page, 'http:') == FALSE) {
			$page = $_SERVER['HTTP_REFERER'];
		}

		if (strstr($page, $homepage) == FALSE) {
			die('Invalid request ' . $page);
		}
		
		//echo($page);
			
		$threads =
			$api->forums->listThreads(array(
				'forum'=>$shortname, 'thread:link'=>$page
			));
		
		//var_dump($threads);
		
		if (count($threads) == 1) {
			$id = $threads[0]->id;
			$api->threads->vote(array(
				'vote'=>$vote, 'thread'=>$id
			));
			echo('OK');
		}

	} else {
		
		header( 'Location: ' . $homepage );
		
	}
	
} elseif (isset($_GET['code'])) {
		
	// Get the code for request access
	$CODE = $_GET['code'];
	
	// Request the access token
	extract($_POST);
	
	$authorize = "authorization_code";
	$url = 'https://disqus.com/api/oauth/2.0/access_token/?';
	$fields = array(
		'grant_type'=>urlencode($authorize),
		'client_id'=>urlencode($PUBLIC_KEY),
		'client_secret'=>urlencode($SECRET_KEY),
		'redirect_uri'=>urlencode($redirect),
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
		die('Error: could not log into Disqus. <a href="' . $homepage . '">Click here to continue</a>. <!-- ' . $resultdata . '-->');
		
	} else {
		$tokdata = json_decode($resultdata);
		if ($tokdata === NULL) die('Error parsing json');
		
		setcookie('jbdisqus[userid]', 	$tokdata->user_id, $expires);
		setcookie('jbdisqus[username]',	$tokdata->username, $expires);
		setcookie('jbdisqus[token]', 	$tokdata->access_token, $expires);
		setcookie('jbdisqus[refresh]', 	$tokdata->refresh_token, $expires);
	}

	header( 'Location: ' . $homepage );
	
	echo('Thanks, ' . $tokdata->username . '! <a href="' . $homepage . '">Click here to continue</a>');
	
} elseif (isset($_GET['auth'])) {
	
	header( 'Location: https://disqus.com/api/oauth/2.0/authorize/?client_id=' . $PUBLIC_KEY . '&scope=read&response_type=code&redirect_uri=' . $redirect );

}

?>