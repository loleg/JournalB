<div class="contentbar section-{{ $gimme->section->url_name }}">

	<article>
		<h1>{{ $gimme->article->name }}</h1>  

		<div class="article_info_mobile">
			<time>
				{{ if $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" == $smarty.now|camp_date_format:"%e.%m.%Y"}}
					{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
				{{ else }}
					{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
				{{ /if }}
			</time> | 
			<author>{{ $gimme->article->author->name }}</author>
		</div>
		
		{{ include file="_tpl/article-gallery.tpl" }}
		
		<div class="dossier-deck">
			{{ if $gimme->article->subtitle != "" }}<span class="subtitle">{{ $gimme->article->subtitle }}</span>{{ /if }}
			{{ $gimme->article->full_text }}
		</div>

		<div class="dossier-articles">
		{{ list_related_articles }}
				
			<div class="newsbox section-{{ $gimme->article->section->url_name }} layoutbgimage" onclick="location='{{ uri options="article" }}'"
			{{ image rendition="topfront" }} style="background-image: url({{ $image->src }});" {{ /image }}>
		
				<info>
					<div>
						<span class="info">
							<time>
								{{ if $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" == $smarty.now|camp_date_format:"%e.%m.%Y"}}
									{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
								{{ else }}
									{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
								{{ /if }}
							</time> | 
						</span>
						<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>
					</div>
				</info>
			
				<a class="favorite" href="#">Favorite</a>
				
			</div>
						
		{{ /list_related_articles }}
		</div>

	</article>
 
	
</div>

