<div class="row header">
	<div class="login" style="display:none">
		<a href="https://disqus.com/profile/signup/additional/?next=http://{{ $smarty.server.SERVER_NAME }}" target="_blank">
       	<div class="button">
       		<span class="bold">Anmelden</span>
	       	<div class="commentbox-bg"></div>
       	</div>
       	</a><a href="https://disqus.com/profile/signup/?next=http://{{ $smarty.server.SERVER_NAME }}" target="_blank">
       	<div class="register">
	      	Neu hier? <br>
	      	<span class="bold">Registrieren</span>
       	</div>
       	</a>
    </div>
    <ul class="dsq-login-buttons" style="display:none">
	    <li class="dsq-login-button dsq-login-button-disqus"><a onclick="return DISQUS.dtpl.actions.fire('auth.disqus');" title="Login with Disqus" href="#"></a></li>
	    <li class="dsq-login-button dsq-login-button-facebook"><a onclick="return DISQUS.dtpl.actions.fire('auth.facebook');" title="Login with Facebook" href="#"></a></li>
	    <li class="dsq-login-button dsq-login-button-twitter"><a onclick="return DISQUS.dtpl.actions.fire('auth.twitter');" title="Login with Twitter" href="#"></a></li>
	</ul>
</div>
