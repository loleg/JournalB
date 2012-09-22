{{ $tpl_subsections = true }}
{{ include file="_tpl/_html-head.tpl" }}
<!-- article.tpl -->
{{ dynamic }}
<body id="body" class="article-page font{{ $smarty.cookies.fontSize }}">
{{ /dynamic }}

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}

        <div class="row content">
		
	        {{ include file="_tpl/article-content.tpl" }}
            
        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            
			<div class="article-community stable">
				{{ render file="_tpl/article-community.tpl" }}
			</div>
			
            {{ render file="_tpl/community.tpl" section=2 article=0 }}

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
