
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

function articleImageAlts()
{
	$(".imagedescription.left").each(function(){
		$(this).css("margin-top","-"+($(this).height()-18)+"px");		
	});
}