{{ if not $gimme->article->author_profile }}
	{{ list_article_authors }}
		{{ if $gimme->current_list->at_beginning }}
		<div class="row adbox authorbox">
			<div class="community-title grey underline">Zum Autor</div>
			<description>
		{{ /if }}
			<div class='author-block'>
				<img src="{{ $gimme->author->picture->imageurl }}" class="author-pic">
				<div class="author-name">{{ $gimme->author->name }}</div>
				{{ $gimme->author->biography->text }}
			</div>
		{{ if $gimme->current_list->at_end }}
			</description>
		</div>
		{{ /if }}
	{{ /list_article_authors }}
{{ /if }}