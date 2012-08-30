<div class="contentbar section-{{ $gimme->section->url_name }}">

	<div class="titlebox section-{{ $gimme->section->url_name }}" id="mobile_startpoint">
		<h2 style="text-transform: capitalize;">{{  $gimme->article->type_name }} / </h2><h1><a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->article->author->name }}</a></h1>
	</div>
			
	<div class="blogbox">
			
		<article class="kolumne">
		
			<div class="info_block">
				{{ if $gimme->article->publish_date }}
					<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
					<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date>
				{{ /if }}
			</div>
	
			{{ if $gimme->article->content_accessible }}    
				<header>
					<div class="article_top">
						<div class="title"><a name="top">{{ $gimme->article->name }}</a></div>
					</div>

					{{ include file="_tpl/article-gallery.tpl" }}
				</header>
			
				<div class="blogcontent">
					<div class="article_info" {{ if not $is_gallery and $gimme->article->images|count == 0 }}style="top:200px;"{{ /if }}>
						{{ $i = 0 }}
						{{ list_article_authors }}
							{{ $ren = false }}
							{{ foreach from=$rendered_authors item=author }} {{ if $author == $gimme->author->name }} {{ $ren = true }} {{ break }} {{ /if }} {{ /foreach }}
							{{ if not $ren }}
								{{ $i = $i + 1 }}
								{{ $rendered_authors[$i] = $gimme->author->name }}
							{{ /if }}
							<author type="{{ $gimme->author->type }}" {{ if $ren }}style="display: none;"{{ /if }}><a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->author->name }}</a></author>
						{{ /list_article_authors }}
						<time>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y<br>%H:%i" }}</time>
					</div>
					<div class="mcontentbar" style="border-bottom: 0 none;">
						{{ $gimme->article->full_text }}
						<div style="clear:both"></div>
					</div>
				</div>
									
			{{ else }}        
				<p><em>This article is locked and is accessible only to <mark>registered</mark> and <mark>logged in</mark> users, sorry!</em></p>
			{{ /if }}  
			
		</article>
	
		<div class="article-community mobile"></div>
	
		<!-- Article forum -->
		<div class="forum">
	
			<a name="community"></a>
			<div id="disqus_thread"></div>
		
		</div><!-- /forum -->
		
	</div>
	
	
</div>
