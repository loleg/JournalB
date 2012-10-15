<a name="mobile_startpoint"></a>

<div class="titlebox section-blogs">
	<h2><a href="{{ uri options="issue" }}">Blog</a> / </h2><h1><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></h1>
</div>

<script>$('.favorite').hide();</script>

{{ assign var="articles_on_page" value="5" }}

<!-- /start articlerows/ -->
{{ list_articles order="byPublishDate desc" length="`$articles_on_page`" }}

	<div class="blogbox section-blogs">

		<div class="info_block">
			<date>{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}</date> | 
			<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date>
		</div>
		<div class="author mainauthor"><a href="{{ if $gimme->article->author->user->uname }}{{ $view->url(['username' => $gimme->article->author->user->uname], 'user') }}{{ /if }}">{{ $gimme->article->author->name }}</a></div>
	
		<div class="blogboxcontent">
			<article>
				<header>
					<div class="title"><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></div>
				</header>
				
				{{ image rendition="articlebig" }}
					<img src="{{ $image->src }}" style="width: 100%" alt="{{ $image->caption }} (photo: {{ $image->photographer }})" />
				{{ /image }}
									
				{{ if $gimme->current_list->at_beginning }}
					<description class="font-sens">{{ $gimme->article->full_text }}</description>
				{{ else }}
					<description  class="font-sens">{{ $gimme->article->full_text->first_paragraph }}</description>
				{{ /if }}
			</article>
		</div>
		
		<div class="weiter"><a href="{{ uri options="article" }}">> weiter lesen</a></div>
		
	</div>
	
	{{ if $gimme->current_list->at_end }}
		<!-- /end articlerows/ -->

		{{ $pages=ceil($gimme->current_list->count/$articles_on_page) }}
		{{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
		{{ if $pages gt 1 && $curpage < $pages }}	
			<!-- Page Navigation -->
			<div class="weitere">
				<div class="wline"></div>
				<a href="{{ uripath options="section" }}?{{ urlparameters options="next_items" }}">weitere Einträge</a>
			</div>
			{{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
		{{ /if }}
	
	{{ /if }}
		
{{ /list_articles }}