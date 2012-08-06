<!-- Search page template -->

{{ include file="_tpl/_html-head.tpl" }}

<body class="search-page">

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}
        
        <div class="search-top">
        	<h2>Suchresultate für</h2>
			{{ search_form template="search.tpl" submit_button="search" }} 
				{{ camp_edit object="search" attribute="keywords" html_code="placeholder=\"keywords\"" }}
			{{ /search_form }}
		</div>

        <ol class="row content search-cont">

			{{ include file="_tpl/search-cont.tpl" }}
            
        </ol><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        <div class="row header">
            <div class="row nav" align="center">
                <ul><li style="float: none;"><a href="#">Community</a></li></ul>
            </div>
        </div>

        <div class="row content">
            
            {{ include file="_tpl/community.tpl" }}

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}