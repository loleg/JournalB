{{ assign var="articles_on_page" value="50" }}

{{ assign var="column" value="0" }}
{{ assign var="articles_num" value="0" }}
{{ assign var="articles_num_stock" value="0" }}
{{ assign var="pagination" value="" }}

{{ list_articles order="bycustom.num.highlight.0 desc byPublishDate desc" ignore_issue="true" constraints="`$condition`" length="`$articles_on_page + 2`" }}
	{{ $articles[$articles_num]["number"] = $gimme->article->number }}
	{{ $articles[$articles_num]["doubleview"] = $gimme->article->frontpage_doubleview }}
	{{ $articles[$articles_num]["rendered"] = false }}
	{{ $articles_num = $articles_num + 1 }}
{{ /list_articles }}

{{ $articles_num_stock = $articles_num }}
{{ if $articles_num > $articles_on_page }} {{ $articles_num = $articles_on_page }} {{ /if }}
				
{{ $i = 0 }}
{{ while $i < $articles_num_stock }}
						
	{{ if $column == 2 and $show_blogs }} {{ include file="_tpl/front-blogs.tpl" }} {{ /if }}
						
	{{ if $articles[$i]["rendered"] }} {{ $i = $i + 1 }} {{continue}} {{ /if }}
	
	{{ if $i >= $articles_on_page and ($column%2==0 or $articles[$i]["doubleview"]) }} {{ $i = $i + 1 }} {{continue}} {{ /if }}
		
	{{ $f = false }}	
		
	{{ local }}
					
		{{ set_article number="`$articles[$i]['number']`" }}
			
		{{ if $articles[$i]["doubleview"] and $column%2 == 1 }}
			{{ for $j=$i+1 to $articles_num_stock-1 }}
				{{ if $articles[$j]["doubleview"] == 0 and not $articles[$j]["rendered"] }}
					{{ $articles[$j]["rendered"] = true }}
					{{ set_article number="`$articles[$j]['number']`" }}
					{{ $f = true }}
					{{ break }}
				{{ /if }}
			{{ /for }}
		{{ /if }}
		
		{{ if $column%2 == 0 }}<div class="row newsrow">{{ /if }}
		
			{{ if $gimme->article->frontpage_doubleview }}
			
				{{ if $column%2 == 1 }}</div><div class="row newsrow">{{ /if }}
				{{ include file="_tpl/newsbox-double.tpl" }}
				{{ $column=$column+1 }}
				
			{{ elseif $gimme->article->frontpage_image }}
			
				{{ include file="_tpl/newsbox-bgimage.tpl" }}
			
			{{ else }}
			
				{{ include file="_tpl/newsbox-simple.tpl" }}
				
			{{ /if }}
					
		{{ if $column%2 == 1 }}</div>{{ /if }}
			
		{{ $column=$column+1 }}
		
		
	{{ /local }}
	
	{{ if not $f }} {{ $i = $i + 1 }} {{ /if }}
	
{{ /while }}

{{ if $column%2 == 1 }}</div>{{ /if }}

{{ $pagination }}
