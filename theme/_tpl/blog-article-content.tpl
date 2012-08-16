<div class="contentbar section-blogs">

	<div class="titlebox section-blogs" id="mobile_startpoint">
		<h2><a href="{{ uri options="issue" }}">Blog</a> / </h2><h1><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></h1>
	</div>

	<div class="blogbox">
		
		<info>
			{{ if $gimme->article->publish_date }}
				<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
				<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date> | 
			{{ /if }}
			Nummer {{ $gimme->article->number }}
		</info>
		<author><a href="#">{{ $gimme->article->author->name }}</a></author>
			
		<article>
	
			{{ if $gimme->article->content_accessible }}    
				<header>
					<div class="title"><a name="top">{{ $gimme->article->name }}</a></div>

					<div class="article_info" {{ if not $is_gallery and not $gimme->article->has_image(1) }}style="top:200px;"{{ /if }}>
						{{ list_article_authors }}
							<author>{{ $gimme->author->name }}</author>
						{{ /list_article_authors }}
						<time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y<br>%H:%i" }}</time>
					</div>
					
					{{ include file="_tpl/article-gallery.tpl" }}
				</header>
					
				
			
			<div class="blogcontent">
				{{ $gimme->article->full_text }}
				<div style="clear:both"></div>
		</div>
									
			{{ else }}        
				<p><em>This article is locked and is accessible only to <mark>registered</mark> and <mark>logged in</mark> users, sorry!</em></p>
			{{ /if }}  
			
		</article>
	
		<div class="article-community mobile"></div>
	
	{{ include file="_tpl/article-forum.tpl" }}
	
	</div>
	
</div>

