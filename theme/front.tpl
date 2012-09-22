{{ dynamic }}
{{ $tpl_subsections = true }}
{{ /dynamic }}
{{ include file="_tpl/_html-head.tpl" }}
<!-- front.tpl -->
<body id="body" class="front-page">

<div class="container">

	<div class="main">

		{{ include file="_tpl/header.tpl" }}

		<div class="row content">

			{{ include file="_tpl/newsrows.tpl" condition="OnFrontPage" show_blogs="true" }}
			
		</div><!-- /content -->

	</div><!-- /main -->

	<div class="sidebar">

		{{ include file="_tpl/community-header.tpl" }}

		<div class="row content">
			
			{{ render file="_tpl/community.tpl" section=2 article=0 }}
			
			{{ include file="_tpl/community-front.tpl" }}

		</div>

	</div>
		
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
