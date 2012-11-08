{{ if $DEV_ENV }}
<center style="font-size:60%"><script language="JavaScript">document.write(navigator.userAgent + ' - native:' + NATIVE_APP + ' mobile:' + MOBILE_WEB)</script></center>
<!-- DEV -->
<script src="{{ url static_file='_js/library.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/community.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/faves.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/swipe.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/slider.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/general.js' }}" type="text/javascript"></script>
<script src="{{ url static_file='_js/tabs.js' }}" type="text/javascript"></script>
<!-- /DEV -->
{{ else }}
<!-- PROD -->
<script src="{{ url static_file="_js/all$VER_ENV.min.js" }}" type="text/javascript"></script>
<!-- /PROD -->
{{ /if }}

<div id="fb-root"></div>

<script type="text/javascript">

if (NATIVE_APP) {
	document.write('<link rel="stylesheet" type="text/css" href="{{ url static_file="_css/native-application.css" }}">');
	if ($('body').hasClass('shareable')) {
		$.get('{{ url static_file="_html/control-sharebox.html" }}', 
			function(data) { $('.contentbar').first().prepend(data); });
	}
	$.get('/mobile/controlbar', 
		function(data) { $('.controlbar_mobile_front').prepend(data); });
}

if (MOBILE_WEB) {
	/* browser-update */
	var $buoop = { l: 'de', text: 'Um die volle Funktionalit&auml;t der Journal-B-Website zu geniessen, empfehlen wir Ihnen, ihren Browser auf die neuste Version aufzur&uuml;sten' }
	$buoop.ol = window.onload; 
	window.onload=function(){ 
	 try {if ($buoop.ol) $buoop.ol();}catch (e) {} 
	 var e = document.createElement("script"); 
	 e.setAttribute("type", "text/javascript"); 
	 e.setAttribute("src", "http://browser-update.org/update.js"); 
	 document.body.appendChild(e); 
	} 
	/* /browser-update */
}
</script>
</body>
</html>