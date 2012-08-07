<!-- Search page template -->

{{ include file="_tpl/_html-head.tpl" }}

<body class="search-page">

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}
        
        <div class="searchbox search-top">
        	<h2>Suchresultate</h2>
		</div>

        <ol class="row content search-cont">

			{{ include file="_tpl/search-cont.tpl" }}
            
        </ol><!-- /content -->
        
         <div class="searchbox search-bottom">
			{{ search_form template="search.tpl" submit_button="suchen" }} 
				{{ camp_edit object="search" attribute="keywords" }}
			{{ /search_form }}
		</div>

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            
            {{ include file="_tpl/community.tpl" }}

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}