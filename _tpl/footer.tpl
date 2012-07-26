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
		<div class="caption"><a href="#">Dossiers</a></div>
		<ul>
			<li><a href="#">Wahlen 2012</a></li>
			<li><a href="#">Nachtleben</a></li>
			<li><a href="#">Bern baut</a></li>
			<li><a href="#">KonzertTheater</a></li>
			<li><a href="#">Universitat und</a></li>
			<li><a href="#">Hochschulen</a></li>
		</ul>
	</div>
	
	<div class="footer-box section-front">
		<div class="sect">
			<div class="caption">Journal B</div>
			<a href="#">Verein & AG</a> | 
			<a href="#">Werbung</a> | 
			<a href="#">AGB & Datenschutz</a> | 
			<a href="#">Impressum</a> | 
			<a href="#">Hilfe</a> | 
			<a href="#">Kontakt</a> | 
			<a href="#">Dialogkultur & Netiquette</a>
		</div>
		
		<div class="sect">
			<div class="caption">Services</div>
			<a href="#">Favoriten</a> | 
			<a href="#">Archiv</a> | 
			<a href="#">Community</a> | 
			<a href="#">RSS</a> | 
			<a href="#">Newsletter</a> | 
			<a href="#">Facebook</a> | 
			<a href="#">Twitter</a>
		</div>
	</div>
	
	<div style="clear: both"></div>
	
</div>

<div class="partners">
	<span class="caption">PARTNER</span> 
	<a href="#">Apps width love</a> | 
	<a href="#">Sourcefabric</a> | 
	<a href="#">Radio Gelb-Schwarz</a>
</div>