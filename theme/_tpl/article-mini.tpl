{{ if $gimme->issue->url_name == "dossiers" }}
	{{ include file="_tpl/article-mini-dossier.tpl" }}
{{ else }}
	{{ include file="_tpl/article-mini-simple.tpl" }}
{{ /if }}