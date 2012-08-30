{{ search_form template="search.tpl" button_html_code="class=\"submit-button\"" }}

	<h2 class="search-keywords">
		{{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"Suche...\"" }}
		<script language="Javascript">
		$(document).ready(function() {
		
			// Remove header form
			$('.header .search form').remove();
			var searchform = $('.main .searchform form');
			
			// Put current search query into form
			var sp = '{{ $gimme->search_articles_action->search_phrase }}';
			if (sp != '') { $('.search-keywords input').val(sp); }
			
			// Submit form when clicking on icon
			$('.search-keywords', searchform).prepend($('.submit-button', searchform));
			
			// Allow only one checkbox per field
			$('input.radiobox', searchform).click(function() {
				$(this).parent().siblings().find('input.radiobox').removeAttr('checked');
			});
			
			// Check advanced field submission
			var adv = $('.search-advanced'),
				adv_date = '{{ $smarty.post.f_search_start_date }}',
				adv_issue = '{{ $gimme->search_articles_action->search_issue }}',
				adv_section = '{{ $gimme->search_articles_action->search_section }}';
			if (adv_date + adv_issue + adv_section != '') {
				$('.search-dates input[value="' + adv_date + '"]').attr('checked', 'checked');
				$('.search-issue input[value="' + adv_issue + '"]').attr('checked', 'checked');
				$('.search-section input[value="' + adv_section + '"]').attr('checked', 'checked');
				adv.show();
			}
			
			// Submit when selecting advanced
			/*
			adv.find('input').change(function() {
				searchform.submit();
			});
			*/
			
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
		
		<description>{{ $gimme->article->deck|strip_tags|truncate:150:"...":true }}</description>
	</li>   
{{ /if }}
	
	{{ if $gimme->current_list->at_end }}
</ol>
	{{ /if }}

{{ /list_search_results }}