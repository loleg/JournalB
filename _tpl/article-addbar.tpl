<div class="addbar">

	<div class="controlicons">
		<div class="controlicon"><img src="{{ url static_file='_img/control-favorite.png' }}" /></div>
		<div class="controlicon"><img src="{{ url static_file='_img/control-share.png' }}" /></div>
		<div class="controlicon"><img src="{{ url static_file='_img/control-fontize.png' }}" /></div>
	</div>

	<author>{{ $gimme->article->author->name }}</author>
	<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y<br>%H:%i" }}</date>

</div>