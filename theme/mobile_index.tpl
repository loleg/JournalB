{{php}}
	header('Content-type: application/json');	
{{/php}}

{{ $articles = array() }}

{{ list_articles length="50" constraints="issue greater 2" }}

	{{ if !$articles[$gimme->section->url_name] }} 
		{{ $articles[$gimme->section->url_name] = array() }} 
	{{ /if }}
	
	{{ $article = array() }}
	{{ $article["url"] = {{ uri options="article" }} }}
	{{ $article["title"] = $gimme->article->name }}
	
	{{ $articles[$gimme->section->url_name][] = $article }}
	
{{ /list_articles }}

{{ $view->json($articles)|replace:'\\':'' }}