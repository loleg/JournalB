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
	<a href="http://twitter.com/journalb" target="_blank">
	    <div style="float: left; width: 60px;">Follow<br>us on<br>Twitter</div>
    	<div style="float: left; width: 54px; margin-right: 15px; padding-top: 5px;"><img src="{{ url static_file='_img/twitter_.png' }}"/></div>
    </a>
    <a href="http://www.facebook.com/journalb.bern" target="_blank">
	    <div style="float: left; width: 59px;">Join<br>us on<br>Facebook</div>
	    <div style="float: left; width: 40px; padding-top: 5px;"><img src="{{ url static_file='_img/facebook_.png' }}"></div>
    </a>
</div>

<div class="row adbox supportbox">
    <div class="community-title grey">Journal B<br>unterstutzen</div>
    <icon><img src="{{ url static_file='_img/unterstutzen.png' }}" /></icon>
    <div class="spenden">
    	<description>
    		Alle Artikel auf journalB.ch sind frei verfügbar. Wenn Ihnen unsere Arbeit etwas wert ist, nutzen Sie doch die Gelegenheit, uns zu unterstützen. Die Redaktion bedankt sich für Ihren Beitrag.
    	</description>
    	<div class="link"><a href="#" onclick="$(this).parents('.spenden').hide().next().slideDown(); return false;"">Jetzt spenden!</a></div>
    </div>
    <div class="spenden hidden">
    	<description>
    	Praesent dictum porta ante, in congue ante ultrices eu. Pellentesque odio enim, faucibus sit amet.
    	</description>
    	<center><br/>
    		<a href="http://flattr.com" target="_blank"><img src="{{ url static_file='_img/spenden-flattr.png' }}" alt="Flattr this" title="Flattr this"></a>
    		<a href="https://www.paypal.com/"><img src="{{ url static_file='_img/spenden-paypal.gif' }}" alt="Spenden mit PayPal" title="Spenden mit PayPal"></a>
    		<br/>
    		<a href="https://www.yellowpay.ch"><img style="background:black" src="{{ url static_file='_img/spenden-postfinance.gif' }}" alt="Spenden mit PostFinance" title="Spenden mit PostFinance"></a>
    		<br/>
    		<small>Postcheckkonto: PC 80-667-0</small>
    	</center>
    </div>
</div>