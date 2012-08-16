
<div class="titlebox section-dossiers">
	<h2><a href="{{ uri options="issue" }}">Dossiers</a></a></h1>
</div>

{{ assign var="articles_on_page" value="10" }}

{{ list_articles order="byPublishDate desc" length="`$articles_on_page`" }}

	<div class="blogbox {{ if $gimme->current_list->at_end }}last{{ /if }} section-dossiers">

		<info>
			<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
			<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date> | 
			<author>{{ $gimme->article->author->name }}</author>
		</info>
		
		<a href="{{ uri options="article" }}">
		<div class="blogboxcontent">
			<div class="title">{{ $gimme->article->name }}</div>
			<center>{{ $gimme->article->subtitle }}</center>			
		</div>
		</a>
		
	</div>
	
	
	{{ if $gimme->current_list->at_end }}
	
		<!-- Page Navigation -->
		
		{{ $pages=ceil($gimme->current_list->count/$articles_on_page) }}
		{{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
		{{ if $pages gt 1 }}
			<ul class="pagination">
				{{ if $gimme->current_list->has_previous_elements }}<li class="prev"><a href="{{ uripath options="issue" }}?{{ urlparameters options="previous_items" }}">Previous</a></li>{{ /if }}
				{{ for $i=0 to $pages - 1 }}
					{{ $curlistid=$i*$articles_on_page }}
					{{ $gimme->url->set_parameter($gimme->current_list_id(),$curlistid) }}
					{{ if $curlistid != $curpage }}
				<li><a href="{{ uripath options="issue" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
					{{ else }}
				<li class="selected"><a href="{{ uripath options="issue" }}?{{ urlparameters }}">{{ $i+1 }}</a></li>
					{{ $remi=$i+1 }}
					{{ /if }}
				{{ /for }}
				{{ if $gimme->current_list->has_next_elements }}<li class="next"><a href="{{ uripath options="issue" }}?{{ urlparameters options="next_items" }}">Next</a></li>{{ /if }}
			</ul>
			<div style="clear: both"></div>
			{{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
		{{ /if }}
	
	{{ /if }}
	
{{ /list_articles }}