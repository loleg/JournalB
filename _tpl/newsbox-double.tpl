<div class="content-double newsbox section-{{ $gimme->article->section->url_name }} layoutdouble" style="background-image: url({{ url static_file='_img/data/img2.png' }});">
	
	<div class="newsboxcontent_wrapper">
		<div class="newsboxcontent">
			<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>
			<description><p>{{ $gimme->article->deck }}</p></description>
		</div>
	</div>
	
	<info>
		<time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y | %H:%i" }}</time> | 
		<author class="name">{{ $gimme->article->author->name }}</author> - 
		<author class="role">{{ $gimme->article->author->type }}</author>
	</info>
	
	<a class="favorite" href="#">Favorite</a>
		
</div>