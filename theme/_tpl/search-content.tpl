{{ list_search_results order="bypublishdate desc" }}
<li>
	<span class="info">
		<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</date>
	</span>
	{{ image rendition="square" }}<img src="{{ $image->src }}" align="left" />{{ /image }}
	<h4><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h4>
	<caption>{{ $gimme->article->deck|truncate:150:"...":true }}</caption>
</li>   
{{ /list_search_results }} 

{{ search_form template="search.tpl" submit_button="Search" button_html_code="id=\"adv-search-button\" class=\"rounded\"" }}

<small><a onclick="$('.search-sections').slideDown();$(this).hide();">Erweitert suchen</a></small>

<div class="search-sections hidden">
{{ local }}
	{{ set_current_issue }}
	{{ list_sections }}
		<input class="radio" name="f_search_section" value="{{ $gimme->section->url_name }}" type="radio">
		<li class="nav-{{ $gimme->section->url_name }} section-{{ $gimme->section->url_name }}"><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></li>
	{{ /list_sections }}
{{ /local }}

<small><a onclick="$('.search-advanced').slideDown();$(this).hide();">Mehr optionen</a></small>
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

<div class="searchbox search-bottom">
	{{ camp_edit object="search" attribute="keywords" }}
</div>
{{ /search_form }}