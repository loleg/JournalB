{{ include file="_tpl/_html-head.tpl" }}
<!-- search.tpl -->
<body id="body" class="search-page">

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}
        
        <div class="center_contentbar searchform">
        	
        	{{ include file="_tpl/search-content.tpl" }}
	                 
        </div>

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            
            {{ render file="_tpl/community.tpl" section=2 article=0 }}

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
