{{ include file="_tpl/community-authors.tpl" }}

{{ if $gimme->article->box!="" }}
	<div class="row adbox community-box">
		{{ $gimme->article->box }}
	</div>
{{ /if }}

<div class="row community-buttons">
	<button onclick="document.location='#comments'" class="button-black" type="button">Alle <span/> Kommentare lesen</button>
	<button onclick="document.location='#comments'" class="button-black" type="button">Kommentar zum Artikel verfassen</button>
</div>

{{ list_related_articles }}

	{{ if $gimme->current_list->at_beginning }}
		<div class="row adbox collapse_box">
			<div class="community-title grey collapse_title">Weitere Artikel zum Thema</div>
			<div class="collapse_content">
	{{ /if }}

{{ if $gimme->article->issue->number != 3 && $gimme->article->issue->number != 5 }}
	<p>
	<a href="{{ uri options="article" }}" class="baselink">{{ $gimme->article->name }}</a>
	{{ $publish_date = $gimme->article->publish_date }}
	{{ if $publish_date }}
		<div class="info">
			<date>{{ $publish_date|camp_date_format:"%e.%m.%Y" }}</date> / 
			<time>{{ $publish_date|camp_date_format:"%H:%i" }}</time> /
			<author>{{ $gimme->article->author->name }}
		</div>
	{{ /if }}
	</p>
{{ /if }}

	{{ if $gimme->current_list->at_end }}   
		</div>
		</div>
	{{ /if }}
	
{{ /list_related_articles }}

{{ list_related_articles }}

	{{ if $gimme->article->issue->number == 5 }}
		{{ include file="_tpl/community-item.tpl" }}
	{{ /if }}
	
{{ /list_related_articles }}