<div class="addbar"></div>

<div class="contentbar section-page">
		
	<article class="page">
		{{ if $gimme->article->content_accessible }}    
		
			<header>
			
				<h1 id="mobile_startpoint">{{ $gimme->article->name }}</h1>
						
				{{ include file="_tpl/article-gallery.tpl" }}
				
			</header>

			<div class="mcontentbar">
						
				<div class="font-sens font{{ $smarty.cookies.fontSize }}">{{ $gimme->article->full_text }}</div>
								
				<div style="clear:both"></div>
			</div>
								
		{{ else }}        
			<p><em>403</em></p>
		{{ /if }}
	</article>
	
	<div class="article-community mobile"></div>
			
</div>
