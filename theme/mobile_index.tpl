{{php}}
	header('Content-type: application/json');	
{{/php}}

{{ $articles = array() }}
{{ $i = 0 }}

{{ list_articles length="50" }}
	{{ $articles[$i] = array() }}
	{{ $articles[$i]["url"] = {{ uri options="article" }} }}
	{{ $articles[$i]["title"] = $gimme->article->name }}
	{{ $i = $i + 1}}
{{ /list_articles }}

{{ php }}	
	$data = array();
	$data["articles"] = $template->getTemplateVars('articles');
	
	$json = json_encode($data);
	$json = str_replace('\\','',$json);

	echo $json; 
{{ /php }}