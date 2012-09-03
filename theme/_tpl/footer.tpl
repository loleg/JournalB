<div style="clear:both"></div>

<div class="footer">

	<div class="footer-sections">
        <ul>
			{{ local }}
				{{ set_current_issue }}
				<li class="nav-front section-front"><a href="/">Front</a></li>
				{{ list_sections }}
					<li class="nav-{{ $gimme->section->url_name }} section-{{ $gimme->section->url_name }}"><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></li>
				{{ /list_sections }}
			{{ /local }}
        </ul>
    </div>
	
	<div class="footer-box section-blogs">
		{{ local }}
			{{ set_issue number="2" }}
			<div class="caption"><a href="{{ url options="issue" }}">Blogs</a></div>
			<ul>
			{{ list_sections order="bynumber desc" length="5" }}
				<li><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></li>
			{{ /list_sections }}
			</ul>
		{{ /local }} 
	</div>
	
	<div class="footer-box section-dossiers">
		{{ local }}
			{{ set_issue number="1" }}
			<div class="caption"><a href="{{ url options="issue" }}">Dossiers</a></div>
			<ul>
			{{ list_articles length="5" order="byPublishDate desc" ignore_section="true" }}
				<li><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></li>
			{{ /list_articles }}
			</ul>
		{{ /local }} 
	</div>
	
	<div class="footer-box section-front">
		{{ local }}
			{{ set_issue number="3" }}
			{{ set_section number="1" }}
			<div class="caption">Journal B</div>
			<ul><li>
			{{ list_articles length="5" order="byPublishDate desc" }}
				<a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a>
				{{ if not $gimme->current_list->at_end }}|{{ /if }}
			{{ /list_articles }}
			</li></ul>
		{{ /local }}
		
		<div class="caption">Services</div>
		<ul><li>
		<a href="#">Favoriten</a> | 
		<a href="#">Archiv</a> | 
		<a href="#">Community</a> | 
		<a href="#">RSS</a> | 
		<a href="#">Newsletter</a> | 
		<a href="http://www.facebook.com/journalb.bern">Facebook</a> | 
		<a href="http://twitter.com/journalb">Twitter</a>
		</li></ul>
	</div>
	
	<div style="clear: both"></div>
	
</div>

<div class="partners">
	<span class="caption">PARTNER</span> 
	<a href="#">Apps with love</a> | 
	<a href="#">Sourcefabric</a> | 
	<a href="#">Radio Gelb-Schwarz</a>
</div>

<!-- UI asset caching -->
<div class="preload hidden">
	<div class="newsbox"><a class="favorite checked"></a></div>
	<div class="controlicon share checked"></div>
	<div class="controlicon fontize checked"></div>
	<div class="controlicon favorite checked"></div>
</div>