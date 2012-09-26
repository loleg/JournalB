{{ include file="_tpl/_html-head.tpl" }}
<!-- favorites_index.tpl -->
<body id="body" class="front-page">

<div class="container">

	<div class="main">

		{{ include file="_tpl/header.tpl" }}

		<div class="row content">		

{{ if $view->articles }}

{{ assign var="column" value="0" }}
{{ assign var="articles_num" value="0" }}
{{ assign var="articles_num_stock" value="0" }}

{{ foreach $view->articles as $article }}

	{{ if $column%2 == 0 }}
		<div class="row newsrow"><div class="content-left">
	{{ else }}
		<div class="content-right">
	{{ /if }}

	{{ $article_section = $article->section->url_name }}
	{{ if $article->issue->url_name == "blogs" }} {{ $article_section = "blogs" }} {{ /if }}
	{{ if $article->issue->url_name == "dossiers" }} {{ $article_section = "dossiers" }} {{ /if }}
	
	{{ $article_author = "" }}
	{{ if $article->authors|@count gt 0 }}
		{{ $article_author = "`$article->authors[0]->first_name` `$article->authors[0]->last_name`" }}
	{{ /if }}

	{{ include file="_tpl/newsbox-simple-favorites.tpl" }}

	{{ if $column%2 == 0 }}
		</div>
	{{ else }}
		</div></div>
	{{ /if }}
		
	{{ $column=$column+1 }}
	
{{ /foreach }}


{{ if $column%2 == 1 }}</div>{{ /if }}

{{ else }}
	<div class="mcontentbar">
	{{ if $view->nologin }}
	
		<h3>Bitte melden Sie sich in der Journal-B-Community an, um Artikel zu favorisieren und ein persönliches Archiv anzulegen.</h3>
	
	{{ else }}

		<h3>Sie haben noch keine Artikel favorisiert.</h3>
		
	{{ /if }}
	</div>
{{ /if }}
			
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
