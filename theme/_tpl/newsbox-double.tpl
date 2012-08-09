{{ assign var="article_section" value=$gimme->article->section->url_name }}
{{ if $gimme->article->issue->number == 2 }}
	{{ $article_section = "blogs" }}
{{ /if }}

<div class="content-double newsbox section-{{ $article_section }} layoutdouble" onclick="location='{{ uri options="article" }}'"
	{{ image rendition="topfrontdouble" }} style="background-image: url({{ $image->src }});" {{ /image }} >
	
	<div class="newsboxcontent_wrapper">
		<div class="newsboxcontent">
			<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>
			<description><p>{{ $gimme->article->deck|truncate:400:"...":true }}</p></description>
		</div>
	</div>
	
	<info>
		<time>
			{{ if $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" == $smarty.now|camp_date_format:"%e.%m.%Y"}}
				{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
			{{ else }}
				{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
			{{ /if }}
		</time> | 
		<author>{{ $gimme->article->author->name }}</author>
	</info>
	
	<a class="favorite" href="#">Favorite</a>
		
</div>