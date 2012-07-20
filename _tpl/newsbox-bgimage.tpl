<div class="{{ if $column%2 == 0 }}content-left{{ else }}content-right{{ /if }} newsbox section-{{ $gimme->article->section->url_name }} layoutbgimage" 
	{{ image rendition="topfront" }} style="background-image: url({{ $image->src }});" {{ /image }}>

	<info>
		<div>
			<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>
			<span class="info">
				<time class="date">{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }} | </time>
				<time class="time">{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }} | </time>
				<author>{{ $gimme->article->author->name }}</author>
			</span>
		</div>
	</info>

	<a class="favorite" href="#">Favorite</a>
	
</div>