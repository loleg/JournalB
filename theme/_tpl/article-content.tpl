<div class="contentbar section-{{ $gimme->section->url_name }}">

	<article>
	{{ if $gimme->article->content_accessible }}    
	
		<header>
			<h1 id="mobile_startpoint">{{ $gimme->article->name }}</h1>

			<div class="deck">
				{{ if $gimme->article->subtitle != "" }}<span class="subtitle">{{ $gimme->article->subtitle }}</span>{{ /if }}
				{{ $gimme->article->deck }}	
			</div>	
			
			<div class="article_info_mobile">
				{{ if $gimme->article->publish_date }}
				<time>
					{{ if $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" == $smarty.now|camp_date_format:"%e.%m.%Y"}}
						{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
					{{ else }}
						{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
					{{ /if }}
				</time> | 
				{{ /if }}
				<author>{{ $gimme->article->author->name }}</author>
			</div>
					
			{{ include file="_tpl/article-gallery.tpl" }}
		</header>

		<div class="mcontentbar">
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
		
			{{ $gimme->article->full_text }}
			
			<div style="clear:both"></div>
		</div>
							
	{{ else }}        
		<p><em>This article is locked and is accessible only to <mark>registered</mark> and <mark>logged in</mark> users, sorry!</em></p>
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
		<h3>Frontpage Vorschau</h3>
		<div class="row newsrow">
			{{ assign var="article_section" value=$gimme->article->section->url_name }}
			{{ if $gimme->article->frontpage_doubleview }}
				{{ include file="_tpl/newsbox-double.tpl" }}
			{{ elseif $gimme->article->frontpage_image }}
				{{ include file="_tpl/newsbox-bgimage.tpl" }}
			{{ else }}
				{{ include file="_tpl/newsbox-simple.tpl" }}
			{{ /if }}
		</div>
	{{ else }}
		<!-- Article forum -->
		{{ include file="_tpl/article-forum.tpl" }}
	{{ /if }}	
		
</div>
