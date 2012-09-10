<!-- Article: {{ $gimme->article->name }} -->

{{ if $gimme->article->is_twitter }}

	<div class="row commentbox layouttwitter {{ if not $gimme->article->icon or $gimme->article->icon=="" }}without_icon{{ /if }} community-item">
		{{ if $gimme->article->icon }}
			<div class="image"><img src="{{ $gimme->article->icon }}" /></div>
		{{ /if }}
		<a href="{{ $gimme->article->link }}" target="_blank">
			<div class="info_block">
				<div class="author">{{ $gimme->article->who }}</div>
				{{ if $gimme->article->publish_date }}
					<time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</time>
				{{ /if }}
			</div>
			<div class="clear"></div>
			<div class="description">{{ $gimme->article->quote|strip_tags }}</div>
		</a>
		<div class="commentbox-bg"></div>
	
{{ elseif $gimme->article->is_ad }}	

	<div class="row adbox">
		<div class="community-title grey">Anzeige</div>
		<div class="title">{{ $gimme->article->where }}</div>
		<div class="description">{{ $gimme->article->quote|strip_tags }}</div>
		<div class="lists"><a href="{{ $gimme->article->link }}">{{ $gimme->article->who }}</a></div>
	
{{ else }}

	<div class="row commentbox layoutsimple">
		{{ if $gimme->article->icon }}
			<div class="image"><img src="{{ $gimme->article->icon }}" /></div>
		{{ /if }}
		
		{{ if $gimme->article->is_highlight }}
			<a href="{{ $gimme->article->link }}">
				<h1>
					<span>&lsaquo;&lsaquo;</span>
					{{ $gimme->article->quote|strip_tags }}
					<span>&rsaquo;&rsaquo;</span>
				</h1>
			</a>
			<time>
				{{ if $gimme->article->who }}
					schrieb {{ $gimme->article->who }}
				{{ /if }}
				{{ if $gimme->article->publish_date }}
					am {{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }} um 
					{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
				{{ /if }}
			</time>
			
		{{ else }}
			<a href="{{ $gimme->article->link }}">
				<div class="author">{{ $gimme->article->who }}</div>
				<div class="description">{{ $gimme->article->quote|strip_tags }}</div>
			</a>
			{{ if $gimme->article->publish_date }}
				<time>
					schrieb am {{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }} um 
					{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }} zu
				</time>
			{{ /if }}
		{{ /if }}
		
		<div class="community-title white">{{ $gimme->article->where }}</div>
		<div class="commentbox-bg"></div>
		
{{ /if }}

{{ if $gimme->article->is_twitter }}
	<div class="icon icon-twitter-white"></div>
{{ elseif $gimme->article->is_facebook }}
	<div class="icon icon-facebook-white"></div>
{{ /if }}

</div>
