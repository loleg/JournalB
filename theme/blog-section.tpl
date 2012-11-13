{{ include file="_tpl/_html-head.tpl" }}
<!-- blog-section.tpl -->
<body id="body" class="section-page">
{{ include file="_tpl/detect-fontsize.tpl" }}

<div class="prevent-horizontal-scroll">
<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}

        <div class="row content">

			{{ include file="_tpl/mobile-controlbar.tpl" }}
		
			<div class="addbar">
				{{ include file="_html/control-icons.html" }}
			</div>
			
			<div class="contentbar">
				{{ include file="_html/control-sharebox.html" }}
			
				{{ include file="_tpl/blogs-articles.tpl" }}
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
</div>

{{ include file="_tpl/_html-foot.tpl" }}
