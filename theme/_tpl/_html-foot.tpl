{{ if $DEV_ENV }}
<center style="font-size:60%">{{ $smarty.server.HTTP_USER_AGENT }}</center>
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

{{ if !preg_match("/(iPad|iPhone)/", $smarty.server.HTTP_USER_AGENT) }}
	<script type="text/javascript">
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
	</script>
{{ /if }}

</body>
</html>