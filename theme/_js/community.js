function initShareButton()
{
	// ** Share
	$('.share').click(function() {
		if (NATIVE_APP) {
			window.location = "shr://share_article";
		} else {
			var sharebox = $('.main .sharebox');
			if (sharebox.hasClass('initial')) {
				sharebox
					.addClass('hidden').removeClass('initial')
					.css({ position:'', visibility:'' }) // fix visibility for Facebook
					.find('.shareicon.hidden').removeClass('hidden'); // unhide G+
			}
			if (sharebox.hasClass('hidden')) {
				sharebox.slideDown("fast").removeClass('hidden');
				$(this).addClass('checked');
			} else {
				sharebox.slideUp("fast").addClass('hidden');
				$(this).removeClass('checked');
			}
		}
	});
	// - Share
}

function scaleCommunity()
{
	// Scale community (requires reverse), allow max. 3 comments on top
	var max_height = $('.main').height() - 100, 
		sidebar = $('.sidebar');
	if (!sidebar.hasClass('preview')) {
		$('.commentbox', sidebar).reverse().each(function() {
		    if ($(sidebar).height() > max_height) $(this).hide();
		});
		$('.supportbox', sidebar).after($('.commentbox:gt(2)', sidebar));
		// Enable external community links
		$('.description:contains("http://")', sidebar).each(function() {
			if ($('a', this).length > 0) return;
			$(this).html(urlify($(this).text(), true));
		});
	}
	// Ensure no double bars
	$('.socialbox').each(function() {
		if (!$(this).prev().hasClass('layoutsimple')) {
			$(this).css('border-top', 'none').css('padding-top', '0');
		}
	});
}

// Draw two random ads on every page, and cycle them
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


function loadCommunity()
{
	$.get('/mobile/community', function(data) {
		$('#community').html(data);
	});
	if (NATIVE_APP) {
    	// Move comment counts into info - necessary because Newscoop chokes on A inside of A
		$(".newsrows .commentcount").each(function(){
			$(this).prev().find(".info,.info_block").first().prepend(this);
		}).removeClass('hidden');
	}
}