{{ assign var="DEV_ENV" value="1" }}
{{ if $DEV_ENV }}
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
<script src="{{ url static_file='_js/all.min.js' }}" type="text/javascript"></script>
<!-- /PROD -->
{{ /if }}

{{ if preg_match("/(iPhone|iPod|iPad).*AppleWebKit(?!.*Safari)/", $smarty.server.HTTP_USER_AGENT) }}
	<script>
		if ($("#mobile_startpoint").length > 0){
		  window.location = "#mobile_startpoint";
		}
	</script>
{{ /if }}

<div id="fb-root"></div>

<script type="text/javascript">
{{ if !$DEV_ENV }}
/* google_analytics: */
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-34737515-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
/* /google_analytics */
{{ /if }}

/* disqus: */
	(function () {
        var s = document.createElement('script'); s.async = true;
        s.type = 'text/javascript';
        s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
        (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
    }());
    if ($('#disqus_thread').length == 0) {
    	$('body').append('<div class="hidden" id="disqus_thread"></div>');
    }
	var disqus_config = function () { 
		this.language = "de_inf"; // de_formal
		// console.log(this);
	};
	(function() {
		var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
		dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
		(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
	})();
/* /disqus */

/* flattr: */
/* <![CDATA[ */
(function() {
    var s = document.createElement('script');
    var t = document.getElementsByTagName('script')[0];

    s.type = 'text/javascript';
    s.async = true;
    s.src = '//api.flattr.com/js/0.6/load.js?mode=auto';

    t.parentNode.insertBefore(s, t);
 })();
/* ]]> */
</script>

</body>
</html>
