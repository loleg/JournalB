var favoritesHasLogin = false, favoritesStartLogin = true, favoritesMustReload = false;

function checkDisqusApi() {
	if (typeof DISQUS == 'undefined') return false;
	if (typeof DISQUS.jsonData == 'undefined') return false;
	if (typeof DISQUS.jsonData.request == 'undefined') return false;
	return true;
}

function helloDisqus() {
	if (!checkDisqusApi()) {
		if (typeof console != 'undefined') { console.log('API unavailable!'); }
		return false;
	}
	if (DISQUS.jsonData.request.is_authenticated) {
		var u = DISQUS.jsonData.request.display_name;
		if (typeof u == 'undefined') {
			u = DISQUS.jsonData.request.display_username;
		}
		var c = DISQUS.jsonData.request.user_id + ";" + u;
		setCookie('jsdisqus', c, 7);
	} else {
		setCookie('jsdisqus', '', 7);
	}
	initFavorites();
	return true;
}

function loginDisqus() {
	if (!checkDisqusApi()) return false;
	var checkDisqusLogin = function() {
		if (DISQUS.jsonData.request.is_authenticated) {
			return helloDisqus();
			if (!DISQUS.jsonData.request.is_remote) {
				// Proceed to auth confirm page
				window.location = '/favorites/login';
			} else {
				// Complete profile signup
				if (favoritesMustReload) window.location.reload();
				favoritesMustReload = true;
				return true;
			}
		} else {
			window.setTimeout(checkDisqusLogin, 200);
		}
		return false;
	};
	// Process login request
	if (DISQUS.jsonData.request.is_authenticated) {
		return checkDisqusLogin();
	} else {
		// Registration popup
		if (navigator.userAgent.match(/Mobile/)) {
			$('.header .login').hide();
			$('.header .dsq-login-buttons').slideDown();
		} else {
			DISQUS.dtpl.actions.fire('auth.login');
		}
		if (favoritesStartLogin) {
			favoritesStartLogin = false;
			
			window.setTimeout(checkDisqusLogin, 200);
		}
	}
	return false;
}

function logoutDisqus() {
	if (typeof getCookie('jsdisqus') == 'undefined') {
		window.location = '/favorites/logout'; return false; 
	} else {
		if (window.confirm('Aus Disqus Community abmelden?')) {
			window.location = $('.dsq-logout-link a').attr('href')
		}
	}
}

function initFavorites() {
	var myfaves = null, myfaveurls = [];
	// ** Favorites	login
	$.get('/favorites/myfaves', function(data) {
		if (data == null || data == 'NOLOGIN') {
			if (navigator.userAgent.match(/Mobile/) && $(".forum").length > 0) {
				$("#disqus_thread").prepend($(".header .dsq-login-buttons"))
					.find('.dsq-login-buttons').show().css('text-align', 'center')
					.prepend('<p>Zum kommentieren bitte anmelden</p>')
					.parent().find('.dsq-login-button-disqus').remove();
				window.setTimeout(function() {
					if (typeof DISQUS == 'undefined') return true;
					if (DISQUS.jsonData.request.is_authenticated) {
						$("#disqus_thread .dsq-login-buttons").hide();
					}
				}, 2000);
			}
			
			// Login link
			$(".header .login").click(loginDisqus);
			
		// Yes, we have data	
		} else {			
			myjson = $.parseJSON(data);

			// Set up auth button
			$(".header .login .button")
				.click(logoutDisqus)
				.find('span').html('Abmelden');
			$(".header .login .register")
				.html('Salut, <br><span class="bold">' + myjson.username + '</span>');
				//.parent().attr('href', 'https://disqus.com/' + myjson.username);
			$('.header .dsq-login-buttons').hide();
			favoritesHasLogin = true;
			
			// Toggle favorites on page
			$('.favorite').each(function() {
				var self = $(this), found = false, h;
				var h = (self.hasClass('controlicon')) ?
						document.location.pathname :
						self.parents('a').attr('href');
				$.each(myjson.favorites, function() {
					if (!found && this.indexOf(h) >= 0) {
						self.addClass('checked');
						found = true;
					}
				});
			});
			
		}
		
		// Events on header icons
		$(".header .login").show();
		
		// Community link
		$('.community-popup').click(function() {
			if (!checkDisqusApi()) return true;
			DISQUS.dtpl.actions.fire('community.show');
			return false;	
		});
	}); // - Favorites login
		
	// Favorites icon
	$('.favorite').click(function() {
	
		if (!favoritesHasLogin) {
			window.location = '/favorites';
			return false;
		}
	
		var vote = ($(this).hasClass('checked')) ? -1 : 1;
		
		// Get target details
		var url = false, title;
		if ($(this).hasClass('controlicon')) {
			url = document.location.href;
			title = document.title;
		} else {
			var link = $(this).parents('a');
			url = link.attr('href');
			title = link.find('h1').text();
		}
		
		// Execute call
		if (url) {
			if (url.indexOf('http:') != 0) 
				url = document.location.protocol + '//' + document.location.host + url;
			$.get('/favorites/vote?url=' + encodeURIComponent(url) 
					+ '&title=' + encodeURI(title) + '&vote=' + vote, 
				function(data) {
					if (typeof console != 'undefined') console.log(data);
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
