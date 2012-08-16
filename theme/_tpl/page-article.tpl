<div class="contentbar section-page">

	<article>
		<header> 
			<h1 id="mobile_startpoint">{{ $gimme->article->name }}</h1>
			
			{{ include file="_tpl/article-gallery.tpl" }}
		</header>
		
		<div class="page-content">
			{{ $gimme->article->full_text }}
		</div>
		
		<div class="related-articles">
		{{ list_related_articles }}
		
			{{ if $column%2 == 0 }}<div class="row newsrow">{{ /if }}
			
			{{ assign var="article_section" value=$gimme->article->section->url_name }}
					
			{{ if $gimme->article->has_image(1) }}
			
				{{ include file="_tpl/newsbox-bgimage.tpl" }}
			
			{{ else }}
			
				{{ include file="_tpl/newsbox-simple.tpl" }}
				
			{{ /if }}
					
			{{ if $column%2 == 1 }}</div>{{ /if }}
				
			{{ $column=$column+1 }}
						
		{{ /list_related_articles }}
	</div>

	</article>
	
</div>