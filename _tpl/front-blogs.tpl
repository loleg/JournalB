<div class="row newsrow">

    <div class="content-left newsbox section-blogs layoutlist">
        <div class="newsboxcontent">
			{{ local }}
				{{ set_issue number="2" }}
				<h2><a href="{{ url options="issue" }}">Neuste Blogs</a></h2>
				<description>
					{{ list_sections order="bynumber desc" }}
						{{ $publish_date = false }}
						{{ list_articles length="1" order="byPublishDate desc" }} {{ $publish_date = $gimme->article->publish_date }} {{ /list_articles }}
						{{ if $publish_date }}
							<div class="dsect">
							<a href="{{ url options="section" }}">
								<div class="description"><span class="capitalize">{{ $gimme->section->name }}</span> {{ $gimme->section->description|strip_tags }}</div>
								<div class="info">
									<date>{{ $publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
									<date>{{ $publish_date|camp_date_format:"%H:%i" }}</date>
								</div>
							</a>
							</div>
						{{ /if }}
					{{ /list_sections }}
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
					{{ list_articles length="1" order="byPublishDate desc" ignore_section="true" }}
						{{ $publish_date = $gimme->article->publish_date }} 
						{{ if $publish_date }}
							<div class="dsect">
							<a href="{{ url options="article" }}">
								<div class="description"><span class="capitalize">{{ $gimme->article->name }}</span> {{ $gimme->article->subtitle|strip_tags }}</div>
								<div class="info">
									<date>{{ $publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
									<time>{{ $publish_date|camp_date_format:"%H:%i" }}</time> | 
									<author>{{ $gimme->article->author->name }}</author>
								</div>
							</a>
							</div>
						{{ /if }}
					{{ /list_articles }}
				</description>
			{{ /local }} 
        </div>
    </div>

</div>