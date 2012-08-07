<div class="contentbar section-blogs">

	<article>
		<h1 id="mobile_startpoint">{{ $gimme->article->name }}</h1>
					
		{{ if $gimme->article->content_accessible }}    

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
					
			<div class="mcontentbar">
				<div class="article_info" {{ if not $is_gallery and not $gimme->article->has_image(1) }}style="top:200px;"{{ /if }}>
					{{ list_article_authors }}
						<author>{{ $gimme->author->name }}</author>
					{{ /list_article_authors }}
					<time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y<br>%H:%i" }}</time>
				</div>
			
				{{ $gimme->article->full_text }}
			</div>
								
		{{ else }}        
			<p><em>This article is locked and is accessible only to <mark>registered</mark> and <mark>logged in</mark> users, sorry!</em></p>
		{{ /if }}    

	</article>

	{{ include file="_tpl/article-forum.tpl" }}
	
</div>

