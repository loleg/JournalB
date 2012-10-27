<a class="newsbox section-{{ $article_section }} layoutsimple" href="{{ $article->url }}">

	<div class="newsboxcontent">

		{{ if $article->issue->url_name == "dossiers" }}
			<h2>Dossier</h2>
			<h1><span>{{ $article->name }}</span></h1>

		{{ elseif $article->issue->url_name == "blogs" }}
			<h2>Blog</h2>
			<h1><span>{{ $article->section->name }}</span></h1>

		{{ elseif $article->issue->url_name == "klkm" }}
			<h2>{{ $article->type_name }}</h2>
			<h1><span>{{ $article_author }}</span></h1>
			
		{{ else }}
			<h1><span>{{ $article->name }}</span></h1>
			
		{{ /if }}
				
		<description>
			<p>
				{{ if $article->deck=="" }} 
					{{ $article->full_text|strip_tags|truncate:400:"...":true }}
				{{ else }}
					{{ $article->deck|strip_tags }}
				{{ /if }}
			</p>
		</description>		
	</div>

	<div class="info_block">
		<time>
			{{ $article->publish_date|camp_date_format:"%d.%m.%Y" }}
		</time> | 
		<author>{{ $article_author }}</author>
	</div>

	<span class="favorite checked"><span>Favorite</span></span>
	
</a>
<a class="commentcount" href="{{ uri options="article" }}#disqus_thread"></a>