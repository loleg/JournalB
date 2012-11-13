// Prevent native scroll in mobile apps
function noElasticScroll (e)
{
	e.preventDefault();
}

// Destroy css cache
function destroyLessCache(pathToCss) {
	if (typeof less == 'undefined') return;
    if (!window.localStorage || !less) return;
    var host = window.location.host;
    var protocol = window.location.protocol;
    var keyPrefix = protocol + '//' + host + pathToCss;

    for (var key in window.localStorage) {
        if (key.indexOf(keyPrefix) === 0) {
            delete window.localStorage[key];
        }
    }
}

// Create HTML anchors around links in text
function urlify(text, popup) {
    var opts = '', urlRegex = /(https?:\/\/[^\s]+)/g;
    if (popup) { opts = ' target="_blank"'; } 
    return text.replace(urlRegex, function(url) {
		var anchor = url.replace("http://","").replace("https://","");
        return '<a href="' + url + '"' + opts + '>' + anchor + '</a>';
    });
}

// Set Cookie
function setCookie(c_name,value,exdays)
{
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString()) + "; path=/";
	document.cookie=c_name + "=" + c_value;
}

// Create legends around inline images
function articleImageAlts()
{
	$(".cs_img").each(function(){
		
		if ($(this).css("float")=="none")
		{
			var height = $(this).children("p").children("img").height();
			if (height==0) height = 150;
			$(this).css("min-height",(height+20)+"px");
			$(this).children(".cs_img_caption").addClass("middle");	
			$(this).children(".cs_img_caption").css("margin-top","-"+(height+15)+"px");	
		}
		else
		{
			$(this).addClass("cs_img_"+$(this).css("float"));
		}

		if ($(this).children("p").children("img").attr("alt") == undefined || $(this).children("p").children("img").attr("alt") == "")
		{
			var photo = $('.article_info .author[type="Photographer"]').html();
			if (photo) $(this).children(".cs_img_caption").append("<br><br>(Foto: "+photo+")");
		}
		else if ($(this).children(".cs_img_caption").html() != $(this).children("p").children("img").attr("alt"))
		{
			$(this).children(".cs_img_caption").append("<br><br>"+urlify($(this).children("p").children("img").attr("alt")));	
		}
		
	});
	$('.author-block .author-bio').each(function() {
		$(this).html(urlify($(this).text()));
	});
}

// Init collapse elements
function collapsableElements()
{
	$(".collapse_box").children(".collapse_title").unbind("click");
	$(".collapse_box").children(".collapse_title").click(function(){ collapseElement($(this).parent()); });
}

// Show or hide element
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


var currentFontSize = 1;

// Update fontsize in css
function updateFontSize()
{
	$("body").removeClass("font").removeClass("font0").removeClass("font1").removeClass("font2").addClass("font"+currentFontSize);
}

// Change font size
function changeFontSize()
{
	currentFontSize++;
	if (currentFontSize==3) currentFontSize = 0;
	setCookie("fontSize",currentFontSize,700);
	updateFontSize();
	$(this).blur();
	return false;
}

// Load selected font size from cookies
function loadFontSize()
{
	var fontSize = getCookie("fontSize");
	if (fontSize != undefined)
	{
		currentFontSize = fontSize;
	}
}

/*	screenMode:
	1	=>	stable (1024+)
	2	=>	tablet (768-1023)
	3	=>	mobile landscape(480-767)
	4	=>	mobile portait (480-) */
var screenMode = 0;
var beforeScreenMode = 0;

// Check if screen mode was changed
function updateScreenMode()
{
	var _screenMode;

	if ($(document).width()>=480)
		if ($(document).width()>=768)
			if ($(document).width()>=1024) _screenMode = 1;
			else _screenMode = 2;
		else _screenMode = 3;
	else _screenMode = 4;

	if (_screenMode != screenMode) setScreenMode(_screenMode);
}

var scrolling = false;

// Skips over the menu when loading an article
function scrollToArticleTop(animate) {	
	if (scrolling) return false;
	scrolling = true;
	
	var scroll_top = 0;
	
	if ($(".controlbar_mobile").length && $(".controlbar_mobile").height()>0 && navigator.userAgent.match(/(Mobile|iPhone)/) !== undefined) scroll_top += $(".controlbar_mobile").height()+15;
	if (!animate)
	{
		$(window).scrollTop(scroll_top);
		scrolling = false;
	}
	else
	{
		
		$('html, body').animate({scrollTop:scroll_top}, 'slow', function() {scrolling = false;});
	}
}

// Update screen mode and trigger action
function setScreenMode(_screenMode)
{
	beforeScreenMode = screenMode;
	screenMode = _screenMode;
	$(document).trigger('changeScreenMode');
}

// Load temperature widget
function aareTemperaturen()
{
	$.get('/services/hydrodaten.php', function(data) {
		$('.aare .wert').html(data.temperature).parent().css('opacity','1');
	});
}

// Hide article except comments
function showComments() {
	$('header,.mcontentbar,.miniarticle,.box-under').toggle();
	$('.controlicon.comments').toggleClass("checked");
	document.location='#top';
	return false;
}

// Load more content dynamically
function loadWeitereArtikel(self) {
	self = $(self);
    $.get(self.attr('href'), function(data) {
        var top = data.indexOf('/start articlerows/');
        var bot = data.indexOf('/end articlerows/');

		$('.dynamic-articlerows .weitere').remove();
		$('.dynamic-articlerows').append(data.substring(top - 6, bot - 6));
		adjustNewsrows();
    }); 
    return false;
}

function calculateNewsboxOverflow()
{
	$(".newsbox.layoutsimple .newsboxcontent").each(function(){
		var heading_lines = Math.floor($(this).children(".newsboxheading").height()/30);
		if (heading_lines%2==1) $(this).css("max-height","11.4em");
	});
}


function getArticleTitle()
{
	if ($("#articleTitle").length)
	{
		return $("#articleTitle").html();
	}
	else
	{
		return false;
	}
}

function adjustNewsrows()
{
	var content_double_num = 0;

	$(".newsrows .content-double").each(function(){	
		if($('.newsrows .newsbox').index(this)%2!=content_double_num%2)
		{
			var i = 1;
			while ($(".newsrows .newsbox").eq($('.newsrows .newsbox').index(this)+i).length)
			{
				var obj = $(".newsrows .newsbox").eq($('.newsrows .newsbox').index(this)+i);
				if (obj.hasClass('content-single'))
				{
					$(this).before(obj);
					break;
				}
				i++;
			}
		}
		content_double_num++;
	});
	
	$(".newsrows .newsbox").show();
	
	if ($(".newsrows .weitere").length && $(".newsrows .content-single").length%2==1)
	{
		var obj = $(".newsrows .content-single").last();
		$(".newsrows .newsbox").last().after(obj);
		obj.hide();
	}
	
	$(".newsrows .content-single").removeClass('content-right');
	$(".newsrows .content-single:odd").addClass('content-right');
}

function controlIconsHover()
{
	if(!'ontouchstart' in document.documentElement)
	{
		$(".controlicon").hover(function(){$(this).addClass('hover')}, function(){$(this).removeClass('hover')});
	}
}
