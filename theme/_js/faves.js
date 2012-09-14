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
		return;
	
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