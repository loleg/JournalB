{{ search_form template="search.tpl" submit_button="Search" button_html_code="class=\"search-button rounded\"" }}

	<h2 class="search-keywords">
		{{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"Suche...\"" }}
	</h2>
	
	<div class="search-advanced hidden">
		<div class="search-filter">
			<input class="radio" name="f_search_scope" value="content" checked="checked" type="radio"> Inhalt			<input class="radio" name="f_search_scope" value="title" type="radio"> Titel
			<input class="radio" name="f_search_scope" value="author" type="radio"> Autor
		</div>
		<div class="search-date">
			<span class="g-left">von {{ camp_edit object="search" attribute="start_date" }}</span>
			<span class="g-right">bis {{ camp_edit object="search" attribute="end_date" }}</span>
		</div>
	</div>
	
	<div class="lists" style="float:right">
		<a onclick="$('.search-advanced').slideDown();$(this).hide(); return false;" href="#">Suche eingrenzen</a>
	</div>
		
{{ /search_form }}

<ol class="row content search-content">
{{ list_search_results order="bypublishdate desc" }}

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
{{ /list_search_results }}
</ol>