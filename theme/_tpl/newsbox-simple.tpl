<a class="newsbox section-{{ $article_section }} layoutsimple" href="{{ uri options="article" }}">

	<div class="newsboxcontent">

		{{ if $gimme->article->issue->url_name == "dossiers" }}
			{{ $title_len = ceil($gimme->article->name|strlen / 23) + 1 }}
			<h2>Dossier</h2>
			<h1><span>{{ $gimme->article->name }}</span></h1>

		{{ elseif $gimme->article->issue->url_name == "blogs" }}
			{{ $title_len = ceil($gimme->article->section->name|strlen / 23) + 1 }}
			<h2>Blog</h2>
			<h1><span>{{ $gimme->article->section->name }}</span></h1>

		{{ elseif $gimme->article->issue->url_name == "klkm" }}
			{{ $title_len = ceil($gimme->article->author->name|strlen / 23) + 1 }}
			<h2>{{ $gimme->article->type_name }}</h2>
			<h1><span>{{ $gimme->article->author->name }}</span></h1>
			
		{{ else }}
			{{ $title_len = ceil($gimme->article->name|strlen / 23) }}
			<h1><span>{{ $gimme->article->name }}</span></h1>
			
		{{ /if }}
				
		{{ $len = 36 * floor(9 - $title_len*1.5) }}

		<description>
			<p>
				{{ if $gimme->article->deck=="" }} 
					{{ $gimme->article->full_text|strip_tags|truncate:$len:"...":true }}
				{{ else }}
					{{ $gimme->article->deck|strip_tags|truncate:$len:"...":true }}
				{{ /if }}
			</p>
		</description>		
	</div>

	<div class="info_block">
		<time>
			{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
				{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
			{{ else }}
				{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}
			{{ /if }}
		</time> | 
		<author>{{ $gimme->article->author->name }}</author>
	</div>

	<span class="favorite"><span>Favorite</span></span>
	
</a>
