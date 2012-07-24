<div class="row newsrow">

    <div class="content-left newsbox section-blogs layoutlist">
        <div class="newsboxcontent">
			{{ local }}
				{{ set_issue number="2" }}
				<h2><a href="{{ url options="issue" }}">Neuste Blogs</a></h2>
				<description>
					{{ list_sections order="byPublishDate desc" }}
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
            <h2>Aktuelle Dossiers</h2>
            <description>
                <div class="dsect">
                    <div><span class="capitalize">Reitschule</span> Der Vorplatz wird zum Streitpunkt</div>
                    <div class="info"><date>03.5.2012</date> | <time>17:53</time> | <author>Marc Lachmann</author></div>
                </div>
                <div class="dsect">
                    <div><span class="capitalize">Wahlen 2012</span> Urs Fischer uberholt sogar Alexander Tschappat</div>
                    <div class="info"><date>03.5.2012</date> | <time>17:53</time> | <author>Marc Lachmann</author></div>
                </div>
                <div class="dsect">
                    <div><span class="capitalize">Bern</span> Die Abfallgebuhren steigen ins Unermessliche</div>
                    <div class="info"><date>03.5.2012</date> | <time>17:53</time> | <author>Marc Lachmann</author></div>
                </div>
            </description>
        </div>
    </div>

</div>