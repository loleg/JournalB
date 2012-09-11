<div class="row header">

    <div class="row nav">
        <ul>
			{{ local }}
				{{ $current_section = ""}}
				{{ if $gimme->issue->number > 5 or $gimme->issue->number == 1}} {{ $current_section = $gimme->section->number }} {{ /if }}
				{{ set_current_issue }}
				<li class="nav-front"><a href="/">Front</a></li>
				{{ list_sections }}
					<li class="nav-{{ $gimme->section->url_name }} {{ if $current_section != "" and $gimme->section->number != $current_section }}unactive{{ /if }}"><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></li>
				{{ /list_sections }}
				<li class="nav-fav"><a href="#">Favoriten</a></li>
				<div class="clear"></div>
			{{ /local }}
        </ul>
    </div>

    <div class="aare">
        Aare<br><a class="wert" title="Bundesamt für Umwelt" href="http://www.hydrodaten.admin.ch/de/" target="_blank"></a>&deg;
    </div>
    <time>{{$smarty.now|camp_date_format:"%d.%m.%Y"}} </time>

    <h1 class="logo" onclick="document.location.href='/'">
        <a href="/">Journal B</a>
    </h1>
    
    {{ if !$gimme->search_articles_action->search_phrase }} 
    <div class="search">
    	{{ search_form template="search.tpl" submit_button="Search" button_html_code="class=\"hidden\"" }}
	    	<input type="image" class="icon icon-search" title="Suchen" value="suchen" name="f_search_articles" src="{{ url static_file='_img/search.png' }}" />
	    {{ /search_form }}
    </div>
    {{ /if }}

    <div class="subtitle">die neue digitale Zeitung für Bern</div>
</div>