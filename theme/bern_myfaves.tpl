<!-- Favorites page template -->

{{ $tpl_favorite = true }}

{{ include file="_tpl/_html-head.tpl" }}

<body id="body" class="front-page">

<div class="container">

	<div class="main">

		{{ include file="_tpl/header.tpl" }}

		<div class="row content">

			{{ $view->articles }}
			
		</div><!-- /content -->

	</div><!-- /main -->

	<div class="sidebar">

		{{ include file="_tpl/community-header.tpl" }}

		<div class="row content">
			
			{{ include file="_tpl/community.tpl" }}
			
			{{ include file="_tpl/community-front.tpl" }}

		</div>

	</div>
		
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
