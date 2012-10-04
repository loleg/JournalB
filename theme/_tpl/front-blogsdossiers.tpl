<div class="row newsrow">

	<div class="content-left">
		<div class="content-left newsbox section-blogs layoutlist">
			<div class="newsboxcontent">
				<h2><a href="/de/blogs">Neuste Blogs</a></h2>
				<description>
					{{ list_articles length="3" order="byPublishDate desc" constraints="issue is 5 onFrontPage is on" ignore_section="true" ignore_issue="true" }}
						<div class="dsect">
						<a href="{{ url options="section" }}">
							<div class="description"><span class="capitalize">{{ $gimme->article->section->name }}</span> {{ $gimme->article->section->description|strip_tags }}</div>
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

	<div class="content-right">
		<div class="newsbox section-dossiers layoutlist">
			<div class="newsboxcontent">
				<h2><a href="/de/dossiers">Aktuelle Dossiers</a></h2>
				<description>
					{{ list_articles length="3" order="byPublishDate desc" constraints="issue is 4" ignore_section="true" ignore_issue="true" }}
						<div class="dsect">
							<a href="{{ url options="article" }}">
								<div class="description"><span class="capitalize">{{ $gimme->article->name }}</span> {{ $gimme->article->subtitle|strip_tags }}</div>
								<div class="info">
									<date>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</date> | 
									<time>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</time>
								</div>
							</a>
						</div>
					{{ /list_articles }}
				</description>
			</div>
		</div>
	</div>

</div>