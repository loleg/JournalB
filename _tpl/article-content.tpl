<div class="contentbar section-politik">
	<article>
		<h1>{{ $gimme->article->name }}</h1>
					
		{{ if $gimme->article->content_accessible }}                
					
			<p>{{ $gimme->article->deck }}</p>	

			{{ if $gimme->article->subtitle != "" }}<p style="font-weight: bold;">{{ $gimme->article->subtitle }}</p>{{ /if }}		
					
			{{ if $gimme->article->type_name == "news" }}{{ include file="_tpl/img/img_articlebig.tpl" }}{{ /if }}
					
			<div class="mcontentbar">
				{{ $gimme->article->full_text }}
			</div>
								
		{{ else }}        
			<p><em>This article is locked and is accessible only to <mark>registered</mark> and <mark>logged in</mark> users, sorry!</em></p>
		{{ /if }}    

	</article>
</div>