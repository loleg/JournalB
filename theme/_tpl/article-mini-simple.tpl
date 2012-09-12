<div class="article-mini layoutsimple">
	<info>
		{{ if $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" == $smarty.now|camp_date_format:"%d.%m.%Y"}}
			{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
		{{ else }}
			{{ $gimme->article->publish_date|camp_date_format:"%d.%m.%Y" }}
		{{ /if }}
		 | {{ if $user->author->name=="" }} {{ $gimme->article->author->name }} {{ else }} {{ $user->author->name }} {{ /if }}
	</info>
				
	{{ if $gimme->issue->number == 2 }}
		{{ $section = "blogs" }}
	{{ else }}
		{{ $section = {{ $gimme->section->url_name }} }}
	{{ /if }}
	
	<div class="title section-{{ $section }}">
		<div class="image section-{{ $section }}">
		</div>
		<div class="description">
			{{ if $gimme->issue->number == 2 }}<span class="minih2"><a href="{{ uri options="section" }}">Blog</a></span> / {{ /if }}
			{{ if $gimme->issue->number == 4 }}<span class="minih2" style="text-transform: capitalize;">{{ $gimme->article->type_name }}</span> / {{ /if }}
			<span class="capitalize"><a href="{{ uri options="article" }}">{{ $gimme->article->title }}</a></span>
		</div>
		<div style="clear: both"></div>
	</div>
	<div class="description">
		{{ if $gimme->article->deck=="" }} 
			{{ $gimme->article->full_text->first_paragraph }}
		{{ else }}
			{{ $gimme->article->deck|strip_tags }}
		{{ /if }}
	</div>
</div>
