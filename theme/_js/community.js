function initShareButton()
{
	// ** Share
	$('.share').click(function() {
		var sharebox = $('.main .sharebox');
		if (sharebox.hasClass('hidden')) {
			sharebox.slideDown().removeClass('hidden');
		} else {
			sharebox.slideUp().addClass('hidden');
		}
	});
	// - Share
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