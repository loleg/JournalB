{{ include file="_tpl/mobile-controlbar.tpl" }}

{{ if $gimme->article->issue->number == 5 }}
	{{ $article_section = "blogs" }}
	{{ $article_class = "blog" }}
{{ else }}
	{{ $article_section = $gimme->section->url_name }}
	{{ $article_class = $gimme->article->type_name }}
{{ /if }}
		
<div class="addbar">
	{{ include file="_tpl/control-icons.tpl" }}
</div>

<div class="contentbar section-{{ $article_section }}">

	{{ include file="_tpl/control-sharebox.tpl" }}

	<div class="miniarticle hidden">
		{{ include file="_tpl/article-mini.tpl" }}
	</div> 
	
	{{ if $gimme->article->issue->number > 1 and $gimme->article->issue->number < 5 }}
		<div class="titlebox section-{{ $gimme->section->url_name }}" id="mobile_startpoint">
			<h2 style="text-transform: capitalize;">{{  $gimme->article->type_name }} / </h2><h1><a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->article->author->name }}</a></h1>
		</div>
		
	{{ elseif $gimme->article->issue->number == 5 }}
		<div class="titlebox section-blogs" id="mobile_startpoint">
			<h2><a href="{{ uri options="issue" }}">Blog</a> / </h2><h1><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></h1>
		</div>
		<div class="blogbox">
			<div class="info_block">
				{{ if $gimme->article->publish_date }}
					<date>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</date> | 
					<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date> | 
				{{ /if }}
				Nummer {{ $gimme->article->number }}
			</div>
			<div class="author mainauthor">
				<a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->article->author->name }}</a>
			</div>
		</div>
	{{ /if }}

	<article class="{{ $article_class }}">
		{{ if $gimme->article->content_accessible }}    
		
			<header>
			
			{{ if $gimme->article->issue->number > 5 }}
				<div class="article_top">
					<h1 id="mobile_startpoint">{{ $gimme->article->name }}</h1>

					<div class="deck font-sens font{{ $smarty.cookies.fontSize }}">
						{{ if $gimme->article->subtitle != "" }}<span class="subtitle">{{ $gimme->article->subtitle }}</span>{{ /if }}
						{{ $gimme->article->deck }}	
					</div>	
				</div>
				
				<div class="article_info_mobile">
					{{ if $gimme->article->publish_date }}
						{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
							{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
						{{ else }}
							{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}
						{{ /if }}
						 | 
					{{ /if }}
					{{ $gimme->article->author->name }}
				</div>
				
			{{ elseif $gimme->article->issue->number == 1 }}
				<div class="article_top">
					<h1 id="mobile_startpoint">{{ $gimme->article->name }}</h1>

					<div class="deck font-sens font{{ $smarty.cookies.fontSize }}">
						{{ if $gimme->article->subtitle != "" }}<span class="subtitle">{{ $gimme->article->subtitle }}</span>{{ /if }}
						{{ $gimme->article->deck }}	
					</div>	
				</div>

			{{ else }}
				<div class="blogbox">
					{{ if $gimme->article->issue->number != 5 }}
						<div class="info_block">
							{{ if $gimme->article->publish_date }}
								<date>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</date> | 
								<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date>
							{{ /if }}
						</div>
					{{ /if }}
					<div class="article_top">
						<div class="title"><a name="top">{{ $gimme->article->name }}</a></div>
					</div>
				</div>
			{{ /if }}
						
				{{ include file="_tpl/article-gallery.tpl" }}
			</header>

			<div class="mcontentbar">
				{{ if $gimme->article->issue->number > 2 }}
					{{ include file="_tpl/article-info.tpl" }}
				{{ /if }}
			
				<div class="font-sens font{{ $smarty.cookies.fontSize }}">{{ $gimme->article->full_text }}</div>
								
				<div style="clear:both"></div>
			</div>
								
		{{ else }}        
			<p><em>403</em></p>
		{{ /if }}
	</article>
	
	{{ if $gimme->article->box_under!="" }}
		<div class="row adbox community-box">
			{{ $gimme->article->box_under }}
		</div>
	{{ /if }}

	<div class="article-community mobile"></div>
	
	{{ if $gimme->preview }}
	
		<!-- Article frontpage preview -->
		<h3>__Frontpage_Vorschau__</h3>
		<div class="row newsrow">
			{{ include file="_tpl/newsbox.tpl" }}
		</div>
		
	{{ elseif $gimme->article->no_forum }}

		<!-- Community disabled -->
		
	{{ elseif $gimme->article->issue->number > 2 }}
	
		<!-- Article forum -->
		<div class="forum">
	
			<a name="comments"></a>
			<div id="disqus_thread"></div>
		
		</div><!-- /forum -->
		<script language="JavaScript">
			var disqus_identifier = '{{ $gimme->article->webcode }}';
		</script>
		
	{{ /if }}	
		
</div>
