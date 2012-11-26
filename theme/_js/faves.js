// Is the DISQUS API available
function checkDisqusApi() {
	if (typeof DISQUS == 'undefined') return false;
	if (typeof DISQUS.jsonData == 'undefined') return false;
	if (typeof DISQUS.jsonData.request == 'undefined') return false;
	return true;
}

// Check Disqus state on load
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
		// Workaround for Facebook login
		if (typeof facebookLoginStarted != 'undefined' && facebookLoginStarted) {
			favoritesStartLogin = true;
			DISQUS.dtpl.actions.fire("auth.facebook");
			loginDisqus();
		}
	}
	/* Sets the article count */
	if ($('#dsq-num-posts').length > 0 && $('#dsq-num-posts').text() != "0") {
		$('.num-comments').html('(' + $('#dsq-num-posts').text() + ')');
	} else if ($('.dsq-comment').length > 0) {
		$('.num-comments').html('(' + $('.dsq-comment').length + ')');
	}
	/* Continue initializing the favorites */
	initFavorites();
	return true;
}

// Process login request
var favoritesHasLogin = false, 
	favoritesStartLogin = false;
	
function checkDisqusLoginRepeat() {
	if (!favoritesStartLogin) return;
	if (DISQUS.jsonData.request.is_authenticated) {
		if (!helloDisqus()) {
			window.location.reload();
		}
		closeLoginPopup();
		return false;
	} 
	window.setTimeout(checkDisqusLoginRepeat, 200);
	return false;
}

function loginDisqus() {
	if (!checkDisqusApi()) return false;
	if (DISQUS.jsonData.request.is_authenticated) {
		favoritesHasLogin = true;
		return checkDisqusLoginRepeat();
	} else {
		// Registration popup

		if (NATIVE_APP || MOBILE_WEB) {
			showLoginPopup();
		} else {
			DISQUS.dtpl.actions.fire('auth.login');
		}
		
		if (!favoritesStartLogin) {
			favoritesStartLogin = true;
			window.setTimeout(checkDisqusLoginRepeat, 200);
		}
	}
	return false;
}

function logoutDisqus() {
	if (window.confirm('Aus Journal B-Community abmelden?')) {
		// log out the service
		$.get('/favorites/logout', function(data) {
			if (typeof console != 'undefined') console.log(data);
		});
		// log out DISQUS
		var logoutlink = $('.dsq-logout-link a,#dsq-logout a').attr('href');	
		if (typeof logoutlink != 'undefined') window.location = logoutlink;
	}
}

function initFavorites() {
	var myfaves = null, myfaveurls = [];
	// ** Favorites	login
	$.get('/favorites/myfaves', function(data) {
		if (data == null || data == 'NOLOGIN') {
			if (favoritesHasLogin && favoritesStartLogin) {
				window.location.reload();
			}
			if (navigator.userAgent.match(/(Mobile|iPhone)/) && $(".forum").length > 0) {
				$("#disqus_thread").prepend($(".header .dsq-login-buttons"))
					.find('.dsq-login-buttons').show().css('text-align', 'center')
					.prepend('<p>Zum kommentieren bitte anmelden</p>')
					.parent().find('.dsq-login-button-disqus').remove();
				$(".dsq-unauthenticated").hide();
				if (!favoritesStartLogin) {
					favoritesStartLogin = true;
					window.setTimeout(checkDisqusLoginRepeat, 200);
				}
			}
			
			// Login link
			$(".header .login").click(loginDisqus);
			
			// Native comments tap
			if (NATIVE_APP) {
				$("#dsq-form-area").click(showLoginPopup);
			}
			
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
				
				if (typeof h == "undefined") return;
				var parts = h.split('/');				
				if (parts.length<5) return;
				
				var s = "/";
				for (var i =1; i<5; i++) s+= parts[i]+"/";
				
				$.each(myjson.favorites, function() {
					if (!found && this.indexOf(s) >= 0) {
						self.addClass('checked');
						found = true;
					}
				});
			});
			
		}
		
		// Events on header icons
		$(".header .login").show();
		$(".nav li.nav-fav a").css('background-size', '');
		
		// Community link
		$('.community-popup').click(function() {
			if (!checkDisqusApi()) return true;
			DISQUS.dtpl.actions.fire('community.show');
			return false;	
		});
	}); // - Favorites login
		
	// Favorites icon
	$('.favorite').click(function() {
					
		if (NATIVE_APP && document.location.protocol != 'http:') { 
			// offline message: kNoConnectionFavorites
			return false;
		} else if (!favoritesHasLogin) {
			loginDisqus();
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
			var self = this;
			if (url.indexOf('http:') != 0) 
				url = document.location.protocol + '//' + document.location.host + url;
			$.get('/favorites/vote?url=' + encodeURIComponent(url) 
					+ '&title=' + encodeURI(title) + '&vote=' + vote, 
				function(data) {
					if (NATIVE_APP) {
						window.location = "fvr://add_to_favorites";
					}
					if (typeof console != 'undefined') console.log(data);
				});

			// Update icon
			if (vote == -1) {
				$(self).removeClass('checked tapped');
			} else {
				$(self).addClass('checked tapped');
			}
		}
		return false;
	});
	// - Favorites icon
	
	// Hover events
	if (!MOBILE_WEB && !NATIVE_APP) {
		$('.container').addClass('allowhover');
	}
}

function goToFavorites()
{
	if (!checkDisqusApi()) {
		window.location = "/favorites"; return false;
	} else if (DISQUS.jsonData.request.is_authenticated) {
		$("body").append("<form id='redirect' action='/favorites' method='post'></form>");
		$("#redirect").submit();
	} else {
		loginDisqus();
	}
}

function showLoginPopup()
{
	if ($('.login_popup').length > 0) return false;
	
	html = "<div class='popup_wrapper' onclick='closeLoginPopup();'></div>";
	html += "<div class='login_popup'>";
	html += "<div class='caption'>Melden Sie sich an</div>";
	html += "<ul>";
	html += "<a href='#' onclick='setCloseLoginHook(); return DISQUS.dtpl.actions.fire(\"auth.facebook\");'><li class='facebook'><div class='tbutton'>Facebook</div></li>";
	html += "<a href='#' onclick='setCloseLoginHook(); return DISQUS.dtpl.actions.fire(\"auth.twitter\");'><li class='twitter'><div class='tbutton'>Twitter</div></li>";
	html += "<a href='#' onclick='setCloseLoginHook(); return DISQUS.dtpl.actions.fire(\"auth.disqus\");'><li class='disqus'><div class='tbutton'>Disqus</div></li>";
	html += "</ul>";
	html += "</div>";
	
	$("body").append(html);
	
	return false;
}

function setCloseLoginHook()
{
	$(window).bind('focus', function() {location.reload();});
}

function closeLoginPopup()
{
	$(".popup_wrapper").remove();
	$(".login_popup").remove();
	$("#disqus_thread .dsq-login-buttons").hide();
	favoritesStartLogin = false;
}