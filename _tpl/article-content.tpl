<div class="contentbar section-{{ $gimme->section->url_name }}">

	<article>
	{{ if $gimme->article->content_accessible }}    
	
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
					
			<p class="deck">
				{{ if $gimme->article->subtitle != "" }}<span class="subtitle">{{ $gimme->article->subtitle }}</span>{{ /if }}
				{{ $gimme->article->deck }}	
			</p>	
					
			{{ include file="_tpl/article-gallery.tpl" }}
		</header>

		<div class="mcontentbar">
			<div class="article_info" {{ if not $is_gallery and $gimme->article->images|count == 0 }}style="top:200px;"{{ /if }}>
				{{ list_article_authors }}
					<author>{{ $gimme->author->name }}</author>
				{{ /list_article_authors }}
				<time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y<br>%H:%i" }}</time>
			</div>
		
			{{ $gimme->article->full_text }}
			
			<div style="clear:both"></div>
		</div>
							
	{{ else }}        
		<p><em>This article is locked and is accessible only to <mark>registered</mark> and <mark>logged in</mark> users, sorry!</em></p>
	{{ /if }}
	</article>

	<div class="article-community mobile">
		{{ include file="_tpl/article-community.tpl" }}
	</div>
	
	{{ include file="_tpl/article-forum.tpl" }}
	
</div>

<script language="javascript">articleImageAlts();</script>

