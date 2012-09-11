[
{{ list_articles length="50" }}
{ 
	url: '{{ uri options="article" }}', 
	title: '{{ $gimme->article->name }}'
}{{ if !$gimme->current_list->at_end }}, {{ /if }}
{{ /list_articles }}
]