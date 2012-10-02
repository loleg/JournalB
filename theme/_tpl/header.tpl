<div class="row header">

    <div class="row nav">
        <ul>
			{{ local }}
				{{ $current_section = ""}}
				{{ if $gimme->issue->number > 5 or $gimme->issue->number == 3}} {{ $current_section = $gimme->section->number }} {{ /if }}
				{{ set_current_issue }}
				<li class="nav-front"><a href="/">Front</a></li>
				{{ list_sections }}
					<li class="nav-{{ $gimme->section->url_name }} {{ if $tpl_subsections and $current_section and $gimme->section->number != $current_section }}unactive{{ /if }}"><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></li>
				{{ /list_sections }}
				<li class="nav-fav"><a href="/favorites" style="background-size:0">Favoriten</a></li>
				<div class="clear"></div>
			{{ /local }}
        </ul>
    </div>

    <div class="aare">
        Aare<br><a class="wert" title="Bundesamt für Umwelt" href="http://www.hydrodaten.admin.ch/de/2135.html" target="_blank"></a>&deg;
    </div>
    <time>{{$smarty.now|camp_date_format:"%d.%m.%Y"}} </time>

    <h1 class="logo" onclick="document.location.href='/'">
        <a href="/">Journal B</a>
    </h1>
    
    {{ if !$gimme->search_articles_action->defined }} 
    <div class="search">
    	{{ search_form template="search.tpl" submit_button="Search" button_html_code="class=\"hidden\"" }}
	    	<input type="image" class="icon icon-search" title="Suchen" value="suchen" name="f_search_articles" src="{{ url static_file='_img/search.png' }}" style="display:block" />
	    {{ /search_form }}
    </div>
    {{ /if }}

    <div class="subtitle">Sagt, was Bern bewegt</div>
</div>