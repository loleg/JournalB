<!-- Start community feed -->
{{ list_articles length="30" order="byPublishDate desc" constraints="issue is 5 type is fweet" ignore_section="true" ignore_issue="true" }} 

<!-- Article: {{ $gimme->article->name }} -->

{{ if $gimme->article->is_twitter }}

<div class="row commentbox layouttwitter">
	{{ if $gimme->article->icon }}
		<div class="image"><img src="{{ $gimme->article->icon }}" /></div>
	{{ /if }}
	<a href="{{ $gimme->article->link }}" target="_blank">
		<info>
			<author>{{ $gimme->article->who }}</author>
			{{ if $gimme->article->publish_date }}
				<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</date>
			{{ /if }}
		</info>
		<div class="clear"></div>
		<description>{{ $gimme->article->quote|strip_tags }}</description>
	</a>
	<div class="bg"><img src="{{ url static_file='_img/commentbox.png' }}" /></div>
	
{{ elseif $gimme->article->is_ad }}	

<div class="row adbox">
	<div class="community-title grey">Anzeige</div>
	<title>{{ $gimme->article->where }}</title>
	<description>{{ $gimme->article->quote|strip_tags }}</description>
	<div class="lists"><a href="{{ $gimme->article->link }}">{{ $gimme->article->who }}</a></div>
	
{{ else }}

<div class="row commentbox layoutsimple">
	{{ if $gimme->article->icon }}
		<div class="image"><img src="{{ $gimme->article->icon }}" /></div>
	{{ /if }}
	<a href="{{ $gimme->article->link }}">
		<author>{{ $gimme->article->who }}</author>
		<description>{{ $gimme->article->quote|strip_tags }}</description>
		{{ if $gimme->article->publish_date }}
			<date>
				schrieb am {{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }} um 
				{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }} zu
			</date>
		{{ /if }}
	</a>
	<div class="community-title white">{{ $gimme->article->where }}</div>
	<div class="bg"><img src="{{ url static_file='_img/commentbox.png' }}" /></div>

{{ /if }}

{{ if $gimme->article->is_twitter }}
	<icon><img src="{{ url static_file='_img/twitter.png' }}" /></icon>
{{ elseif $gimme->article->is_facebook }}
	<icon><img src="{{ url static_file='_img/facebook.png' }}"></icon>
{{ /if }}

</div>

{{ /list_articles }}
<!-- End community feed -->

<div class="row socialbox">
    <div style="float: left; width: 60px;"><a href="http://twitter.com/journalb">Follow<br>us on<br>Twitter</a></div>
    <div style="float: left; width: 54px; margin-right: 15px; padding-top: 5px;"><a href="http://twitter.com/journalb"><img src="{{ url static_file='_img/twitter_.png' }}"/></a></div>
    <div style="float: left; width: 59px;"><a href="http://www.facebook.com/journalb.bern">Join<br>us on<br>Facebook</a></div>
    <div style="float: left; width: 40px; padding-top: 5px;"><a href="http://www.facebook.com/journalb.bern"><img src="{{ url static_file='_img/facebook_.png' }}"></a></div>
</div>

<div class="row adbox supportbox">
    <div class="community-title grey">Journal B<br>unterstutzen</div>
    <icon><img src="{{ url static_file='_img/unterstutzen.png' }}" /></icon>
    <description>Alle Artikel auf journalB.ch sind frei verfügbar. Wenn Ihnen unsere Arbeit etwas wert ist, nutzen Sie doch die Gelegenheit, uns zu unterstützen. Die Redaktion bedankt sich für Ihren Beitrag.</description>
    <div class="link"><a href="#">Per SMS spenden!</a></div>
</div>