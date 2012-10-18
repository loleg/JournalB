{{ include file="_tpl/_html-head.tpl" }}
<!-- section.tpl -->
<body id="body" class="section-page">

<div class="container">

	<div class="main">

		{{ include file="_tpl/header.tpl" }}

		<div class="row content">

			{{ php }} $template->assign('start',$_GET['ls-art0']); {{ /php }}
			
			{{ render file="_tpl/newsrows.tpl" params=$start }}
			
		</div><!-- /content -->

	</div><!-- /main -->

	<div class="sidebar">

		{{ include file="_tpl/community-header.tpl" }}

		<div class="row content">
			
			{{ render file="_tpl/community.tpl" section=2 article=0 }}

		</div>

	</div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
