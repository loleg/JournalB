<div class="row header">
	<div class="login ">
       	<button onclick="location='/services/disqus.php?auth'">
       		Anmelden
	       	<div class="bg"><img src="{{ url static_file='_img/commentbox.png' }}" /></div>
       	</button>
      	<a class="register" href="https://disqus.com/profile/signup/?next=http://{{ $smarty.server.SERVER_NAME }}">Neu hier? <br><span>Registrieren</span></a>
    </div>
</div>
