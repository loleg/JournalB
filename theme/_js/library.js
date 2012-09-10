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


function scaleCommunity()
{
	// Scale community (requires reverse), allow max. 3 comments on top
	var max_height = $('.main').height(), 
		sidebar = $('.sidebar');
	if (!sidebar.hasClass('preview')) {
		$('.commentbox', sidebar).reverse().each(function() {
		    if ($(this).parent().height() > max_height) $(this).hide();
		});
		$('.supportbox', sidebar).after($('.commentbox:gt(2)', sidebar));
		// Enable external community links
		$('description:contains("http://")', sidebar).each(function() { 
			$(this).html(urlify($(this).text(), true)); 
		});
	}
}


function drawAds()
{
	var community_count = $(".sidebar .content .community-item").length;
	var pos1 = Math.floor((Math.random()*community_count));
	var pos2 = Math.floor((Math.random()*community_count));
	if (community_count>1) while (pos2==pos1) pos2 = Math.floor((Math.random()*community_count));
	
	var ad1=0,ad2=0;
		
	var ads_count = $(".community-ads .adbox").length;
	if (ads_count==0) return;
	else if (ads_count==1) ad1 = 1;
	else if (ads_count==2)
	{
		ad1 = 1;
		ad2 = 2;
	}
	else
	{
		var current_ad_shift = getCookie("adShift");
		if (!current_ad_shift) current_ad_shift = 0; else current_ad_shift = parseInt(current_ad_shift);
		ad1 = current_ad_shift + 1;
		ad2 = current_ad_shift + 2;
		if (ad1>ads_count)
		{
			ad1 = 1;
			ad2 = 2;
			current_ad_shift = 0;
		}
		else if (ad2>ads_count)
		{
			ad2 = 1;
		}
		
		current_ad_shift = ad2;
		setCookie("adShift",current_ad_shift,7);
	}
			
	if (ad1) $(".community-ads .adbox:nth-child("+ad1+")").insertAfter($(".sidebar .content .community-item")[pos1]);
	if (ad2) $(".community-ads .adbox:nth-child("+ad2+")").insertAfter($(".sidebar .content .community-item")[pos2]);
}


function initShareButton()
{
	// ** Share
	$('.share').click(function() {
		var sharebox = $(this).parent().siblings('.sharebox');
		if (sharebox.hasClass('hidden')) {
			sharebox.slideDown().removeClass('hidden');
		} else {
			sharebox.slideUp().addClass('hidden');
		}
	});
	// - Share
}


function initFavorites()
{
	// ** Favorites	
	var myfaves = null, myfaveobj = [];
	$.get('/services/disqus.php?myfaves', function(data) {
		//if (typeof console != 'undefined') console.log(data);
		// Do we have any data, i.e. are we logged in?
		if (data.length < 5) {
			// Login link
			$(".header .login button").click(function() { document.location='/services/disqus.php?auth'; });
			
			// Registration popup
			$(".header .login .register a").click(function() {
				DISQUS.dtpl.actions.fire('auth.login');
				//window.open($(this).attr('href'), 'Disqus', 'width=1000,height=620,menubar=no,resizable=no,scrollbars=no,toolbar=no');
				return false;
			});
		
			// Hide forum
			$(".forum").prepend('<div class="link"><a href="#">Zum Verfassen von Kommentaren bitte Anmelden</a>.</div>');
			$('#dsq-reply').hide();
			
		// Yes, we have data	
		} else {			
			myjson = $.parseJSON(data);

			// Set up auth button
			$(".header .login button")
				.click(function() { document.location='/services/disqus.php?logout'; })
				.find('span').html('Abmelden');
			$(".header .login .register")
				.html('Salut, <br><span>' + myjson.user + '</span>');
			
			// Collect info from newsboxes
			$.each(myjson.faves, function() {
				myfaveobj.push({
					title: this.title, 
					href: this.link
				});
			});
		}
		$(".header .login").show();
	}); // - Favorites
	
	// Favorites dialog
	$('li.nav-fav a').click(function() {
	
		// TODO: move into template, style using design specs
		/*
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
		}*/
		
		if (myfaveobj.length <= 0) return false;
		
		if ($('.main > .content').length == 0) {
			$('.main > .mcontentbar').hide().parent().append('<div class="row content"></div>');
		}
		
		var newsrow = $('.main > .content').html('<div class="row newsrow"></div>').find('.newsrow:last');

		$.each(myfaveobj, function(i) {
			if (i > 0 && i % 2 == 0) {
				newsrow = newsrow.parent().append('<div class="row newsrow"></div>').find('.newsrow:last');
			}
			var leftright = (i % 2 == 0) ? 'left' : 'right';
			newsrow.append('<div class="content-' + leftright + ' newsbox layoutsimple" onclick="location=\'' + this.href + '\'" style="height:7em"><div class="newsboxcontent"><h1><a href="' + this.href + '">' + this.title + '</a></h1><span class="favorite checked">Favorite</span></div>');
		});
	
		return false;
	}); // - Favorites dialog
	
	// Favorites icon
	$('.favorite').click(function() {
		var vote = ($(this).hasClass('checked')) ? -1 : 1;
		
		// Get target details
		var url = false, title;
		if ($(this).hasClass('controlicon')) {
			url = document.location.href;
			title = document.title;
		} else {
			var link = $(this).parent().find('h1');
			url = $('a', link).attr('href');
			title = link.text();
		}
		
		// Execute call
		if (url) {
			if (url.indexOf('http:') != 0) 
				url = document.location.protocol + '//' + document.location.host + url;
			$.get('/services/disqus.php?dofave=' + encodeURI(url) 
					+ '&title=' + encodeURI(title) + '&vote=' + vote, function(data) {
				if (data != 'OK' && typeof console != 'undefined') console.log(data);
			});
			
			// Update icon
			if (vote == -1) {
				$(this).removeClass('checked');
			} else {
				$(this).addClass('checked');
			}
		}
		return false;
	});

	// - Favorites icon
}