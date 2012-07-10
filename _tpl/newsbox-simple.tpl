<div class="{{ if $column%2 == 0 }}content-left{{ else }}content-right{{ /if }} newsbox section-{{ $gimme->article->section->url_name }} layoutsimple">

	<div class="newsboxcontent">
		<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>
		<description><p>{{ $gimme->article->deck }}</p></description>
	</div>

	<info>
		<time>
			{{ if $gimme->article->publish_date|camp_date_format:"%e" == $smarty.now|camp_date_format:"%e"}}
				Today, {{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
			{{ else }}
				{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
			{{ /if }}
		</time> | 
		<author class="name">{{ $gimme->article->author->name }}</author> - 
		<author class="role">{{ $gimme->article->author->type }}</author>
	</info>

	<a class="favorite" href="#">Favorite</a>
	
</div>