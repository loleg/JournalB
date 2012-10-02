{{ if !preg_match("/(iPhone|iPod|iPad).*AppleWebKit(?!.*Safari)/", $smarty.server.HTTP_USER_AGENT) }}
<div class="sharebox hidden">
	<div class="shareicon">
		<a href="https://twitter.com/share" class="twitter-share-button" data-via="journalb" data-lang="de" data-related="journalb" data-hashtags="Bern">Twittern</a>
		<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
	</div>

	<div class="shareicon">
		<div class="g-plusone" data-size="medium"></div>
		<script>window.___gcfg = {lang: 'de'}; (function() { var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true; po.src = 'https://apis.google.com/js/plusone.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s); })();</script>
	</div>
	
	<div class="shareicon" style="margin-right:0">
		<div class="fb-like" data-send="false" data-layout="button_count" data-width="100" data-height="30" data-show-faces="false"></div>
		<script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = "//connect.facebook.net/de_DE/all.js#xfbml=1"; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk'));</script>
	</div>
	
	<div class="shareicon" style="margin-right:0">
		<span class='st_email' displayText='Email'></span>
		<script type="text/javascript">var switchTo5x=true;</script>
		<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
		<script type="text/javascript">stLight.options({publisher: "ur-73cd3ab1-2cfc-3b8e-1133-f5a29e68dd9a"});</script>
	</div>
	
	<div style="clear:both"></div>
</div>
{{ /if }}