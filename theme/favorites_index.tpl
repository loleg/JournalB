<!-- Favorites page template -->

{{ $tpl_favorite = true }}

{{ include file="_tpl/_html-head.tpl" }}

<body id="body" class="front-page">

<div class="container">

	<div class="main">

		{{ include file="_tpl/header.tpl" }}

		<div class="row content">		
		
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

	<a class="newsbox section-{{ $article_section }} layoutsimple" href="{{ $article->url }}">

	<div class="newsboxcontent">

		{{ if $article->issue->url_name == "dossiers" }}
			{{ $title_len = ceil($article->name|strlen / 23) + 1 }}
			<h2>Dossier</h2>
			<h1>{{ $article->name }}</h1>

		{{ elseif $article->issue->url_name == "blogs" }}
			{{ $title_len = ceil($article->section->name|strlen / 23) + 1 }}
			<h2>Blog</h2>
			<h1>{{ $article->section->name }}</h1>

		{{ elseif $article->issue->url_name == "klkm" }}
			{{ $title_len = ceil($article->author->name|strlen / 23) + 1 }}
			<h2>{{ $article->type_name }}</h2>
			<h1>{{ $article->author->name }}</h1>
			
		{{ else }}
			{{ $title_len = ceil($article->name|strlen / 23) }}
			<h1>{{ $article->name }}</h1>
			
		{{ /if }}
		
		{{ $len = 36 * floor(9 - $title_len*1.5) }}

		<description>
			<p>
				{{ if $article->deck=="" }} 
					{{ $article->full_text|strip_tags|truncate:$len:"...":true }}
				{{ else }}
					{{ $article->deck|strip_tags|truncate:$len:"...":true }}
				{{ /if }}
			</p>
		</description>	
	</div>

	<div class="info_block">
		<time>
			{{ if $article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
				{{ $article->publish_date|camp_date_format:"%H:%i" }}
			{{ else }}
				{{ $article->publish_date|camp_date_format:"%d.%m.%Y" }}
			{{ /if }}
		</time>
	</div>

	<span class="favorite checked"><span>Favorite</span></span>
	
</a>

	{{ if $column%2 == 0 }}
		</div>
	{{ else }}
		</div></div>
	{{ /if }}
		
	{{ $column=$column+1 }}
	
{{ /foreach }}

{{ if $column%2 == 1 }}</div>{{ /if }}
			
			
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
