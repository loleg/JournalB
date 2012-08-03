{{ $is_gallery = false }}
{{ $gc = 0 }}
{{ foreach $gimme->article->slideshows as $slideshow }}
	<div id="slider_wrapper"></div>
	<div id="slider" class="nivoSlider">
	{{ foreach $slideshow->items as $item }}
		{{ if $item->is_image }}
			{{ $is_gallery = true }}
			<img class="slider_image" id="gallery_image_{{ $gc }}" src="{{ $item->image->src }}" width="{{ $item->image->width }}" height="{{ $item->image->height }}" alt="{{ $item->caption }}" />
			{{ $gc = $gc + 1 }}
		{{ /if }}
	{{ /foreach }}
	</div>
	{{ break }}
{{ /foreach }}

{{ if not $is_gallery }}
	{{ if $gimme->article->images|count > 0 }}
		<div id="gallery_image_0">{{ include file="_tpl/img/img_articlebig.tpl" }}</div>
		<script type="text/javascript">
			$(".gallery_all").html(1);
			$(".gallery_current").html(1);
			$(".gallery_description").html($("#gallery_image_0 img").attr("alt"));
		</script>
	{{ else }}
		<script type="text/javascript">
			$(".gallery_info").remove();
		</script>
	{{ /if }}
{{ else }}
	<script type="text/javascript" src="{{ url static_file='_js/slider.js' }}"></script>
	<script type="text/javascript" src="{{ url static_file='_js/swipe.js' }}"></script>
	<script type="text/javascript">
		var total = jQuery('#slider img').length;
		var current_slide_no = 1;

		$(".gallery_all").html(total);
		$(".gallery_description").html($("#gallery_image_0").attr("alt"));

		$('#slider').nivoSlider({
			controlNav: false,
			effect: 'fade',
			directionNavHide: true,
			startSlide: 0,
			manualAdvance: true,
			animSpeed: 500,
			beforeChange: function() {
				$(".gallery_description").fadeOut();
			},
			afterChange: function() {
				current_slide_no = $('#slider').data('nivo:vars').currentSlide;
				$(".gallery_description").html($("#gallery_image_"+current_slide_no).attr("alt"));
				$(".gallery_current").html(current_slide_no+1);
				$(".gallery_description").fadeIn();
			}
		});
		
		$("#slider").touchwipe({
			wipeRight: "$('.nivo-prevNav').trigger('click');",	
			wipeLeft: "$('.nivo-nextNav').trigger('click');",	
			wipeNone: "changeSliderStatus();",
			min_move_x: 10,
			min_move_y: 10,
			preventDefaultEvents: false
		});
	</script>
{{ /if }}