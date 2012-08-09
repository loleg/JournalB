<div class="contentbar section-{{ $gimme->section->url_name }}">

	<article>
		<header>
			<h1 id="mobile_startpoint">{{ $gimme->article->name }}</h1>  
	
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
		</header>
		
		<div class="mcontentbar">
			<div class="article_info" style="top:210px;">
				{{ list_article_authors }}
					<author>{{ $gimme->author->name }}</author>
				{{ /list_article_authors }}
				<time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y<br>%H:%i" }}</time>
			</div>
		
			{{ if $gimme->article->subtitle != "" }}<span class="subtitle">{{ $gimme->article->subtitle }}</span>{{ /if }}
			{{ $gimme->article->full_text }}
			
			<div class="dossier-articles">
				{{ list_related_articles }}
						
					{{ include file="_tpl/newsbox-bgimage.tpl" }}
					<div style="clear: both"></div>
								
				{{ /list_related_articles }}
			</div>
		</div>

	</article>
	
</div>