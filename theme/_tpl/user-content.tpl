{{ if $user->isAuthor() }}
	{{ $escapedName=str_replace(" ", "\ ", $user->author->name) }}
{{ /if }}


<div class="center_contentbar">
	<div class="titlebox section-front" id="mobile_startpoint">
		<h2><a href="{{ uri options="publication" }}">Artikel</a> / </h2><h1>{{ $user->author->name }}</h1>
	</div>

	{{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="author is $escapedName" order="bypublishdate desc" }}
		{{ if $gimme->issue->number == 1 }}
			{{ include file="_tpl/itembox-dossier.tpl" }}
		{{ else }}
			{{ include file="_tpl/itembox-simple.tpl" }}
		{{ /if }}
	{{ /list_articles }}
</div>