{{ if not $gimme->article->author_profile }}
{{ list_article_authors }}
	{{ if $gimme->current_list->at_beginning }}
	<div class="row adbox authorbox">
		<div class="community-title grey underline">Zum Autor</div>
		<description>
	{{ /if }}
		<div class='author-block'>
			<img src="{{ $gimme->author->picture->imageurl }}" class="author-pic">
			<div class="author-name">{{ $gimme->author->name }}</div>
			{{ $gimme->author->biography->text }}
		</div>
	{{ if $gimme->current_list->at_end }}
		</description>
	</div>
	{{ /if }}
{{ /list_article_authors }}
{{ /if }}

{{ if $gimme->article->box!="" }}
	<div class="row adbox community-box">
		{{ $gimme->article->box }}
	</div>
{{ /if }}

{{ list_related_articles }}
	{{ if $gimme->current_list->at_beginning }}
		<div class="row adbox">
			<div class="community-title grey">Weitere Artikel zum Thema</div>
	{{ /if }}
	<p>
	<div class="community-title">
		<a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a>
	</div>
	<div class="info">
	{{ if $publish_date }}
		{{ $publish_date = $gimme->article->publish_date }}
		<date>{{ $publish_date|camp_date_format:"%e.%m.%Y" }}</date> / 
		<time>{{ $publish_date|camp_date_format:"%H:%i" }}</time> /
	{{ /if }}
		<author>{{ $gimme->author->name }}</author>
	</div>
	</p>
	{{ if $gimme->current_list->at_end }}     
		</div>
	{{ /if }}
{{ /list_related_articles }}