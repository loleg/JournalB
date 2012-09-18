<!-- Dossier page template -->

{{ include file="_tpl/_html-head.tpl" }}

<body id="body" class="section-page">

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
				{{ include file="_tpl/page-community.tpl" }}
			</div>
			
            {{ include file="_tpl/community.tpl" }}

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}