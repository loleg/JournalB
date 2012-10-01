<div style="clear:both"></div>

<div class="footer">

	<div class="footer-sections">
        <ul>
			<li class="nav-front section-front"><a href="/">Front</a></li>
			{{ set_current_issue }}
			{{ list_sections }}
				<li class="nav-{{ $gimme->section->url_name }} section-{{ $gimme->section->url_name }}"><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></li>
			{{ /list_sections }}
		</ul>
    </div>
	
	<div class="footer-box section-blogs">
		<div class="caption"><a href="/de/blogs">Blogs</a></div>
		<ul>
		{{ set_issue number="5" }}
		{{ list_sections order="bynumber desc" length="5" }}
			<li><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></li>
		{{ /list_sections }}
		</ul>
	</div>
	
	<div class="footer-box section-dossiers">
		{{ set_issue number="4" }}
		<div class="caption"><a href="{{ url options="issue" }}">Dossiers</a></div>
		<ul>
		{{ list_articles length="5" order="byPublishDate desc" ignore_section="true" }}
			<li><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></li>
		{{ /list_articles }}
		</ul>
	</div>
	
	<div class="footer-box section-front">
		{{ set_issue number="1" }}
		{{ set_section number="1" }}
		<div class="caption">Journal B</div>
		<ul><li>
		{{ list_articles length="10" order="byPublishDate desc" }}
			<a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a>
			{{ if not $gimme->current_list->at_end }}|{{ /if }}
		{{ /list_articles }}
		</li></ul>
		
		<div class="caption">Services</div>
		<ul><li>
		<a href="/favorites">Favoriten</a> | 
		<a href="#" onclick="$('.header .icon-search').click()">Suche</a> | 
		<a href="http://journalb.disqus.com/community.html?lang=de_formal" class="community-popup">Community</a> | 
		<a href="http://{{ $gimme->publication->site }}/de/static/rss/">RSS</a> | 
		<a href="http://eepurl.com/pgobL">Newsletter</a> | 
		<a href="http://www.facebook.com/journalb.bern">Facebook</a> | 
		<a href="http://twitter.com/journalb">Twitter</a>
		</li></ul>
	</div>
	
	<div style="clear: both"></div>
	
</div>

<div class="partners">
	<span class="caption">PARTNER</span> 
	<a href="http://www.appswithlove.com">Apps with love</a> | 
	<a href="http://www.sourcefabric.org">Sourcefabric</a> | 
	<a href="http://www.radio-gelb-schwarz.ch">Radio Gelb-Schwarz</a>
</div>

<!-- UI asset caching -->
<div class="preload hidden">
	<img src="{{ url static_file='_img/favorite-black.png' }}" height="44" width="44">
	<img src="{{ url static_file='_img/control-favorite-black.png' }}" height="39" width="43">
	<img src="{{ url static_file='_img/control-fontize-black.png' }}" height="39" width="43">
	<img src="{{ url static_file='_img/control-share-black.png' }}" height="39" width="43">
</div>
