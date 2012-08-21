<div class="row newsrow">

    <div class="content-left newsbox section-blogs layoutlist">
        <div class="newsboxcontent">
			{{ local }}
				{{ set_issue number="2" }}
				<h2><a href="{{ url options="issue" }}">Neuste Blogs</a></h2>
				<description>
					{{ $i = 0 }}
					{{ list_sections }}
						{{ list_articles length="1" order="byPublishDate desc" }}
							{{ $sections[$i]["name"] = $gimme->section->name }}
							{{ $sections[$i]["description"] = $gimme->section->description }}
							{{ $sections[$i]["date"] = $gimme->article->publish_date|strtotime }}
							{{ $i = $i + 1 }}
						{{ /list_articles }}
					{{ /list_sections }}
					
					{{ for $a=0 to $i-2 }}
						{{ for $b=0 to $i-2 }}
							{{ if $sections[$b+1]["date"] > $sections[$b]["date"]  }}
								{{ $tmp = $sections[$b] }}
								{{ $sections[$b] = $sections[$b+1] }}
								{{ $sections[$b+1] = $tmp }}
							{{ /if }}
						{{ /for }}
					{{ /for }}
					
					{{ $i = 0 }}
					{{foreach from=$sections item=section}}
						<div class="dsect">
							<a href="{{ url options="section" }}">
								<div class="description"><span class="capitalize">{{ $section["name"] }}</span> {{ $section["description"]|strip_tags }}</div>
								<div class="info">
									<date>{{ $section["date"]|camp_date_format:"%e.%m.%Y" }}</date> | 
									<date>{{ $section["date"]|camp_date_format:"%H:%i" }}</date>
								</div>
							</a>
						</div>
						{{ $i = $i + 1 }}
						{{ if $i == 3 }} {{ break }} {{ /if }}
					{{ /foreach }}
					
				</description>
			{{ /local }} 
        </div>
    </div>

    <div class="content-right newsbox section-dossiers layoutlist">
        <div class="newsboxcontent">
        	{{ local }}
				{{ set_issue number="1" }}
				<h2><a href="{{ url options="issue" }}">Aktuelle Dossiers</a></h2>
				<description>
					{{ list_articles length="3" order="byPublishDate desc" ignore_section="true" }}
						<div class="dsect">
							<a href="{{ url options="article" }}">
								<div class="description"><span class="capitalize">{{ $gimme->article->name }}</span> {{ $gimme->article->subtitle|strip_tags }}</div>
								<div class="info">
									<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
									<time>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</time> | 
									<author>{{ $gimme->article->author->name }}</author>
								</div>
							</a>
						</div>
					{{ /list_articles }}
				</description>
			{{ /local }} 
        </div>
    </div>

</div>