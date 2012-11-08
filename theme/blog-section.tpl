{{ include file="_tpl/_html-head.tpl" }}
<!-- blog-section.tpl -->
<body id="body" class="section-page">
{{ include file="_tpl/detect-fontsize.tpl" }}

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}

        <div class="row content">

			{{ include file="_tpl/mobile-controlbar.tpl" }}
		
			<div class="addbar">
				{{ include file="_tpl/control-icons.tpl" }}
			</div>
			
			<div class="contentbar">
				{{ php }} $template->assign('start',$_GET['ls-art0']); {{ /php }}
				{{ render file="_tpl/blogs-articles.tpl" params=$start }}
			</div>
            
        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            
			{{ include file="_tpl/community-sectionbox.tpl" }}	
			
            <div id="community"></div>

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
