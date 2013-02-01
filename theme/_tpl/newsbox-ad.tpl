{{ image rendition="topfront" }}<img src="{{ $image->src }}" style="display: none;" />{{ /image }}
<a class="content-single newsbox section-ad layoutbgimage" href="{{ $gimme->article->link }}"
	{{ image rendition="topfront" }} style="background-image: url({{ $image->src }});" {{ /image }}>

	<div class="info_block">
		<div class="info_ad">ANZEIGE</div>
		{{ if $gimme->article->who }}
		<div class="info_who">
			<h1><span>{{ $gimme->article->who }}</span></h1>
		</div>
		{{ /if }}
	</div>	
</a>