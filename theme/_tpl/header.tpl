<div class="row header">

    <div class="row nav">
        <ul>
			{{ local }}
				{{ $current_section = ""}}
				{{ if $gimme->issue->number > 5 or $gimme->issue->number == 1}} {{ $current_section = $gimme->section->number }} {{ /if }}
				{{ set_current_issue }}
				<li class="nav-front active"><a href="/">Front</a></li>
				{{ list_sections }}
					<li class="nav-{{ $gimme->section->url_name }} {{ if $current_section == "" or $gimme->section->number == $current_section }}active{{ /if }}"><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></li>
				{{ /list_sections }}
				<li class="nav-fav active"><a href="#">Favoriten</a></li>
				<div class="clear"></div>
			{{ /local }}
        </ul>
    </div>

    <div class="aare">
        Aare<br>
        <span class="wert"></span>&deg;
    </div>
    <date>{{$smarty.now|camp_date_format:"%e.%m.%Y"}} </date>

    <h1 class="logo">
        <a href="/">Journal B</a>
    </h1>
    
    <div class="search">
        <a href="#"><img src="{{ url static_file='_img/search.png' }}" /></a>
		<div id="search-box" class="hidden">
		{{ search_form template="search.tpl" submit_button="suchen" }} 
			{{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"\"" }}
		{{ /search_form }}        
		</div>
    </div>

    <div class="subtitle">die neue digitale Zeitung für Bern</div>
</div>