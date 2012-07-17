<div class="contentbar section-politik">
	<article>
		<h1>{{ $gimme->article->name }}</h1>
					
		{{ if $gimme->article->content_accessible }}                
					
			<p>{{ $gimme->article->deck }}</p>	

			{{ if $gimme->article->subtitle != "" }}<p style="font-weight: bold;">{{ $gimme->article->subtitle }}</p>{{ /if }}		
					
			{{ if $gimme->article->type_name == "news" }}
				{{ $is_gallery = false }}
				{{ foreach $gimme->article->slideshows as $slideshow }}
					<div id="slider" class="nivoSlider">
						{{ foreach $slideshow->items as $item }}
							{{ if $item->is_image }}
								{{ $is_gallery = true }}
								<img src="{{ $item->image->src }}" width="{{ $item->image->width }}" height="{{ $item->image->height }}" alt="{{ $item->caption }}" />
							{{ /if }}
						{{ /foreach }}
					</div>
				{{ /foreach }}
						
				{{ if not $is_gallery }}{{ include file="_tpl/img/img_articlebig.tpl" }}{{ /if }}
			{{ /if }}
					
			<div class="mcontentbar">
				{{ $gimme->article->full_text }}
			</div>
								
		{{ else }}        
			<p><em>This article is locked and is accessible only to <mark>registered</mark> and <mark>logged in</mark> users, sorry!</em></p>
		{{ /if }}    

	</article>
</div>

<script type="text/javascript" src="{{ url static_file='_js/slider.js' }}"></script>
<script type="text/javascript">
$('#slider').nivoSlider({
	controlNav: false,
	pauseTime: 5000,
	effect: 'fade',
	directionNavHide: false
});
</script>