<!-- Article: {{ $gimme->article->name }} -->

{{ if $gimme->article->is_twitter }}

	<a href="{{ $gimme->article->link }}" class="row commentbox layouttwitter {{ if not $gimme->article->icon or $gimme->article->icon=="" }}without_icon{{ /if }} community-item">
		{{ if $gimme->article->icon }}
			<div class="image"><img src="{{ $gimme->article->icon }}" /></div>
		{{ /if }}
		
		<div class="info_block">
			<div class="author">{{ $gimme->article->who }}</div>
			{{ if $gimme->article->publish_date }}
				<time>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</time>
			{{ /if }}
		</div>
		<div class="clear"></div>
		<div class="description">{{ $gimme->article->quote|strip_tags }}</div>

		<div class="commentbox-bg"></div>
		
		<div class="icon icon-twitter-white"></div>
		
	</a>
	
{{ elseif $gimme->article->is_ad }}	

	<div class="row adbox">
		<div class="community-title grey">Anzeige</div>
		<div class="title">{{ $gimme->article->where }}</div>
		<div class="description">{{ $gimme->article->quote|strip_tags }}</div>
		<div class="lists"><a href="{{ $gimme->article->link }}">{{ $gimme->article->who }}</a></div>
	</div>
	
{{ else }}

	<a class="row commentbox layoutsimple" href="{{ $gimme->article->link }}">
		{{ if $gimme->article->is_highlight }}
			<h1>
				<span>&lsaquo;&lsaquo;</span>
				{{ $gimme->article->quote|strip_tags }}
				<span>&rsaquo;&rsaquo;</span>
			</h1>
			<time>
				{{ if $gimme->article->who }}
					schrieb {{ $gimme->article->who }}
				{{ /if }}
				{{ if $gimme->article->publish_date }}
					am {{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }} um 
					{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
				{{ /if }}
			</time>
			
		{{ else }}
			{{ if $gimme->article->icon }}
				<div class="image"><img src="{{ $gimme->article->icon }}" /></div>
			{{ /if }}
		
			<div class="author">{{ $gimme->article->who }}</div>
			<div class="description">{{ $gimme->article->quote|strip_tags }}</div>
				
			{{ if $gimme->article->publish_date }}
				<time>
					schrieb am {{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }} um 
					{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }} zu
				</time>
			{{ /if }}
		{{ /if }}
		
		<div class="community-title white">{{ $gimme->article->where }}</div>
		<div class="commentbox-bg"></div>
		
	{{ if $gimme->article->is_facebook }}
		<div class="icon icon-facebook-white"></div>
	{{ /if }}
	
	</a>
		
{{ /if }}