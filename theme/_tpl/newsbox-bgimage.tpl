<div class="{{ if $column%2 == 0 }}content-left{{ else }}content-right{{ /if }} newsbox section-{{ $article_section }} layoutbgimage" onclick="location='{{ uri options="article" }}'"
	{{ image rendition="topfront" }} style="background-image: url({{ $image->src }});" {{ /image }}>

	<div class="info_block">
		<div>
			<span class="info">
				<time>
					{{ if $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" == $smarty.now|camp_date_format:"%e.%m.%Y"}}
						{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
					{{ else }}
						{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
					{{ /if }}
				</time> | 
			</span>
			<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>
		</div>
	</div>

	<a class="favorite">Favorite</a>
	
</div>

