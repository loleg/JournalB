{{ if !preg_match("/(iPhone|iPod|iPad).*AppleWebKit(?!.*Safari)/", $smarty.server.HTTP_USER_AGENT) }}
<div class="sharebox hidden">
	<div class="shareicon">
		<a href="https://twitter.com/share" class="twitter-share-button" data-via="journalb" data-lang="de" data-size="large" data-related="journalb" data-count="none" data-hashtags="Bern">Twittern</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
	</div>

	<div class="shareicon">
		<g:plusone annotation="none"></g:plusone>
		<script>window.___gcfg = {lang: 'de'}; (function() { var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true; po.src = 'https://apis.google.com/js/plusone.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s); })();</script>
	</div>
	
	<div class="shareicon" style="margin-right:0">
		<div class="fb-like" data-send="false" data-layout="box" data-width="100" data-height="30" data-show-faces="false"></div>
		<script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = "//connect.facebook.net/de_DE/all.js#xfbml=1"; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk'));</script>
	</div>
	
	<div style="clear:both"></div>
</div>
{{ /if }}