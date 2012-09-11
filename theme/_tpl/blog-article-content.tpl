{{ include file="_tpl/mobile-controlbar.tpl" }}
		
<div class="addbar">
	{{ include file="_tpl/control-icons.tpl" }}
</div>

<div class="contentbar section-blogs">

	<div class="titlebox section-blogs" id="mobile_startpoint">
		<h2><a href="{{ uri options="issue" }}">Blog</a> / </h2><h1><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></h1>
	</div>

	<div class="blogbox">
					
		<article class="blog">
		
			<div class="info_block">
				{{ if $gimme->article->publish_date }}
					<date>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</date> | 
					<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date> | 
				{{ /if }}
				Nummer {{ $gimme->article->number }}
			</div>
			<div class="author mainauthor"><a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->article->author->name }}</a></div>
	
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
						
						<script type="text/javascript">articleImageAlts();</script>
						
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

