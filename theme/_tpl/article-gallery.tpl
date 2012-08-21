{{ $is_gallery = false }}
{{ $is_image = false }}
{{ $gc = 0 }}

{{ foreach $gimme->article->slideshows as $slideshow }}
	<div id="slider_wrapper" class="slider_wrapper"></div>
	<div id="slider" class="slider">
	<ul>
	{{ foreach $slideshow->items as $item }}
		{{ if $item->is_image }}
			{{ $is_gallery = true }}
						
			<li><img src="{{ $item->image->src }}" alt="{{ $item->caption }}{{ php }}
			$info = explode("/","{{ $item->image->original }}" );
			$image_name = $info[count($info)-1];
			$query = @mysql_query("SELECT Photographer FROM Images WHERE ImageFileName='".mysql_real_escape_string($image_name)."'");
			if ($query && mysql_num_rows($query))
			{
				$image = mysql_fetch_array($query);
				if (!empty($image["Photographer"])) echo "<br><br>(Foto: $image[Photographer])";
			}
			{{ /php }}" /></li>
			{{ $gc = $gc + 1 }}
		{{ /if }}
		
		{{ if $item->is_video }}
			{{ $is_gallery = true }}
			{{ $url = $item->video->url|replace:'youtu.be':'youtube.com/v' }}
			{{ $url = $url|replace:'youtube.com/embed':'youtube.com/v' }}
			{{ if preg_match("/youtube/", $url) }}
				<li><object type="application/x-shockwave-flash" data="{{ $url }}" alt="{{ $item->caption }}"><param name="movie" value="{{ $url }}"><param name="wmode" value="opaque"><embed src="{{ $url }}" type="application/x-shockwave-flash" wmode="opaque" type="application/x-shockwave-flash"></embed></object></li>
			{{ else }}
				<li><iframe src="{{ $url }}" frameborder="0"  alt="{{ $item->caption }}" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></li>
			{{ /if }}
			{{ $gc = $gc + 1 }}
		{{ /if }}
	{{ /foreach }}
	</ul>
	</div>
	{{ break }}
{{ /foreach }}

{{ if not $is_gallery }}

	<script type="text/javascript">
		$("#slider").remove();
		$("#slider_wrapper").remove();
	</script>

	{{ image rendition="articlebig" }}
		<div id="article_image">
			<img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" style="max-width: 100%" alt="{{ $image->caption }} {{ if not $image->photographer == ""}}<br><br>(Foto: {{ $image->photographer }}) {{ /if }}" />
		</div>
		<script type="text/javascript">
			$(".gallery_all").html(1);
			$(".gallery_current").html(1);
			$(".gallery_description").html($("#article_image img").attr("alt"));
		</script>
		{{ $is_image = true }}
	{{ /image }} 

	{{ if not $is_image }}
		<script type="text/javascript">
			$(".gallery_info").remove();
			$(document).ready(function(){
				$(".article_info").css("position","absolute");
				$(".article_info").css("top","200px");
			});
		</script>
	{{ /if }}
	
{{ else }}
	<script type="text/javascript" src="{{ url static_file='_js/swipe.js' }}"></script>
	<script type="text/javascript" src="{{ url static_file='_js/slider.js' }}"></script>
	<script type="text/javascript"> initSlider("slider"); </script>
{{ /if }}