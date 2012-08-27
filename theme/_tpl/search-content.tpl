{{ search_form template="search.tpl" button_html_code="class=\"hidden\"" }}

	<h2 class="search-keywords">
		{{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"Suche...\"" }}
		<script language="Javascript">
			// Remove header form
			$('.header .search form').remove();
			
			// Put current search query into form
			var sp = '{{ $gimme->search_articles_action->search_phrase }}';
			if (sp != '') { $('.search-keywords input').val(sp); }
			
			// Submit form when clicking on the righthand side
			$('.search-keywords input').click(function(e) { 
				if ($(this).width()*0.99 < e.pageX - $(this).position().left) {
					$(this).parents('form').submit();
				}
			});
		</script>
	</h2>

	<div class="lists" style="text-align:right">
		<a onclick="$('.search-advanced').slideDown();return false;" href="#">Suche eingrenzen</a>
	</div>

	<div class="search-advanced hidden">
		<!-- TODO uncheck when closing -->
		<div class="button-close grey" onclick="$('.search-advanced').hide();$(this).parents('form').find('input[checked]').val('')">X</div>
	
		<ul class="search-dates">
			{{ $lastday = date_create('-1 day') }}
			<li><input class="radio" name="f_search_start_date" value="{{ $lastday->format('Y-m-d') }}" type="radio"> heute</li>
			{{ $lastweek = date_create('-1 week') }}
			<li><input class="radio" name="f_search_start_date" value="{{
$lastweek->format('Y-m-d') }}" type="radio"> letzte Woche</li>
			{{ $lastmonth = date_create('-1 month') }}
			<li><input class="radio" name="f_search_start_date" value="{{
$lastmonth->format('Y-m-d') }}" type="radio"> letzter Monat</li>
			{{ $lastyear = date_create('-1 year') }}
			<li><input class="radio" name="f_search_start_date" value="{{
$lastyear->format('Y-m-d') }}" type="radio"> letztes Jahr</li>
		</ul>
		
		<!--
		<ul class="search-filter">
			<li><input class="checkbox" name="f_search_scope" value="content" checked="checked" type="checkbox"> Inhalt</li>
			<li><input class="checkbox" name="f_search_scope" value="title" type="checkbox"> Titel</li>
			<li><input class="checkbox" name="f_search_scope" value="author" type="checkbox"> Autor</li>
		</ul>
		-->
		
		<ul class="search-filter">
			<li><input class="radio" name="f_search_issue" value="1" type="radio"> Dossier</li>
			<li><input class="radio" name="f_search_issue" value="2" type="radio"> Blog</li>
			<li><input class="radio" name="f_search_issue" value="4" type="radio"> Kolumne</li>
			<li><input class="radio" name="f_search_issue" value="4" type="radio"> Kommentar</li>
		</ul>
		
		<ul class="search-details">
			<li><input class="checkbox" name="f_search_section" value="1" type="checkbox"> Alltag</li>
			<li><input class="checkbox" name="f_search_section" value="2" type="checkbox"> Politik</li>
			<li><input class="checkbox" name="f_search_section" value="3" type="checkbox"> Kultur</li>
		</ul>
	</div>
			
{{ /search_form }}

{{ list_search_results order="bypublishdate desc" }}

	{{ if $gimme->current_list->at_beginning }}
<ol class="row content search-content">
	{{ /if }}
	
{{ if $gimme->article->issue->number != 3 && $gimme->article->issue->number != 5 }}
	
	{{ assign var="article_section" value=$gimme->article->section->url_name }}
	{{ if $gimme->article->issue->number < 6 }}
		{{ $article_section = $gimme->article->issue->url_name }}
	{{ /if }}

	<li>
		<info>
			<time>
				{{ if $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" == $smarty.now|camp_date_format:"%e.%m.%Y"}}
					{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
				{{ else }}
					{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
				{{ /if }}
			</time> | 
			<author>{{ $gimme->article->author->name }}</author>
		</info>
		
		<a href="{{ uri options="article" }}">
			<div class="searchbox section-{{ $article_section }}">
				{{ image rendition="topfront" width="100" height="50" }}
					<img src="{{ $image->src }}" width="100" align="left" />
				{{ /image }}
				<div class="title">
				{{ if $gimme->article->issue->number == 1 }}
					<span>Dossier</span> /
					{{ $gimme->article->name }}
		
				{{ elseif $gimme->article->issue->number == 2 }}
					<span>Blog</span> /
					{{ $gimme->article->section->name }}
		
				{{ elseif $gimme->article->issue->number == 4 }}
					<span>Kolumne</span> /
					{{ $gimme->article->section->name }}
					
				{{ else }}
					{{ $gimme->article->name }}
					
				{{ /if }}
				</div>
			</div>
		</a>
		
		<description>{{ $gimme->article->deck|truncate:150:"...":true }}</description>
	</li>   
{{ /if }}
	
	{{ if $gimme->current_list->at_end }}
</ol>
	{{ /if }}

{{ /list_search_results }}