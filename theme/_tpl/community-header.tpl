<div class="row header">
	<div class="row nav" align="center">
		<ul><li style="float: none;"><a href="#">Community</a></li></ul>
	</div>
	
	<div class="login" style="display: none;">
       	<button onclick="location='https://disqus.com/profile/login/?next=http://{{ $smarty.server.SERVER_NAME }}'">
       		Anmelden
	       	<div class="bg"><img src="{{ url static_file='_img/commentbox.png' }}" /></div>
       	</button>
      	<a class="register" href="https://disqus.com/profile/signup/?next=http://{{ $smarty.server.SERVER_NAME }}">Neu hier? <br>Registrieren</a>
    </div>
</div>