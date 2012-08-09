<div class="row newsrow">

    <div class="content-left newsbox section-blogs layoutlist">
        <div class="newsboxcontent">
			{{ local }}
				{{ set_issue number="2" }}
				<h2><a href="{{ url options="issue" }}">Neuste Blogs</a></h2>
				<description>
					{{ list_articles length="3" order="byPublishDate desc" constraints="OnFrontPage is on" ignore_section="true" }}
						<div class="dsect">
						<a href="{{ url options="section" }}">
							<div class="description"><span class="capitalize">{{ $gimme->article->section->name }}</span> {{ $gimme->article->section->description|strip_tags }}</div>
							<div class="info">
								<date>{{ $gimme->article->$publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
								<date>{{ $gimme->article->$publish_date|camp_date_format:"%H:%i" }}</date>
							</div>
						</a>
						</div>
					{{ /list_articles }}
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
					{{ list_articles length="3" order="byPublishDate desc" constraints="OnFrontPage is on" ignore_section="true" }}
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