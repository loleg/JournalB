<!-- Front page template -->

{{ include file="_tpl/_html-head.tpl" }}

<body class="front-page">

<div class="container">

	<div class="main">

		{{ include file="_tpl/header.tpl" }}

		<div class="row content">

			{{ include file="_tpl/newsrows.tpl" condition="OnFrontPage is on" show_blogs="true" }}
			
		</div><!-- /content -->
		
		{{ include file="_tpl/main-footer.tpl" }}

	</div><!-- /main -->

	<div class="sidebar">

		<div class="row header">
			<div class="row nav" align="center">
				<ul><li style="float: none;"><a href="#">Community</a></li></ul>
			</div>
		</div>

		<div class="row content">
			
			{{ include file="_tpl/community.tpl" }}

		</div>

	</div>
		
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
