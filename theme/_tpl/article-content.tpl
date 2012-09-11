{{ include file="_tpl/mobile-controlbar.tpl" }}
		
<div class="addbar">
	{{ include file="_tpl/control-icons.tpl" }}
</div>

<div class="contentbar section-{{ $gimme->section->url_name }}">

	<div class="miniarticle hidden">
		{{ include file="_tpl/article-mini.tpl" }}
	</div> 

	<article>
		{{ if $gimme->article->content_accessible }}    
		
			<header>
				<div class="article_top">
					<h1 id="mobile_startpoint">{{ $gimme->article->name }}</h1>

					<div class="deck">
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
						
				{{ include file="_tpl/article-gallery.tpl" }}
			</header>

			<div class="mcontentbar">
			
				{{ include file="_tpl/article-info.tpl" }}
			
				{{ $gimme->article->full_text }}
				
				<script type="text/javascript">articleImageAlts();</script>
				
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
		<div class="forum">
	
			<a name="comments"></a>
			<div id="disqus_thread"></div>
		
		</div><!-- /forum -->
		
	{{ /if }}	
		
</div>
