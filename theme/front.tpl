<!-- Front page template -->

{{ include file="_tpl/_html-head.tpl" }}

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
			
			{{ include file="_tpl/community.tpl" }}
			
			{{ list_articles ignore_issue="true" ignore_section="true" constraints="type is page issue is 3 section is 2" }}
			<div class="row adbox recommendbox">
			    <div class="community-title grey">{{ $gimme->article->name }}</div>
			    <div class="description">{{ $gimme->article->full_text }}</div>
			</div>
			{{ /list_articles }}

		</div>

	</div>
		
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}
