<a class="content-double newsbox section-{{ $article_section }} layoutdouble" href="{{ uri options="article" }}"
	{{ image rendition="topfrontdouble" }} style="background-image: url({{ $image->src }});" {{ /image }} >
	
	<div class="newsboxcontent_wrapper">
		<div class="newsboxcontent">
			<h1>{{ $gimme->article->name }}</h1>
			<description><p>{{ $gimme->article->deck|strip_tags|truncate:400:"...":true }}</p></description>
		</div>
	</div>
	
	<div class="info_block">
		<time>
			{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
				{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
			{{ else }}
				{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}
			{{ /if }}
		</time> | 
		<author>{{ $gimme->article->author->name }}</author>
	</div>
	
	<span class="favorite"><span>Favorite</span></span>
		
</a>