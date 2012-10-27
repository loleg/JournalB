{{ include file="_tpl/_html-head.tpl" }}
<!-- blog-section.tpl -->
{{ dynamic }}
<body id="body" class="section-page  font{{ $smarty.cookies.fontSize }}">
{{ /dynamic }}

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}

        <div class="row content">

			{{ include file="_tpl/mobile-controlbar.tpl" }}
		
			<div class="addbar">
				{{ include file="_tpl/control-icons.tpl" }}
			</div>
			
			<div class="contentbar">
				{{ include file="_tpl/blogs-articles.tpl" }}
			</div>
            
        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            
			{{ include file="_tpl/community-sectionbox.tpl" }}	
			
            {{ render file="_tpl/community.tpl" section=2 article=0 }}

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
