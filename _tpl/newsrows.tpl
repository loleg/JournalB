{{ assign var="articles_on_page" value="10" }}

{{ assign var="column" value="0" }}
{{ assign var="articles_num" value="0" }}
{{ assign var="articles_num_stock" value="0" }}
{{ assign var="pagination" value="" }}

{{ list_articles order="bycustom.num.highlight.0 desc byPublishDate desc" ignore_issue="true" constraints="`$condition`" length="`$articles_on_page + 2`" }}
	{{ $articles[$articles_num]["number"] = $gimme->article->number }}
	{{ $articles[$articles_num]["doubleview"] = $gimme->article->frontpage_doubleview }}
	{{ $articles[$articles_num]["rendered"] = false }}
	{{ $articles_num = $articles_num + 1 }}
	
	{{ if $gimme->current_list->at_end }}
	
		<!-- Page Navigation -->
		
		{{ $pages=ceil($gimme->current_list->count/$articles_on_page) }}
		{{ $curpage=intval($gimme->url->get_parameter($gimme->current_list_id())) }}
		{{ if $pages gt 1 }}
			{{ $pagination = $pagination|cat:'<ul class="pagination">' }}
				{{ if $gimme->current_list->has_previous_elements }}
					{{ $pagination = $pagination|cat:'<li class="prev"><a href="' }}
					{{ $pagination = $pagination|cat:{{ uripath options="publication" }} }}
					{{ $pagination = $pagination|cat:'?' }}
					{{ $pagination = $pagination|cat:{{ urlparameters options="previous_items" }} }}
					{{ $pagination = $pagination|cat:'">Previous</a></li>' }}
				{{ /if }}
				{{ for $i=0 to $pages - 1 }}
					{{ $curlistid=$i*$articles_on_page }}
					{{ $gimme->url->set_parameter($gimme->current_list_id(),$curlistid) }}
					{{ $pagination = $pagination|cat:'<li' }}
					{{ if $curlistid == $curpage }} {{ $pagination = $pagination|cat:' class="selected"' }} {{ $remi=$i+1 }} {{ /if }}
					{{ $pagination = $pagination|cat:'><a href="' }}
					{{ $pagination = $pagination|cat:{{ uripath options="publication" }} }}
					{{ $pagination = $pagination|cat:'?' }}
					{{ $pagination = $pagination|cat:{{ urlparameters }} }}
					{{ $pagination = $pagination|cat:'">' }}
					{{ $pagination = $pagination|cat:{{ $i+1 }} }}
					{{ $pagination = $pagination|cat:'</a></li>' }}
				{{ /for }}
				{{ if $gimme->current_list->has_next_elements }}
					{{ $pagination = $pagination|cat:'<li class="next"><a href="' }}
					{{ $pagination = $pagination|cat:{{ uripath options="publication" }} }}
					{{ $pagination = $pagination|cat:'?' }}
					{{ $pagination = $pagination|cat:{{ urlparameters options="next_items" }} }}
					{{ $pagination = $pagination|cat:'">Next</a></li>' }}
				{{ /if }}
			{{ $pagination = $pagination|cat:'</ul>' }}
			{{ $pagination = $pagination|cat:'<div style="clear: both"></div>' }}
			{{ $gimme->url->set_parameter($gimme->current_list_id(),$curpage) }}
		{{ /if }}
	
	{{ /if }}
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
