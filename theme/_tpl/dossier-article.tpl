<div class="contentbar section-dossiers">

	<div class="titlebox section-dossiers" id="mobile_startpoint">
		<h2><a href="{{ uri options="issue" }}">Dossier</a> /</h2>
		<h1>{{ $gimme->article->name }}</h1>
	</div>

	<article>
		<header> 
			{{ include file="_tpl/article-gallery.tpl" }}
		</header>
		
		{{ if $gimme->article->subtitle != "" }}<span class="subtitle">{{ $gimme->article->subtitle }}</span>{{ /if }}
		
		<div class="dossier-content">
			{{ $gimme->article->full_text }}
		</div>
		
		<div class="dossier-articles">
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