{{ include file="_tpl/_html-head.tpl" }}
<!-- front.tpl -->
<body id="body" class="front-page">

<div class="container">

	<div class="main">

		{{ include file="_tpl/header.tpl" }}
		
		<div class="row content">
		
			{{ include file="_tpl/mobile-controlbar-front.tpl" }}

			{{ php }} $template->assign('start',$_GET['ls-art0']); {{ /php }}
			{{ php }} $template->assign('start2',$_GET['ls-art1']); {{ /php }}
			{{ $param = $start|cat:$start2 }} 
			{{ render file="_tpl/newsrows.tpl" params="{{ $param }}" }}
			
		</div><!-- /content -->

	</div><!-- /main -->

	<div class="sidebar">

		{{ include file="_tpl/community-header.tpl" }}

		<div class="row content">
			
			<div id="community">
			
			{{ include file="_tpl/community-front.tpl" }}

		</div>

	</div>
		
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
