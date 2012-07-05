{{assign var="column" value="0"}}

{{ list_articles order="bypublishdate desc" columns="2" constraints="OnSection is on" }}

	{{ if $column%2 == 0 }}<div class="row newsrow">{{ /if }}
	
		{{ include file="_tpl/newsbox-simple.tpl" }}
		
	{{ if $gimme->article->name == "double"}} {{assign var="column" value="`$column+1`"}} {{/if}}
		
	{{ if $column%2 == 1  || $gimme->current_list->at_end}}</div>{{ /if }}
		
	{{assign var="column" value="`$column+1`"}}
	
{{ /list_articles }}

<div class="row newsrow">

    <div class="content-left newsbox section-blogs layoutlist">
        <div class="newsboxcontent">
            <h2>Neuste Blogs</h2>
            <description>
                <div class="dsect">
                    <div><span class="capitalize">ESTER KOLUMNISIKI</span> Der Essiggurke und Dill Geschmack der neuen Terra Chips entstand im Internet.</div>
                    <div class="info"><date>03.5.2012</date> | <time>17:53</time> | Nummer 4 – 2012</div>
                </div>
                <div class="dsect">
                    <div><span class="capitalize">WERNER MANKE</span> Der Essiggurke und Dill Geschmack der neuen Terra Chips entstand im Internet.</div>
                    <div class="info"><date>03.5.2012</date> | <time>17:53</time> | Nummer 4 – 2012</div>
                </div>
            </description>
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
                    <div><span class="capitalize">Wahlen 2012</span> Urs Fischer überholt sogar Alexander Tschäppät</div>
                    <div class="info"><date>03.5.2012</date> | <time>17:53</time> | <author>Marc Lachmann</author></div>
                </div>
                <div class="dsect">
                    <div><span class="capitalize">Bern</span> Die Abfallgebühren steigen ins Unermessliche</div>
                    <div class="info"><date>03.5.2012</date> | <time>17:53</time> | <author>Marc Lachmann</author></div>
                </div>
            </description>
        </div>
    </div>

</div>