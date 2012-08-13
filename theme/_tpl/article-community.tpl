{{ include file="_tpl/community-authors.tpl" }}

{{ if $gimme->article->box!="" }}
	<div class="row adbox community-box">
		{{ $gimme->article->box }}
	</div>
{{ /if }}

{{ list_related_articles }}
	{{ if $gimme->current_list->at_beginning }}
		<div class="row adbox collapse_box">
			<div class="community-title grey collapse_title">Weitere Artikel zum Thema</div>
			<div class="collapse_content">
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
	</div>
	</p>
	{{ if $gimme->current_list->at_end }}   
		</div>
		</div>
	{{ /if }}
{{ /list_related_articles }}