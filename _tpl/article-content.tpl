<div class="contentbar section-politik">

	<article>
		<h1>{{ $gimme->article->name }}</h1>
					
		{{ if $gimme->article->content_accessible }}                
					
			<p>{{ $gimme->article->deck }}</p>	

			{{ if $gimme->article->subtitle != "" }}<p style="font-weight: bold;">{{ $gimme->article->subtitle }}</p>{{ /if }}		
					
			{{ if $gimme->article->type_name == "news" }}
				{{ $is_gallery = false }}
				{{ $gc = 0 }}
				{{ foreach $gimme->article->slideshows as $slideshow }}
					<div id="slider" class="nivoSlider">
						{{ foreach $slideshow->items as $item }}
							{{ if $item->is_image }}
								{{ $is_gallery = true }}
								<img id="gallery_image_{{ $gc }}" src="{{ $item->image->src }}" width="{{ $item->image->width }}" height="{{ $item->image->height }}" alt="{{ $item->caption }}" />
								{{ $gc = $gc + 1 }}
							{{ /if }}
						{{ /foreach }}
					</div>
				{{ /foreach }}
						
				{{ if not $is_gallery }}{{ include file="_tpl/img/img_articlebig.tpl" }}{{ /if }}
			{{ /if }}
					
			<div class="mcontentbar">
				<div class="article_info">
					<author>{{ $gimme->article->author->name }}</author>
					<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y<br>%H:%i" }}</date>
				</div>
			
				{{ $gimme->article->full_text }}
			</div>
								
		{{ else }}        
			<p><em>This article is locked and is accessible only to <mark>registered</mark> and <mark>logged in</mark> users, sorry!</em></p>
		{{ /if }}    

	</article>
</div>

<script type="text/javascript" src="{{ url static_file='_js/slider.js' }}"></script>
<script type="text/javascript">
var total = jQuery('#slider img').length;
var current_slide_no = 1;

$("#gallery_all").html(total);
$("#gallery_description").html($("#gallery_image_0").attr("alt"));

$('#slider').nivoSlider({
	controlNav: false,
	pauseTime: 5000,
	effect: 'fade',
	directionNavHide: false,
	startSlide: 0,
	beforeChange: function() {
		$("#gallery_description").fadeOut();
	},
	afterChange: function() { 
		current_slide_no = $('#slider').data('nivo:vars').currentSlide; 
		$("#gallery_description").html($("#gallery_image_"+current_slide_no).attr("alt"));
		$("#gallery_current").html(current_slide_no+1);
		$("#gallery_description").fadeIn();
	}
});


</script>