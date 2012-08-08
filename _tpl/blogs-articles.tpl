
<div class="titlebox section-blogs" id="mobile_startpoint">
	<h2><a href="{{ uri options="issue" }}">Blog</a> / </h2><h1><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></h1>
</div>

{{ assign var="articles_on_page" value="10" }}

{{ list_articles order="byPublishDate desc" length="`$articles_on_page`" }}

	<div class="blogbox section-blogs">

		<info>
			<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
			<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date> | 
			Nummer {{ $gimme->article->number }}
		</info>
		<author><a href="#">{{ $gimme->article->author->name }}</a></author>
	
		<div class="blogboxcontent">
			<article>
				<header>
					<div class="title"><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></div>
				</header>
				<description>{{ $gimme->article->full_text->first_paragraph }}</description>
			</article>
		</div>
		
		<div class="weiter"><a href="{{ uri options="article" }}">> weiter lesen</a></div>
		
	</div>
	
	{{ if $gimme->current_list->at_end }}
	
		<!-- Page Navigation -->
		
		{{ $pages=ceil($gimme->current_list->count/$articles_on_page) }}
		{{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
		{{ if $pages gt 1 }}
			<ul class="pagination">
				{{ if $gimme->current_list->has_previous_elements }}<li class="prev"><a href="{{ uripath options="section" }}?{{ urlparameters options="previous_items" }}">Previous</a></li>{{ /if }}
				{{ for $i=0 to $pages - 1 }}
					{{ $curlistid=$i*$articles_on_page }}
					{{ $gimme->url->set_parameter($gimme->current_list_id(),$curlistid) }}
					{{ if $curlistid != $curpage }}
				<li><a href="{{ uripath options="section" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
					{{ else }}
				<li class="selected"><a href="{{ uripath options="section" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
					{{ $remi=$i+1 }}
					{{ /if }}
				{{ /for }}
				{{ if $gimme->current_list->has_next_elements }}<li class="next"><a href="{{ uripath options="section" }}?{{ urlparameters options="next_items" }}">Next</a></li>{{ /if }}
			</ul>
			<div style="clear: both"></div>
			{{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
		{{ /if }}
	
	{{ /if }}
		
{{ /list_articles }}