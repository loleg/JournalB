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
				<date>{{ $publish_date|camp_date_format:"%d.%m.%Y" }}</date> | 
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
	
{{ /list_sections }}