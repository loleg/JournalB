{{ $escapedName=str_replace(" ", "\ ", $user->author->name) }}

<div class="center_contentbar">
	<div class="titlebox section-front" id="mobile_startpoint">
		<h2><a href="{{ uri options="publication" }}">Artikel</a> / </h2><h1>{{ $user->author->name }}</h1>
	</div>

	{{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="author is $escapedName" order="bypublishdate desc" }}
		{{ include file="_tpl/article-mini.tpl" }}
	{{ /list_articles }}
</div>