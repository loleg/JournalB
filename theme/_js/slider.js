var slider;
var slider_id;
var current_slide;
var before_slide;
var slides_num;
var slider_easing = false;
var slider_status = false;

function initSlider(_slider_id)
{
	slider_id = _slider_id;
	slider = $("#"+slider_id);
										
	current_slide = 1;
	slides_num = $(slider).children("ul").children("li").length;			
	$(slider).children("ul").children("li:first").show();	

	$(slider).append('<div class="arrow left"></div>');
	$(slider).append('<div class="arrow right"></div>');
	if (!navigator.userAgent.match(/Mobile/))
	{
		$(slider).children(".arrow.left").click(function(){ moveSlider(0); });	
		$(slider).children(".arrow.right").click(function(){ moveSlider(1); });	
	}
	else
	{
		$(slider).append('<div class="tip">Hier klicken um Galerie zu offnen</div>');
	}
	
	$(".gallery_all").html(slides_num);
	$(".gallery_description").html($(slider).children("ul").children("li:first").children(":first").attr("alt"));
	
	$(slider).touchwipe({
		wipeRight: "moveSlider(0);",	
		wipeLeft: "moveSlider(1);",	
		wipeNone: "changeSliderStatus();",
		min_move_x: 10,
		min_move_y: 10,
		preventDefaultEvents: false
	});
	
	$("#slider_wrapper").touchwipe({
		wipeRight: "moveSlider(0);",	
		wipeLeft: "moveSlider(1);",	
		wipeNone: "changeSliderStatus();",
		min_move_x: 10,
		min_move_y: 10,
		preventDefaultEvents: false
	});

}

function moveSlider(direction)
{
	if (navigator.userAgent.match(/Mobile/) && !$(slider).hasClass("active")) return;

	if (slider_easing) return;

	if (slides_num==1) return;
	
	slider_easing = true;

	before_slide = current_slide;

	if (direction == 1) current_slide++; else current_slide--;
	if (current_slide==0) current_slide = slides_num;
	if (current_slide==slides_num+1) current_slide = 1;
					
	$(".gallery_description").fadeOut();
					
	$(slider).children("ul").children("li:nth-child("+before_slide+")").animate({
			opacity: 0.3
		}, 500, function() {
			
			$(slider).children("ul").children("li:nth-child("+current_slide+")").css("opacity",0.3);
			$(slider).children("ul").children("li:nth-child("+current_slide+")").show();
			$(slider).children("ul").children("li:nth-child("+before_slide+")").hide();
			
			$(".gallery_description").html($(slider).children("ul").children("li:nth-child("+current_slide+")").children(":first").attr("alt"));
			$(".gallery_description").fadeIn();
			$(".gallery_current").html(current_slide);
			
			if ($(slider).children("ul").children("li:nth-child("+current_slide+")").children()[0].tagName=="OBJECT") $(slider).addClass("video"); else $(slider).removeClass("video");
				
			
			$(slider).children("ul").children("li:nth-child("+current_slide+")").animate({
					opacity: 1
				}, 500, function(){
					slider_easing = false;
				}
			);
		}
	);

}


function changeSliderStatus()
{
	if (slider_status)
	{
		$(slider).removeClass("active");
		$(slider).css("margin-top","0px");
		$("#slider_wrapper").removeClass("active");
		$(".gallery_info.mobile").remove();
		$(".container").attr("ontouchmove","");
		
		$(".nav").removeClass("hidden");
		
		slider_status = false;
	}
	else if (document.body.offsetWidth<768)
	{
		$(slider).addClass("active");
		$(slider).css("margin-top","-"+$("#slider").height()/2+"px");
		$("#slider_wrapper").addClass("active");
		$(".gallery_info.mobile").addClass("active");
		$(".container").attr("ontouchmove","noElasticScroll(event);");
		
		$(".nav").addClass("hidden");
		
		$(slider).append('<div class="gallery_info mobile active"><div class="gallery_status"><span class="gallery_current">'+current_slide+'</span> / <span class="gallery_all">'+slides_num+'</span></div><div class="gallery_description">'+$(slider).children("ul").children("li:nth-child("+current_slide+")").children(":first").attr("alt")+'</div></div>');
				
		slider_status = true;
	}
}