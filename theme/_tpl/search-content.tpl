{{ search_form template="search.tpl" button_html_code="class=\"submit-button\"" }}

	<h2 class="search-keywords">
		{{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"Suche...\"" }}
		<script type="text/javascript">page="search";</script>
	</h2>

	<div class="lists" style="text-align:right">
		<a onclick="$('.search-advanced').slideDown();return false;" href="#">Suche eingrenzen</a>
	</div>

	<div class="search-advanced hidden">
		<!-- TODO uncheck when closing -->
		<div class="button-close grey" onclick="$('.search-advanced').hide();$(this).parents('form').find('input[checked]').val('')">X</div>
	
		<ul class="search-dates">
			{{ $lastday = date_create('-1 day') }}
			<li><input class="radiobox" name="f_search_start_date" value="{{ $lastday->format('Y-m-d') }}" type="checkbox"> heute</li>
			{{ $lastweek = date_create('-1 week') }}
			<li><input class="radiobox" name="f_search_start_date" value="{{
$lastweek->format('Y-m-d') }}" type="checkbox"> letzte Woche</li>
			{{ $lastmonth = date_create('-1 month') }}
			<li><input class="radiobox" name="f_search_start_date" value="{{
$lastmonth->format('Y-m-d') }}" type="checkbox"> letzter Monat</li>
			{{ $lastyear = date_create('-1 year') }}
			<li><input class="radiobox" name="f_search_start_date" value="{{
$lastyear->format('Y-m-d') }}" type="checkbox"> letztes Jahr</li>
		</ul>
		
		<!--
		<ul class="search-filter">
			<li><input class="radiobox" name="f_search_scope" value="content" checked="checked" type="checkbox"> Inhalt</li>
			<li><input class="radiobox" name="f_search_scope" value="title" type="checkbox"> Titel</li>
			<li><input class="radiobox" name="f_search_scope" value="author" type="checkbox"> Autor</li>
		</ul>
		-->
		
		<ul class="search-issue">
			<li><input class="radiobox" name="f_search_issue" value="1" type="checkbox"> Dossier</li>
			<li><input class="radiobox" name="f_search_issue" value="2" type="checkbox"> Blog</li>
			<li><input class="radiobox" name="f_search_issue" value="4" type="checkbox"> Kolumne</li>
			<li><input class="radiobox" name="f_search_issue" value="4" type="checkbox"> Kommentar</li>
		</ul>
		
		<ul class="search-section">
			<li><input class="radiobox" name="f_search_section" value="1" type="checkbox"> Alltag</li>
			<li><input class="radiobox" name="f_search_section" value="2" type="checkbox"> Politik</li>
			<li><input class="radiobox" name="f_search_section" value="3" type="checkbox"> Kultur</li>
		</ul>
	</div>
			
{{ /search_form }}

{{ list_search_results order="bypublishdate desc" }}

	{{ if $gimme->current_list->at_beginning }}
		<ol class="row content search-content">
	{{ /if }}

		{{ include file="_tpl/article-mini.tpl" }}
	
	{{ if $gimme->current_list->at_end }}
		</ol>
	{{ /if }}

{{ /list_search_results }}