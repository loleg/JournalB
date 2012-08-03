<!-- Article page template -->

{{ include file="_tpl/_html-head.tpl" }}

<body class="article-page">

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}

        <div class="row content">
			
			{{ include file="_tpl/mobile-controlbar.tpl" }}
				
			{{ include file="_tpl/blog-article-addbar.tpl" }}	
				
	        {{ include file="_tpl/blog-article-content.tpl" }}
            
        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        <div class="row header">
            <div class="row nav" align="center">
                <ul><li style="float: none;">Community</li></ul>
            </div>
        </div>

        <div class="row content">
            			
            {{ include file="_tpl/community.tpl" }}

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}