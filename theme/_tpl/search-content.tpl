<div class="searchform">
        	
{{ search_form template="search.tpl" submit_button="Search" button_html_code="class=\"search-button rounded\"" }}

	<h2 class="search-keywords">
		{{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"Suche...\"" }}
	</h2>
		
	<div class="search-sections nav hidden">
		<ul>
		{{ local }}
			{{ set_current_issue }}
			{{ list_sections }}
				<input class="radio hidden" name="f_search_section" value="{{ $gimme->section->url_name }}" type="radio">
				<li class="nav-{{ $gimme->section->url_name }} active" onclick="$(this).prev().click();return false"><a href="#">{{ $gimme->section->name }}</a></li>
			{{ /list_sections }}
		{{ /local }}	
		</ul>
		<div class="lists" style="float:right">
			<a onclick="$('.search-advanced').slideDown();$(this).hide();">Mehr optionen</a>
		</div>
	</div>
	
	<div class="search-advanced hidden">
		<div class="search-filter">
			<label>Suchen nach:</label>
			<input class="radio" name="f_search_scope" value="content" checked="checked" type="radio"> Inhalt         	<input class="radio" name="f_search_scope" value="title" type="radio"> Titel
			<input class="radio" name="f_search_scope" value="author" type="radio"> Autor
		</div>
		<div class="search-date">
			<label>Datum:</label>
			<span class="g-left">von {{ camp_edit object="search" attribute="start_date" }}</span>
			<span class="g-right">bis {{ camp_edit object="search" attribute="end_date" }}</span>
		</div>
	</div>
	
	<div class="lists" style="float:right">
		<a onclick="$('.search-sections').slideDown();$(this).hide(); return false;" href="#">Suche eingrenzen</a>
	</div>
		
{{ /search_form }}
</div>

<ol class="row content search-content">

{{ list_search_results order="bypublishdate desc" }}
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
			<div class="searchbox section-{{ $gimme->article->section->url_name }}">
				{{ image rendition="topfront" width="100" height="50" }}
					<img src="{{ $image->src }}" width="100" align="left" />
				{{ /image }}
				<title>{{ $gimme->article->name }}</title>
			</div>
		</a>
		
		<description>{{ $gimme->article->deck|truncate:150:"...":true }}</description>
	</li>   
{{ /list_search_results }} 
    
</ol>