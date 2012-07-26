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
								<div class="description"><span class="capitalize"><a href="{{ url options="section" }}">{{ $gimme->section->name }}</a></span> {{ $gimme->section->description|strip_tags }}</div>
								<div class="info">
									<date>{{ $publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
									<date>{{ $publish_date|camp_date_format:"%H:%i" }}</date>
								</div>
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
				{{ set_issue number="2" }}
				<h2><a href="{{ url options="issue" }}">Aktuelle Dossiers</a></h2>
				<description>
					{{ list_sections order="byPublishDate desc" }}
						{{ $publish_date = false }}
						{{ list_articles length="1" order="byPublishDate desc" }} {{ $publish_date = $gimme->article->publish_date }} {{ /list_articles }}
						{{ if $publish_date }}
							<div class="dsect">
								<div class="description"><span class="capitalize"><a href="{{ url options="article" }}">{{ $gimme->article->name }}</a></span> {{ $gimme->article->subtitle|strip_tags }}</div>
								<div class="info">
									<date>{{ $publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
									<time>{{ $publish_date|camp_date_format:"%H:%i" }}</time> | 
									<author>{{ $gimme->article->author->name }}</author>
								</div>
							</div>
						{{ /if }}
					{{ /list_sections }}
				</description>
			{{ /local }} 
        </div>
    </div>

</div>