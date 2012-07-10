{{ assign var="column" value="0" }}
{{ assign var="articles_on_page" value="10" }}

{{ list_articles order="bycustom.num.highlight.0 desc byPublishDate desc" ignore_issue="true" constraints="OnSection is on" length="`$articles_on_page`" }}

	{{ if $column%2 == 0 }}<div class="row newsrow">{{ /if }}
	
		{{ if $gimme->article->frontpage_doubleview }}
		
			{{ if $column%2 == 1 || $gimme->current_list->at_end}}</div><div class="row newsrow">{{ /if }}
			{{ include file="_tpl/newsbox-double.tpl" }}
			{{ $column=$column+1 }}
			
		{{ elseif $gimme->article->frontpage_image }}
		
			{{ include file="_tpl/newsbox-bgimage.tpl" }}
		
		{{ else }}
		
			{{ include file="_tpl/newsbox-simple.tpl" }}
			
		{{ /if }}
				
	{{ if $column%2 == 1 || $gimme->current_list->at_end}}</div>{{ /if }}
		
	{{ $column=$column+1 }}
	
	
	
	{{ if $gimme->current_list->at_end }}
	
		<!-- Page Navigation -->
		
		{{ $pages=ceil($gimme->current_list->count/$articles_on_page) }}
		{{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
		{{ if $pages gt 1 }}
			<ul class="pagination">
				{{ if $gimme->current_list->has_previous_elements }}<li class="prev"><a href="{{ uripath options="publication" }}?{{ urlparameters options="previous_items" }}">Previous</a></li>{{ /if }}
				{{ for $i=0 to $pages - 1 }}
					{{ $curlistid=$i*$articles_on_page }}
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
	
{{ /list_articles }}