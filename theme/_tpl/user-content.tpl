{{ if $user->isAuthor() }}
	{{ $escapedName=str_replace(" ", "\ ", $user->author->name) }}
{{ /if }}


<div class="center_contentbar">
	<div class="titlebox section-front" id="mobile_startpoint">
		<h2><a href="{{ uri options="publication" }}">Artikel</a> / </h2><h1>{{ $user->author->name }}</h1>
	</div>

	{{ list_articles ignore_publication="true" ignore_issue="true" ignore_section="true" constraints="author is $escapedName" order="bypublishdate desc" }}
		<div class="itembox layoutnews">
			<info>
				<time>
					{{ if $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" == $smarty.now|camp_date_format:"%e.%m.%Y"}}
						{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
					{{ else }}
						{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
					{{ /if }}
				</time> | 
				<author>{{ $user->author->name }}</author>
			</info>
						
			{{ if $gimme->issue->number == 2 }}
				{{ $section = "blogs" }}
			{{ else }}
				{{ $section = {{ $gimme->section->url_name }} }}
			{{ /if }}
			
			<div class="title section-{{ $section }}">
				<div class="image section-{{ $section }}">{{ include file="_tpl/img/img_thumbnail.tpl" }}</div>
				<div>
					{{ if $gimme->issue->number == 2 }}<span class="minih2"><a href="{{ uri options="section" }}">Blog</a></span> / {{ /if }}
					{{ if $gimme->issue->number == 4 }}<span class="minih2"><a href="#">Kolumne</a></span> / {{ /if }}
					<span class="capitalize"><a href="{{ uri options="article" }}">{{ $gimme->article->title }}</a></span>
				</div>
				<div style="clear: both"></div>
			</div>
			<description>
				{{ if $gimme->article->deck=="" }} 
					{{ $gimme->article->full_text->first_paragraph }}
				{{ else }}
					{{ $gimme->article->deck }}
				{{ /if }}
			</description>
		</div>
	{{ /list_articles }}
</div>