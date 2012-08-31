<div class="itembox layoutsimple">
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
		<div class="descr">
			{{ if $gimme->issue->number == 2 }}<span class="minih2"><a href="{{ uri options="section" }}">Blog</a></span> / {{ /if }}
			{{ if $gimme->issue->number == 4 }}<span class="minih2" style="text-transform: capitalize;">{{ $gimme->article->type_name }}</span> / {{ /if }}
			<span class="capitalize"><a href="{{ uri options="article" }}">{{ $gimme->article->title }}</a></span>
		</div>
		<div style="clear: both"></div>
	</div>
	<description>
		{{ if $gimme->article->deck=="" }} 
			{{ $gimme->article->full_text->first_paragraph }}
		{{ else }}
			{{ $gimme->article->deck|strip_tags }}
		{{ /if }}
	</description>
</div>