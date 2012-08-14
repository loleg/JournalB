<?php

date_default_timezone_set('Europe/Berlin');

require_once(dirname(__FILE__) . '/disqusapi.php');

$shortname = 'journalb-lab'; 
$homepage = "http://bern.lab.sourcefabric.org";
$redirect = "http://bern.lab.sourcefabric.org/services/disqus.php";
$PUBLIC_KEY = "S2zPf5GHF44MxrBrcsjhUP8aZD5SHIdoSBqB1l10NBtMkjhC1AZAEPpWSqYZauFa";
$SECRET_KEY = "Em5o6RFV2YKZgTowuo6QprVZ8WwLZ5SdhL9hmkAORZXsW5jzbJiPCGZgT6sfYqXr";
$expires = time() + 31536000;

if (isset($_COOKIE['disqus_token'])) {

	$userid = 	$_COOKIE['disqus_userid'];
	$token = 	$_COOKIE['disqus_token'];
	$refresh = 	$_COOKIE['disqus_refresh'];
	
	$api = new DisqusAPI($SECRET_KEY);
	
	if (isset($_GET['myfaves'])) {
	
		$arr = array();
		
		$activities =
			$api->users->listActivity(array(
				'user'=>$userid, 'include'=>'user'
			));
			
		foreach ($activities as $k => $v) {
			// TODO use in query?
			if (strstr($v->type, "like") && $v->object->forum->id == $shortname) {
				
				$arr[] = $v->object->thread->link;
				
			}
		}
		
		echo json_encode($arr);
		
	} elseif (isset($_GET['dofave'])) {
	
		$page = urldecode($_GET['dofave']);
		if (strstr($page, 'http:') == FALSE) {
			$page = $_SERVER['HTTP_REFERER'];
		}

		if (strstr($page, $homepage) == FALSE) {
			die('Invalid request ' . $page);
		}
			
		$threads =
			$api->forums->listThreads(array(
				'forum'=>$shortname, 'thread:link'=>$page
			));

		if (length($threads->response) == 1) {
			$id = $threads->response[0]->$id;
			$api->threads->vote(array(
				'vote'=>1, 'thread'=>$id
			));
			echo('OK');
		}
		echo('Not OK');

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
		
		setcookie('disqus_userid', $tokdata->user_id, $expires);
		setcookie('disqus_token', $tokdata->access_token, $expires);
		setcookie('disqus_refresh', $tokdata->refresh_token, $expires);
	}

	header( 'Location: ' . $homepage );
	
	echo('Thanks, ' . $tokdata->username . '! <a href="' . $homepage . '">Click here to continue</a>');
	
} elseif (isset($_GET['auth'])) {
	
	header( 'Location: https://disqus.com/api/oauth/2.0/authorize/?client_id=' . $PUBLIC_KEY . '&scope=read&response_type=code&redirect_uri=' . $redirect );

}

?>