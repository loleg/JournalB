{{ include file="_tpl/_html-head.tpl" }}
<!-- page.tpl -->
{{ dynamic }}
<body id="body" class="section-page font{{ $smarty.cookies.fontSize }}">
{{ /dynamic }}

<div class="container">

    <div class="main">
	
		{{ include file="_tpl/header.tpl" }}

        <div class="row content">

			{{ include file="_tpl/page-content.tpl" }}
            
        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            
            <div class="article-community stable">
				{{ include file="_tpl/page-community.tpl" }}
			</div>
			
            <div id="community">

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
