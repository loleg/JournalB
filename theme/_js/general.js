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
function urlify(text, popup) {
    var opts = '', urlRegex = /(https?:\/\/[^\s]+)/g;
    if (popup) { opts = ' target="_blank"'; } 
    return text.replace(urlRegex, function(url) {
		var anchor = url.replace("http://","").replace("https://","");
        return '<a href="' + url + '"' + opts + '>' + anchor + '</a>';
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

		if ($(this).children("p").children("img").attr("alt") == undefined || $(this).children("p").children("img").attr("alt") == "")
		{
			var photo = $('.article_info author[type="photographer"]').html();
			$(this).children(".cs_img_caption").append("<br><br>(Foto: "+photo+")");
		}
		else if ($(this).children(".cs_img_caption").html() != $(this).children("p").children("img").attr("alt"))
		{
			$(this).children(".cs_img_caption").append("<br><br>"+urlify($(this).children("p").children("img").attr("alt")));	
		}
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

// Reverse plugin
jQuery.fn.reverse = [].reverse;

// When the DOM is loaded
$(document).ready(function() {

	// Scale community sidebar (requires reverse)
	var max_height = $('.main').height();
	$('.sidebar .commentbox').reverse().each(function() {
	    if ($(this).parent().height() > max_height) $(this).hide();
	});
	
	// Allow max. 3 comments above the Journal B box, just before the recommend box
	$('.sidebar .supportbox').after($('.sidebar .commentbox:gt(2)'));
	
	// Enable external community links
	$('.sidebar description:contains("http://")').each(function() { 
		$(this).html(urlify($(this).text(), true)); 
	});

	// Favorites	
	var myfaves = null, myfaveobj = [];	
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


function collapsebleElements()
{
	$(".collapse_box").children(".collapse_title").click(function(){ collapseElement($(this).parent()); });
}

function collapseElement(obj)
{
	if ($(obj).hasClass("visible"))
	{
		$(obj).removeClass("visible");
	}
	else
	{
		$(obj).addClass("visible");
	}
}

function setCookie(c_name,value,exdays)
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString()) + "; path=/";
	document.cookie=c_name + "=" + c_value;
}

function getCookie(c_name)
{
	var i,x,y,ARRcookies=document.cookie.split(";");
	for (i=0;i<ARRcookies.length;i++)
	{
	  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
	  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
	  x=x.replace(/^\s+|\s+$/g,"");
	  if (x==c_name)
		{
		return unescape(y);
		}
	}
}


var fontSizes = Array( Array(14,16), Array(17,20), Array(20,24) );
var currentFontSize = 1;

function updateFontSize()
{
	$("body").css("font-size",fontSizes[currentFontSize][0]+"px");
	$("body").css("line-height",fontSizes[currentFontSize][1]+"px");
}

function changeFontSize()
{
	currentFontSize++;
	if (currentFontSize==3) currentFontSize = 0;
	setCookie("fontSize",currentFontSize,700);
	updateFontSize();
}

function loadFontSize()
{
	var fontSize = getCookie("fontSize");
	if (fontSize != undefined)
	{
		currentFontSize = fontSize;
		updateFontSize();
	}
}