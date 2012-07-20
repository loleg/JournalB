<div class="content-double newsbox section-{{ $gimme->article->section->url_name }} layoutdouble" 
	{{ image rendition="topfrontdouble" }} style="background-image: url({{ $image->src }});" {{ /image }} >
	
	<div class="newsboxcontent_wrapper">
		<div class="newsboxcontent">
			<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>
			<description><p>{{ $gimme->article->deck }}</p></description>
		</div>
	</div>
	
	<info>
		<time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y | %H:%i" }}</time> | 
		<author>{{ $gimme->article->author->name }}</author>
	</info>
	
	<a class="favorite" href="#">Favorite</a>
		
</div>