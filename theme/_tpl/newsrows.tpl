<div class="dynamic-articlerows">
<!-- /start articlerows/ -->

{{ if $gimme->section->number }}
	{{ $condition = "OnSection" }}
	{{ $show_blogs = false }}
{{ else }}
	{{ $condition = "OnFrontPage" }}
	{{ $show_blogs = true }}
{{ /if }}

{{ if $smarty.get.limit }} {{ $articles_on_page = $smarty.get.limit }} {{ else }} {{ $articles_on_page = 30 }} {{ /if }}
{{ $column = 0 }}
{{ $articles_num = 0 }}
{{ $articles_num_stock = 0 }}
{{ $articles_num_rendered = 0 }}
{{ $articles_num_total_1 = 0 }}
{{ $articles_num_total_2 = 0 }}

{{ list_articles order="byPublishDate desc" ignore_issue="true" constraints="issue greater_equal 3 `$condition` is on" length="{{ $articles_on_page + 2 }}" }}
	{{ $articles[$articles_num]["number"] = $gimme->article->number }}
	{{ $articles[$articles_num]["doubleview"] = $gimme->article->frontpage_doubleview }}
	{{ $articles[$articles_num]["rendered"] = false }}
	{{ $articles[$articles_num]["newsbox"] = {{ include file="_tpl/newsbox.tpl" }} }}
	{{ $articles_num = $articles_num + 1 }}
	{{ $articles_num_total_1 = $gimme->current_list->count }}
{{ /list_articles }}

{{ list_articles order="byPublishDate desc" ignore_issue="true" constraints="issue greater_equal 6 `$condition` is off" length="{{ $articles_on_page + 2 - $articles_num }}" }}
	{{ $articles[$articles_num]["number"] = $gimme->article->number }}
	{{ $articles[$articles_num]["doubleview"] = $gimme->article->frontpage_doubleview }}
	{{ $articles[$articles_num]["rendered"] = false }}
	{{ $articles[$articles_num]["newsbox"] = {{ include file="_tpl/newsbox.tpl" }} }}
	{{ $articles_num = $articles_num + 1 }}
	{{ $articles_num_total_2 = $gimme->current_list->count }}
{{ /list_articles }}

{{ $articles_num_total = $articles_num_total_1 + $articles_num_total_2 }}

{{ $articles_num_stock = $articles_num }}
{{ if $articles_num > $articles_on_page }} {{ $articles_num = $articles_on_page }} {{ /if }}
				
{{ if $articles_num >= 8 }} {{ $blogs_pos = 8 }} {{ else }} {{ $blogs_pos = 2 }} {{ /if }}

{{ if $articles_start > $blogs_pos }} {{ $show_blogs = false }} {{ /if }}
				
{{ $i = 0 }}

{{ while $i < $articles_num_stock }}
						
	{{ if $column == $blogs_pos and $show_blogs }} {{ include file="_tpl/front-blogsdossiers.tpl" }} {{ $show_blogs = false }} {{ /if }}
						
	{{ if $articles[$i]["rendered"] }} {{ $i = $i + 1 }} {{continue}} {{ /if }}
	
	{{ if $i >= $articles_on_page and ($column%2==0 or $articles[$i]["doubleview"]) }} {{ $i = $i + 1 }} {{continue}} {{ /if }}
		
	{{ $f = false }}
	{{ $ci = $i }}
		
	{{ if $articles[$i]["doubleview"] and $column%2 == 1 }}
		{{ for $j=$i+1 to $articles_num_stock-1 }}
			{{ if $articles[$j]["doubleview"] == 0 and not $articles[$j]["rendered"] }}
				{{ $articles[$j]["rendered"] = true }}
				{{ $ci = $j }}
				{{ $f = true }}
				{{ break }}
			{{ /if }}
		{{ /for }}
	{{ /if }}
			
	{{ if $column%2 == 0 }}
		<div class="row newsrow"><div class="content-left">
	{{ else }}
		<div class="content-right">
	{{ /if }}
	
		{{ if $articles[$ci]["doubleview"] }}
			{{ if $column%2 == 1 }}</div></div><div class="row newsrow"><div class="content-left">{{ /if }}
			{{ $column=$column+1 }}
		{{ /if }}
		
		{{ $articles[$ci]["newsbox"] }}
		
		{{ $articles_num_rendered = $articles_num_rendered+1 }}
		
	{{ if $column%2 == 0 }}
		</div>
	{{ else }}
		</div></div>
	{{ /if }}
		
	{{ $column=$column+1 }}
		
	{{ if not $f }} {{ $i = $i + 1 }} {{ /if }}
	
{{ /while }}

{{ if $column%2 == 1 }}</div>{{ /if }}

{{ if $articles_num_rendered < $articles_num_total }}
	<div class="weitere">
		<div class="wline"></div>
		<a href="{{ url options="section" }}?limit={{ $articles_on_page + 30 }}" onclick="return loadWeitereArtikel(this);">weitere Artikel</a>
	</div>
{{ /if }}

<!-- /end articlerows/ -->
</div>

<!-- Hidden Disqus on Frontpage -->
<div class="hidden">
	<div id="disqus_thread"></div>
</div>
