
<div class="controlbar_mobile">
    {{ if !$gimme->search_articles_action->defined }} 
    <div class="search">
    	{{ search_form template="search.tpl" submit_button="Search" button_html_code="class=\"hidden\"" }}
	    	<input type="image" class="icon icon-search" title="Suchen" value="suchen" name="f_search_articles" src="{{ url static_file='_img/search.png' }}" style="display:block" />
	    {{ /search_form }}
    </div>
    {{ /if }}

	<div class="aare">
        Aare<br><span class="wert"></span>&deg;
    </div>
    
    <h1 class="logo" onclick="document.location.href='/'">
        <a href="/">Journal B</a>
    </h1>
    
    <br clear="all"/>
</div>