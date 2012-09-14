<div class="contentbar section-page contentbar-section-page">

	{{ include file="_tpl/control-sharebox.tpl" }}

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
			
				{{ if $column%2 == 0 }}
					<div class="row newsrow"><div class="content-left">
				{{ else }}
					<div class="content-right">
				{{ /if }}
				
					{{ $article_section = $gimme->article->section->url_name }}
					{{ if $gimme->article->issue->url_name == "blogs" }} {{ $article_section = "blogs" }} {{ /if }}
					{{ if $gimme->article->issue->url_name == "dossiers" }} {{ $article_section = "dossiers" }} {{ /if }}
						
					{{ if $gimme->article->frontpage_image || $gimme->article->frontpage_doubleview }}
						{{ include file="_tpl/newsbox-bgimage.tpl" }}
					{{ else }}
						{{ include file="_tpl/newsbox-simple.tpl" }}
					{{ /if }}
						
				{{ if $column%2 == 0 }}
					</div>
				{{ else }}
					</div></div>
				{{ /if }}
					
				{{ $column=$column+1 }}
							
			{{ /list_related_articles }}
			
			{{ if $column%2 == 1 }}</div>{{ /if }}
		</div>

	</article>
	
</div>