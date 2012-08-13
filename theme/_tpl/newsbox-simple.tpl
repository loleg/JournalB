{{ assign var="article_section" value=$gimme->article->section->url_name }}
{{ if $gimme->article->issue->number == 2 }}
	{{ $article_section = "blogs" }}
{{ /if }}

<div class="{{ if $column%2 == 0 }}content-left{{ else }}content-right{{ /if }} newsbox section-{{ $article_section }} layoutsimple" onclick="location='{{ uri options="article" }}'">

	<div class="newsboxcontent">
		{{ if $gimme->article->issue->number == 1 }}<h2>Dossier</h2>{{ /if }}
		{{ if $gimme->article->issue->number == 2 }}<h2>Blog</h2>{{ /if }}
		<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>
		{{ $len = 39 * floor(9 - round(ceil($gimme->article->name|strlen / 23))*1.5) }}
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

	<info>
		<time>
			{{ if $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" == $smarty.now|camp_date_format:"%e.%m.%Y"}}
				{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
			{{ else }}
				{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
			{{ /if }}
		</time> | 
		<author>{{ $gimme->article->author->name }}</author>
	</info>

	<a class="favorite" href="#">Favorite</a>
	
</div>