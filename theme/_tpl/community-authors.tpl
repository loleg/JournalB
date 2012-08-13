{{ if not $gimme->article->author_profile }}
	{{ $i = 0 }}
	{{ list_article_authors }}
		{{ if $gimme->current_list->at_beginning }}
		<div class="row adbox authorbox collapse_box">
			<div class="community-title grey underline collapse_title">Zum Autor</div>
			<description class="collapse_content">
		{{ /if }}
			{{ $ren = false }}
			{{ foreach from=$rendered_authors item=author }} {{ if $author == $gimme->author->name }} {{ $ren = true }} {{ break }} {{ /if }} {{ /foreach }}
			{{ if not $ren }}		
				<div class='author-block'>
					<img src="{{ $gimme->author->picture->imageurl }}" class="author-pic">
					<div class="author-name">{{ $gimme->author->name }}</div>
					{{ $gimme->author->biography->text }}
				</div>
				{{ $rendered_authors[$i] = $gimme->author->name }}
				{{ $i = $i + 1 }}
			{{ /if }}
		{{ if $gimme->current_list->at_end }}
			</description>
		</div>
		{{ /if }}
	{{ /list_article_authors }}
{{ /if }}