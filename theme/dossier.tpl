<!-- Dossier page template -->
{{ php }} if (isset($_COOKIE["HTTP_IS_RETINA"])) $template->assign('retina','_2x'); else $template->assign('retina',''); {{ /php }} 

{{ include file="_tpl/_html-head.tpl" }}

<body id="body" class="section-page">

<div class="container">

    <div class="main">
	
		{{ include file="_tpl/header.tpl" }}

        <div class="row content">

			{{ include file="_tpl/dossier-article-content.tpl" }}
            
        </div><!-- /content -->

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