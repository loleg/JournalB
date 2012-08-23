{{ assign var="column" value="0" }}
{{ assign var="blogs_on_page" value="10" }}

{{ list_sections order="byNumber desc" length="`$blogs_on_page`" }}

	{{ if $column%2 == 0 }}<div class="row newsrow">{{ /if }}
	
		<div class="{{ if $column%2 == 0 }}content-left{{ else }}content-right{{ /if }} newsbox section-blogs layoutsimple" style="cursor: auto !important;">

			<div class="newsboxcontent">
				<h1><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></h1>
				<description>
					{{ $publish_date = false }}
					{{ list_articles }}
						<p><a href="{{ uri options="article" }}"> - {{ $gimme->article->name }}</a></p>
						{{ if not $publish_date }} {{ $publish_date = $gimme->article->publish_date }} {{ /if }}
					{{ /list_articles }}
				</description>
			</div>

			{{ if $publish_date }}
			<div class="info_block">
				<date>{{ $publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
				<date>{{ $publish_date|camp_date_format:"%H:%i" }}</date> 
			</div>
			{{ else }}
			<div class="info_block">
				No articles published
			</div>
			{{ /if }}
			
		</div>
				
	{{ if $column%2 == 1 || $gimme->current_list->at_end}}</div>{{ /if }}
		
	{{ $column=$column+1 }}
	
	
	
	{{ if $gimme->current_list->at_end }}
	
		<!-- Page Navigation -->
		
		{{ $pages=ceil($gimme->current_list->count/$blogs_on_page) }}
		{{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
		{{ if $pages gt 1 }}
			<ul class="pagination">
				{{ if $gimme->current_list->has_previous_elements }}<li class="prev"><a href="{{ uripath options="publication" }}?{{ urlparameters options="previous_items" }}">Previous</a></li>{{ /if }}
				{{ for $i=0 to $pages - 1 }}
					{{ $curlistid=$i*$blogs_on_page }}
					{{ $gimme->url->set_parameter($gimme->current_list_id(),$curlistid) }}
					{{ if $curlistid != $curpage }}
				<li><a href="{{ uripath options="publication" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
					{{ else }}
				<li class="selected"><a href="{{ uripath options="publication" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
					{{ $remi=$i+1 }}
					{{ /if }}
				{{ /for }}
				{{ if $gimme->current_list->has_next_elements }}<li class="next"><a href="{{ uripath options="publication" }}?{{ urlparameters options="next_items" }}">Next</a></li>{{ /if }}
			</ul>
			<div style="clear: both"></div>
			{{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
		{{ /if }}
	
	{{ /if }}
	
{{ /list_sections }}