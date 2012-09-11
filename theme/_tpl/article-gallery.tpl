{{ $is_gallery = false }}

<div id="slider_box" class="slider_box">
	<div id="slider" class="slider">
	<ul>

		{{ foreach $gimme->article->slideshows as $slideshow }}
			{{ foreach $slideshow->items as $item }}
				{{ if $item->is_image }}
					{{ $is_gallery = true }}
					<li class="sli_image"><img src="{{ $item->image->src }}" alt="{{ $item->caption }}" /></li>
				{{ /if }}
				
				{{ if $item->is_video }}
					{{ $is_gallery = true }}
					{{ $url = $item->video->url|replace:'youtu.be':'youtube.com/v' }}
					{{ $url = $url|replace:'youtube.com/embed':'youtube.com/v' }}
					{{ if preg_match("/youtube/", $url) }}
						<li class="sli_video"><object type="application/x-shockwave-flash" data="{{ $url }}" alt="{{ $item->caption }}"><param name="movie" value="{{ $url }}"><param name="wmode" value="opaque"><embed src="{{ $url }}" type="application/x-shockwave-flash" wmode="opaque" type="application/x-shockwave-flash"></embed></object></li>
					{{ else }}
						<li class="sli_video"><iframe src="{{ $url }}" frameborder="0"  alt="{{ $item->caption }}" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></li>
					{{ /if }}
				{{ /if }}
			{{ /foreach }}
			{{ break }}
		{{ /foreach }}
		
		{{ if not $is_gallery }}
			{{ image rendition="articlebig" }}
				{{ $is_gallery = true }}
				<li><img src="{{ $image->src }}" alt="{{ $item->caption }}" /></li>
			{{ /image }} 
		{{ /if }}
		
	</ul>
	</div>
</div>

{{ if $is_gallery }}
	<script type="text/javascript" src="{{ url static_file='_js/swipe.js' }}"></script>
	<script type="text/javascript" src="{{ url static_file='_js/slider.js' }}"></script>
	<script type="text/javascript"> initSlider(); </script>
{{ else }}
	<script type="text/javascript"> $("#slider_box").remove(); </script>
{{ /if }}