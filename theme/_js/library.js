// Prevent native scroll in mobile apps
function noElasticScroll (e)
{
	e.preventDefault();
}

// Destroy css cache
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

// Get Cookie by name
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

// Retina cookie via Shaun Inman
function determineRetinaDisplay()
{
	if ((window.devicePixelRatio===undefined?1:window.devicePixelRatio)>=2) {
		document.cookie='HTTP_IS_RETINATWO=1;path=/';
	} else if ((window.devicePixelRatio===undefined?1:window.devicePixelRatio)>1) {
		document.cookie='HTTP_IS_RETINA=1;path=/';
	}
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


// Variable font sizes (size%, letter-spacing, line-height em) 
var fontSizes = Array( 
		Array(82,  'inherit', 1.429), 
		Array(100, '0.015em', 1.471), 
		Array(125, '0.015em', 1.429) 
	);
var currentFontSize = 1;

// Update fontsize in css
function updateFontSize()
{
	$("article").css("font-size",fontSizes[currentFontSize][0]+"%");
	$("article").css("letter-spacing",fontSizes[currentFontSize][1]);
	$("article").css("line-height",fontSizes[currentFontSize][2]+"em");
}

// Change font size
function changeFontSize()
{
	currentFontSize++;
	if (currentFontSize==3) currentFontSize = 0;
	setCookie("fontSize",currentFontSize,700);
	updateFontSize();
}

// Load selected font size from cookies
function loadFontSize()
{
	var fontSize = getCookie("fontSize");
	if (fontSize != undefined)
	{
		currentFontSize = fontSize;
		updateFontSize();
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

// Update screen mode and trigger action
function setScreenMode(_screenMode)
{
	beforeScreenMode = screenMode;
	screenMode = _screenMode;
	$(document).trigger('changeScreenMode');
}

function aareTemperaturen()
{
	// TODO: move to Newscoop service
	$.get('/services/hydrodaten.php', function(data) {
		$.each(data.getElementsByTagName('MesPar'), function() { 
		if ($(this).attr('DH') == 'HBCHa' && 
			$(this).attr('StrNr') =="2135" &&
			$(this).attr('Typ') =="03" &&
			$(this).attr('Var') =="00") {
				var txt = $(this).find('Wert[dt="-24h"]').text();
				$('.aare .wert').html(parseFloat(txt).toFixed(1));
				return;
		}			
		});
	});
}


function proceedSearchForm()
{		
	// Remove header form
	$('.header .search form').remove();
	var searchform = $('.main .searchform form');
	
	// Put current search query into form
	var sp = '{{ $gimme->search_articles_action->search_phrase }}';
	if (sp != '') { $('.search-keywords input').val(sp); }
	
	// Submit form when clicking on icon
	$('.search-keywords', searchform).prepend($('.submit-button', searchform));
	
	// Allow only one checkbox per field
	$('input.radiobox', searchform).click(function() {
		$(this).parent().siblings().find('input.radiobox').removeAttr('checked');
	});
	
	// Check advanced field submission
	var adv = $('.search-advanced'),
		adv_date = '{{ $smarty.post.f_search_start_date }}',
		adv_issue = '{{ $gimme->search_articles_action->search_issue }}',
		adv_section = '{{ $gimme->search_articles_action->search_section }}';
	if (adv_date + adv_issue + adv_section != '') {
		$('.search-dates input[value="' + adv_date + '"]').attr('checked', 'checked');
		$('.search-issue input[value="' + adv_issue + '"]').attr('checked', 'checked');
		$('.search-section input[value="' + adv_section + '"]').attr('checked', 'checked');
		adv.show();
	}
	
	// Submit when selecting advanced
	/*
	adv.find('input').change(function() {
		searchform.submit();
	});
	*/
}