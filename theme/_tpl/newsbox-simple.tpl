<div class="{{ if $column%2 == 0 }}content-left{{ else }}content-right{{ /if }} newsbox section-{{ $article_section }} layoutsimple" onclick="location='{{ uri options="article" }}'">

	<div class="newsboxcontent">

		{{ if $gimme->article->issue->number == 1 }}
			{{ $title_len = ceil($gimme->article->name|strlen / 23) + 1 }}
			<h2>Dossier</h2>
			<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>

		{{ elseif $gimme->article->issue->number == 2 }}
			{{ $title_len = ceil($gimme->article->section->name|strlen / 23) + 1 }}
			<h2>Blog</h2>
			<h1><a href="{{ uri options="article" }}">{{ $gimme->article->section->name }}</a></h1>

		{{ elseif $gimme->article->issue->number == 4 }}
			{{ $title_len = ceil($gimme->article->section->name|strlen / 23) + 1 }}
			<h2>Kolumne</h2>
			<h1><a href="{{ uri options="article" }}">{{ $gimme->article->section->name }}</a></h1>
			
		{{ else }}
			{{ $title_len = ceil($gimme->article->name|strlen / 23) }}
			<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>
			
		{{ /if }}
		
		{{ $len = 38 * floor(9 - $title_len*1.5) }}

		<description>
			<p>
				{{ if $gimme->article->deck=="" }} 
					{{ $gimme->article->full_text->first_paragraph|truncate:$len:"...":true }}
				{{ else }}
					{{ $gimme->article->deck|truncate:$len:"...":true }}
				{{ /if }}
			</p>
		</description>		
	</div>

	<div class="info_block">
		<time>
			{{ if $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" == $smarty.now|camp_date_format:"%e.%m.%Y"}}
				{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
			{{ else }}
				{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
			{{ /if }}
		</time> | 
		<author>{{ $gimme->article->author->name }}</author>
	</div>

	<a class="favorite" href="{{ uri options="article" }}">Favorite</a>
	
</div>
