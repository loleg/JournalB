{{ assign var="column" value="0" }}
{{ assign var="article_section" value="dossiers" }}

{{ list_articles }}

	{{ if $column%2 == 0 }}
		<div class="row newsrow"><div class="content-left">
	{{ else }}
		<div class="content-right">
	{{ /if }}
	
		{{ include file="_tpl/newsbox-simple.tpl" }}
				
	{{ if $column%2 == 0 }}
		</div>
	{{ else }}
		</div></div>
	{{ /if }}
		
	{{ $column=$column+1 }}
	
{{ /list_articles }}

{{ if $column%2 == 1 }}</div>{{ /if }}