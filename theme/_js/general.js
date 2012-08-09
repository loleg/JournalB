/*
Oleg: it is easier to just run localStorage.clear(); in your browser console
  --- this code needs to be removed for production
*/
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
destroyLessCache("/themes/publication_3/theme_4/_css/");
/* --- */

// Create HTML anchors around links in text
function urlify(text) {
    var urlRegex = /(https?:\/\/[^\s]+)/g;
    return text.replace(urlRegex, function(url) {
		var anchor = url.replace("http://","").replace("https://","");
        return '<a href="' + url + '">' + anchor + '</a>';
    })
}

// Create legends around inline images
function articleImageAlts()
{
	$(".cs_img").each(function(){
		if ($(this).css("float")=="none")
		{
			$(this).css("min-height",($(this).children("p").children("img").height()+20)+"px");
			$(this).children(".cs_img_caption").addClass("middle");	
			$(this).children(".cs_img_caption").css("margin-top","-"+($(this).children("p").children("img").height()+15)+"px");	
		}
		$(this).children(".cs_img_caption").append("<br>"+urlify($(this).children("p").children("img").attr("alt")));	
	});
}

// Gallery slider support
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

// When the DOM is loaded
$(document).ready(function() {

	var myfaves = null, myfaveobj = [];

	// Favorites	
	$.get('/services/disqus.php?myfaves', function(data) {
		if (typeof console != 'undefined') console.log(data);
		// Do we have any data, i.e. are we logged in?
		if (data.length < 5) {
			// Login authentication button
			$('.header .login button').click(function() {
				document.location.href = '/services/disqus.php?auth';
			
			// Create profile signup link
			}).parent().show().find('a').attr('href', 
				'https://disqus.com/profile/signup/?next=' + document.location.href 
			);
					
		// Yes, we have data	
		} else {
			myfaves = $.parseJSON(data);
			// Collect info from newsboxes: TODO replace with Newscoop API
			$.each(myfaves, function() {
				var url = this.replace(document.location.href, '');
				$('a[href^="/' + url + '"]').parents('div.newsbox').each(function() {
					$(this).find('.favorite').addClass('checked').attr('href','');
					myfaveobj.push({
						title: $(this).find('h1 a').text(), 
						href: $(this).find('h1 a').attr('href')
					});
				});
			});
		}
	});
	
	// Favorites dialog
	$('li.nav-fav a').click(function() {
	
		// TODO: move into template, style using design specs
		if ($('div.dialog-fav').length == 0) {
			$('body').append('<div class="dialog-fav" style="position:absolute;display:none; top:50%;left:50%;width:300px;height:300px; margin-left:-150px;margin-top:-150px; border:1px solid black;background:white;color:black; padding:2em;"></div>');
		}
		if (myfaveobj.length > 0) {
			var dialog = $('div.dialog-fav').html('<button style="float:right"> X </button>');
			$.each(myfaveobj, function() {
				dialog.append('<p><a href="' + this.href + '">' + this.title + '</a></p>');
			});
			dialog.find('button').click(function() { dialog.hide(); });
			dialog.show();
		}
	
		return false;
	});
});