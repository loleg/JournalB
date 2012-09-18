/* -- DEBUG -- */
if (typeof DEBUG_MODE != 'undefined' && DEBUG_MODE) {
	localStorage.clear(); 

	destroyLessCache("/themes/publication_2/theme_1/_css/");
	destroyLessCache("/themes/publication_3/theme_4/_css/");
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

	articleImageAlts();
	
	if ($("#slider_box").length)
	{
		if (is_gallery) initSlider();
		else $("#slider_box").remove();
	}
		
	drawAds();

	scaleCommunity();
		
	initShareButton();

	initFavorites();
	
	aareTemperaturen();
	
	loadFontSize();
		
	updateScreenMode();	
	
	collapsableElements();
	
});
