<!-- Search page template -->

{{ include file="_tpl/_html-head.tpl" }}

<body class="search-page">

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}
        
        <div class="mcontentbar searchform">
        	
        	{{ include file="_tpl/search-content.tpl" }}
	                 
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