<!-- Blog page template -->

{{ include file="_tpl/_html-head.tpl" }}

<body class="section-page">

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
            
            {{ include file="_tpl/community.tpl" }}

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}