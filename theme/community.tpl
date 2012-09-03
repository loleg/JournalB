<!-- Article page template -->

{{ include file="_tpl/_html-head.tpl" }}

<body id="body" class="article-page">

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}

        <div class="row content">
	        
        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar preview">
    
        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
			
            {{ include file="_tpl/community-item.tpl" }}

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}