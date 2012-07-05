<div class="{{ if $column%2 == 0 }}content-left{{ else }}content-right{{ /if }} newsbox section-{{ $gimme->article->section->url_name }} layoutbgimage" style="background-image: url({{ url static_file='_img/data/img1.png' }});">

	<info>
		<div>
			<span class="info"><time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y | %H:%i" }}</time></span>
			<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>
		</div>
	</info>

	<a class="favorite" href="#">Favorite</a>
	
</div>