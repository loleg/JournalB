<a class="newsbox section-{{ $article_section }} layoutbgimage" href="{{ uri options="article" }}"
	{{ image rendition="topfront" }} style="background-image: url({{ $image->src }});" {{ /image }}>

	<div class="info_block">
		<div>
			<span class="info">
				<time>
					{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
						{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
					{{ else }}
						{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}
					{{ /if }}
				</time> | 
			</span>
			<h1>{{ $gimme->article->name }}</h1>
		</div>
	</div>

	<span class="favorite"><span>Favorite</span></span>
	
</a>

