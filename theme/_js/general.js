/* -- DEBUG -- */
if (!navigator.userAgent.match(/Journal/))
{
	if (typeof DEBUG_MODE != 'undefined' && DEBUG_MODE) {
		localStorage.clear(); 
		var p = "/themes/publication_";
		destroyLessCache(p + "1/theme_1/_css/");
		destroyLessCache(p + "2/theme_1/_css/");
		destroyLessCache(p + "3/theme_4/_css/");
	}
}
/* --- */

$(window).resize(function() { updateScreenMode(); });

$(document).bind("changeScreenMode",function(){
	if (beforeScreenMode<=2 && screenMode>2) 
	{
		$(".article-community.mobile").html($(".article-community.stable").html()); 
		$(".article-community.stable").html("");
		collapsableElements();
	}
	else if (beforeScreenMode>2 && screenMode<=2)
	{
		$(".article-community.stable").html($(".article-community.mobile").html()); 
		$(".article-community.mobile").html("");
		collapsableElements();
	}
});

// Reverse plugin
jQuery.fn.reverse = [].reverse;

// When the DOM is loaded
$(document).ready(function() {

	//calculateNewsboxOverflow();
	
	adjustNewsrows();
	
	articleImageAlts();
	
	if ($("#slider_box").length)
	{
		if (is_gallery) initSlider();
		else $("#slider_box").remove();
	}
			
	drawAds();

	scaleCommunity();
		
	initShareButton();
	
	aareTemperaturen();
	
	loadFontSize();
		
	updateScreenMode();	
	
	//collapsableElements();

	scrollToArticleTop();

});
