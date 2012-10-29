{{php}}
	header('Content-type: application/json');	
{{/php}}

{{ $sections = array() }}
{{ $articles = array() }}

{{ list_articles length="50" constraints="issue greater 2" }}

	{{ if $gimme->section->url_name == "alltag" or $gimme->section->url_name == "politik" or $gimme->section->url_name == "kultur" }}

		{{ if !$articles[$gimme->section->url_name] }} 
			{{ $articles[$gimme->section->url_name] = array() }} 
		{{ /if }}
		
		{{ $article = array() }}
		{{ $article["url"] = {{ uri options="article" }} }}
		{{ $article["title"] = $gimme->article->name }}
		{{ $article["time"] = $gimme->article->publish_date|strtotime }}
		{{ $articles[$gimme->section->url_name][] = $article }}
		
		{{ if !$sections[$gimme->section->url_name] }} 
			{{ $sections[$gimme->section->url_name] = array() }}
			{{ $sections[$gimme->section->url_name]["url"] = {{ uri options="section" }} }}
			{{ $sections[$gimme->section->url_name]["title"] = $gimme->section->name }}
			{{ $sections[$gimme->section->url_name]["time"] = $smarty.now }}
		{{ /if }}
		
	{{ /if }}
	
{{ /list_articles }}

{{ $sections["front"] = array() }}
{{ $sections["front"]["url"] = "/" }}
{{ $sections["front"]["title"] = "Front" }}
{{ $sections["front"]["time"] = $smarty.now }}

{{ $articles["sections"] = array() }}
{{foreach from=$sections item=section}}
    {{ $articles["sections"][] = $section }}
{{/foreach}}

{{ $view->json($articles)|replace:'\\':'' }}