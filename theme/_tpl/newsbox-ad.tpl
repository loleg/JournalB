{{ image rendition="topfront" }}<img src="{{ $image->src }}" style="display: none;" />{{ /image }}
<a class="content-single newsbox section-ad layoutbgimage" href="{{ $gimme->article->link }}"
	{{ image rendition="topfront" }} style="background-image: url({{ $image->src }});" {{ /image }}>

	<div class="info_block">
		<div style="float:right;font-size:12px;color:#888">WERBUNG</div>
		<div>
			<h1><span>{{ $gimme->article->who }}</span></h1>
		</div>
	</div>	
</a>