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
	}
	initFavorites();
	/* Sets the article count */
	if ($('#dsq-num-posts').length > 0 && $('#dsq-num-posts').text() != "0") {
		$('.num-comments').html('(' + $('#dsq-num-posts').text() + ')');
	} else if ($('.dsq-comment').length > 0) {
		$('.num-comments').html('(' + $('.dsq-comment').length + ')');
	}
	return true;
}

// Process login request
var favoritesHasLogin = false, 
	favoritesStartLogin = false;
function loginDisqus() {
	if (!checkDisqusApi()) return false;
	var checkDisqusLogin = function() {
		if (DISQUS.jsonData.request.is_authenticated) {
			if (favoritesStartLogin) {
				window.location.reload();
			} else {
				return helloDisqus();
			}
		} else {
			window.setTimeout(checkDisqusLogin, 200);
		}
		return false;
	};
	if (DISQUS.jsonData.request.is_authenticated) {
		return checkDisqusLogin();
	} else {
		// Registration popup
		if (navigator.userAgent.match(/(Mobile|iPhone)/)) {
			$('.header .login').hide();
			$('.header .dsq-login-buttons').slideDown();
		} else {
			if (navigator.userAgent.match(/iPad/))
			{
				showLoginPopup();
			}
			else
			{
				DISQUS.dtpl.actions.fire('auth.login');
			}
		}
		if (!favoritesStartLogin) {
			favoritesStartLogin = true;
			window.setTimeout(checkDisqusLogin, 200);
		}
	}
	return false;
}

function logoutDisqus() {
	$.get('/favorites/logout', function(data) {
		if (typeof console != 'undefined') console.log(data);
	});
	
	var logoutlink = $('.dsq-logout-link a').attr('href');
	
	if (window.confirm('Aus Journal B-Community abmelden?')) {
		if (typeof logoutlink == 'undefined') window.location.reload();
		else window.location = logoutlink;
	}
}

function initFavorites() {
	var myfaves = null, myfaveurls = [];
	// ** Favorites	login
	$.get('/favorites/myfaves', function(data) {
		if (data == null || data == 'NOLOGIN') {
			if (navigator.userAgent.match(/(Mobile|iPhone)/) && $(".forum").length > 0) {
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
				
		if (!favoritesHasLogin) {
			if (navigator.userAgent.match(/(Journal|iPad)/))
			{
				showLoginPopup();
			}
			else
			{
				DISQUS.dtpl.actions.fire('auth.login');
			}
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
			
			if (navigator.userAgent.match(/Journal/))
			{
				window.location = "fvr://add_to_favorites?url="+url+"&vote="+vote;
			}
			
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


function showLoginPopup()
{
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
}

function setCloseLoginHook()
{
	$(window).bind('focus', function() {location.reload();});
}

function closeLoginPopup()
{
	$(".popup_wrapper").remove();
	$(".login_popup").remove();
}