{{ assign var="column" value="0" }}
{{ assign var="blogs_on_page" value="10" }}

{{ list_sections order="byNumber desc" length="`$blogs_on_page`" }}

	{{ if $column%2 == 0 }}<div class="row newsrow">{{ /if }}
	
		<div class="{{ if $column%2 == 0 }}content-left{{ else }}content-right{{ /if }}">
			<div class="newsbox section-blogs layoutsimple" style="cursor: auto !important;">

				<div class="newsboxcontent">
					<h1><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></h1>
					<description>
						{{ $publish_date = false }}
						{{ list_articles length="3" }}
							<div class="dsect">
							<a href="{{ url options="article" }}">
								<div class="description"><span class="capitalize">{{ $gimme->article->author->name }}</span> {{ $gimme->article->name }}</div>
								<div class="info">
									<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
									<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date>
								</div>
							</a>
							</div>
						{{ /list_articles }}
					</description>
				</div>
				
			</div>
		</div>
				
	{{ if $column%2 == 1 || $gimme->current_list->at_end}}</div>{{ /if }}
		
	{{ $column=$column+1 }}
	
{{ /list_sections }}