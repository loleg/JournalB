var favoritesHasLogin = false,
	favoritesStartLogin = false;

function initFavorites()
{
	// ** Favorites	
	var myfaves = null, myfaveurls = [];
	$.get('/favorites/myfaves', function(data) {
		if (data == null || data == 'NOLOGIN') {
			// Login link
			$(".header .login button, .header .login .register a").click(function() {
				if (typeof DISQUS == 'undefined') return true;
				if (DISQUS.jsonData.request.is_authenticated) {
					// Proceed to auth confirm page
					document.location='/favorites/login';
				} else {
					// Registration popup
					DISQUS.dtpl.actions.fire('auth.login');
					//window.open($(this).attr('href'), 'Disqus', 'width=1000,height=620,menubar=no,resizable=no,scrollbars=no,toolbar=no');
					if (!favoritesStartLogin) {
						favoritesStartLogin = true;
						var checkDisqusLogin = function() {
							if (DISQUS.jsonData.request.is_authenticated) {
								document.location='/favorites/login';
							} else {
								window.setTimeout(checkDisqusLogin, 100);
							}
						};
						window.setTimeout(checkDisqusLogin, 100);
					}
				}
				return false;
			});
		
			// Hide forum if not logged in
			/*
			$(".forum").prepend('<div class="link"><a href="#">Zum Verfassen von Kommentaren bitte Anmelden</a>.</div>');
			$('#dsq-reply').hide();
			*/
			
		// Yes, we have data	
		} else {			
			myjson = $.parseJSON(data);

			// Set up auth button
			$(".header .login button")
				.click(function() { document.location='/favorites/logout'; })
				.find('span').html('Abmelden');
			$(".header .login .register")
				.html('Salut, <br><span class="bold">' + myjson.username + '</span>');
			favoritesHasLogin = true;
			
			// Toggle favorites on page
			$('.favorite').each(function() {
				var self = $(this), found = false;
				var h = self.parents('a').attr('href');
				$.each(myjson.favorites, function() {
					if (!found && this.indexOf(h) >= 0) {
						self.addClass('checked');
						found = true;
					}
				});
			});
			
		}
		$(".header .login").show();
	}); // - Favorites
		
	// Favorites icon
	$('.favorite').click(function() {
	
		if (!favoritesHasLogin) {
			document.location.href = '/favorites';
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
			$.get('/favorites/vote?url=' + encodeURI(url) 
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
