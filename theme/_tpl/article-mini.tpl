{{ if $gimme->issue->number == 1 }}
	{{ include file="_tpl/article-mini-dossier.tpl" }}
{{ elseif $gimme->article->issue->number != 3 && $gimme->article->issue->number != 5 }}
	{{ include file="_tpl/article-mini-simple.tpl" }}
{{ /if }}