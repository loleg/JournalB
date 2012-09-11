{{ include file="_tpl/mobile-controlbar.tpl" }}
		
<div class="addbar">
	{{ include file="_tpl/control-icons.tpl" }}
</div>

<div class="contentbar section-{{ $gimme->section->url_name }}">

	<div class="titlebox section-{{ $gimme->section->url_name }}" id="mobile_startpoint">
		<h2 style="text-transform: capitalize;">{{  $gimme->article->type_name }} / </h2><h1><a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->article->author->name }}</a></h1>
	</div>
			
	<div class="blogbox">
			
		<article class="kolumne">
		
			<div class="info_block">
				{{ if $gimme->article->publish_date }}
					<date>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</date> | 
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
					
					{{ include file="_tpl/article-info.tpl" }}
					
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

