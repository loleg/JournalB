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
				.click(function() { document.location='/favorites/logout'; })
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