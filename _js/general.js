
function destroyLessCache(pathToCss) {

    if (!window.localStorage || !less) {
        return;
    }
    var host = window.location.host;
    var protocol = window.location.protocol;
    var keyPrefix = protocol + '//' + host + pathToCss;

    for (var key in window.localStorage) {
        if (key.indexOf(keyPrefix) === 0) {
            delete window.localStorage[key];
        }
    }
}

destroyLessCache("/themes/publication_2/theme_1/_css/");

function urlify(text) {
    var urlRegex = /(https?:\/\/[^\s]+)/g;
    return text.replace(urlRegex, function(url) {
		var anchor = url.replace("http://","");
		anchor = anchor.replace("https://","");
        return '<a href="' + url + '">' + anchor + '</a>';
    })
}


function articleImageAlts()
{
	$(".cs_img").each(function(){
		if ($(this).css("float")=="none")
		{
			$(this).css("min-height",($(this).children("p").children("img").height()+20)+"px");
			$(this).children(".cs_img_caption").addClass("middle");	
			$(this).children(".cs_img_caption").css("margin-top","-"+($(this).children("p").children("img").height()+15)+"px");	
		}
		$(this).children("p").children("img").attr("alt","asdasd asda http://asd.com");
		$(this).children(".cs_img_caption").append("<br>"+urlify($(this).children("p").children("img").attr("alt")));	
	});
}

sliderStatus = false;

function changeSliderStatus()
{
	if (sliderStatus)
	{
		$("#slider").removeClass("active");
		$("#slider").css("margin-top","0px");
		$("#slider_wrapper").removeClass("active");
		$(".gallery_info.mobile").remove();
		$(".container").attr("ontouchmove","");
		sliderStatus = false;
	}
	else if (document.body.offsetWidth<768)
	{
		$("#slider").addClass("active");
		$("#slider").css("margin-top","-"+$("#slider").height()/2+"px");
		$("#slider_wrapper").addClass("active");
		$(".gallery_info.mobile").addClass("active");
		$(".container").attr("ontouchmove","noElasticScroll(event);");
		
		var total = $('#slider .slider_image').length;
		var current_slide_no = $('#slider').data('nivo:vars').currentSlide; 
		var description = $("#gallery_image_"+current_slide_no).attr("alt");
		$("#slider").append('<div class="gallery_info mobile active"><div class="gallery_status"><span class="gallery_current">'+(current_slide_no+1)+'</span> / <span class="gallery_all">'+total+'</span></div><div class="gallery_description">'+description+'</div></div>');
				
		sliderStatus = true;
	}
}