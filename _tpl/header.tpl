<div class="row header">

    <div class="row nav">
        <ul>
            <li class="nav-front active"><a href="#">Front</a></li>
            <li class="nav-alltag active"><a href="#">Alltag</a></li>
            <li class="nav-politik active"><a href="#">Politik</a></li>
            <li class="nav-kultur active"><a href="#">Kultur</a></li>
            <li class="nav-fav active"><a href="#">Favoriten</a></li>
            <div class="clear"></div>
        </ul>
    </div>

    <div class="aare">
        Aare<br>
        16&deg;
    </div>
    <date>{{$smarty.now|camp_date_format:"%e.%m.%Y"}} </date>

    <h1 class="logo">
        <a href="/">Journal B</a>
    </h1>

    <div class="search">
        <a href="#"><img src="{{ url static_file='_img/search.png' }}" /></a>
		<div id="search-box" class="hidden">
		{{ search_form template="search.tpl" submit_button="search" }} 
			{{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"keywords\"" }}
		{{ /search_form }}        
		</div>   
    </div>

    <div class="subtitle">die neue digitale Zeitung für Bern</div>
</div>