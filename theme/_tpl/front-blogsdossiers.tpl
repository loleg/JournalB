<div class="content-single newsbox section-blogs layoutlist front-blogs">
	<div class="newsboxcontent">
		<h2><a href="/de/blogs">Neuste Blogs</a></h2>
		<description>
			{{ list_articles length="3" order="byPublishDate desc" constraints="issue is 5 onFrontPage is on" ignore_section="true" ignore_issue="true" }}
				<div class="dsect">
				<a href="{{ url options="section" }}">
					<div class="description">
						<span class="capitalize">{{ $gimme->article->section->name }}</span> 
						<span class="subtitle">{{ $gimme->article->section->description|strip_tags }}</span>
					</div>
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

<div class="content-single newsbox section-dossiers layoutlist front-dossiers">
	<div class="newsboxcontent">
		<h2><a href="/de/dossiers">Aktuelle Dossiers</a></h2>
		<description>
			{{ list_articles length="3" order="byPublishDate desc" constraints="issue is 4" ignore_section="true" ignore_issue="true" }}
				<div class="dsect">
					<a href="{{ url options="article" }}">
						<div class="description">
							<span class="capitalize">{{ $gimme->article->name }}</span> 
							<span class="subtitle">{{ $gimme->article->subtitle|strip_tags }}</span>
						</div>
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