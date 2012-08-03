{{ list_search_results order="bypublishdate desc" }}

	<div style="margin-bottom: 10px">
		<h3><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h3>
		{{ $gimme->section->name }}
	</div>
               
{{ /list_search_results }} 