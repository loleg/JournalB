{{ $condition = "OnFrontPage" }}
{{ $show_blogs = true }}


{{ $articles_on_page = 30 }}
{{ $column = 0 }}
{{ $articles_num = 0 }}
{{ $articles_num_stock = 0 }}
{{ $articles_num_rendered = 0 }}
{{ $articles_num_total = 0 }}
{{ php }} $template->assign('articles_start',$_GET['ls-art0']); {{ /php }}

{{ list_articles order="byPublishDate desc" ignore_issue="true" constraints="issue greater_equal 3 `$condition` is on" length="{{ $articles_on_page + 2 }}" }}
	{{ $articles[$articles_num]["number"] = $gimme->article->number }}
	{{ $articles[$articles_num]["doubleview"] = $gimme->article->frontpage_doubleview }}
	{{ $articles[$articles_num]["rendered"] = false }}
	{{ $articles[$articles_num]["newsbox"] = {{ include file="_tpl/newsbox.tpl" }} }}
	{{ $articles_num = $articles_num + 1 }}
	{{ $articles_num_total = $articles_num_total + $gimme->current_list->count }}
{{ /list_articles }}

{{ list_articles order="byPublishDate desc" ignore_issue="true" constraints="issue greater_equal 6 `$condition` is off" length="{{ $articles_on_page + 2 - $articles_num }}" }}
	{{ $articles[$articles_num]["number"] = $gimme->article->number }}
	{{ $articles[$articles_num]["doubleview"] = $gimme->article->frontpage_doubleview }}
	{{ $articles[$articles_num]["rendered"] = false }}
	{{ $articles[$articles_num]["newsbox"] = {{ include file="_tpl/newsbox.tpl" }} }}
	{{ $articles_num = $articles_num + 1 }}
	{{ $articles_num_total = $articles_num_total + $gimme->current_list->count }}
{{ /list_articles }}

{{ $articles_num_stock = $articles_num }}
{{ if $articles_num > $articles_on_page }} {{ $articles_num = $articles_on_page }} {{ /if }}
				
{{ if $articles_num >= 8 }} {{ $blogs_pos = 8 }} {{ else }} {{ $blogs_pos = 2 }} {{ /if }}

{{ if $articles_start > $blogs_pos }} {{ $show_blogs = false }} {{ /if }}
				
{{ $i = 0 }}
<!-- /start articlerows/ -->
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
<!-- /end articlerows/ -->

{{ if $column%2 == 1 }}</div>{{ /if }}

{{ if ($articles_start+$articles_num_rendered)<$articles_num_total }}
	<div class="weitere">
		<div class="wline"></div>
		<a href="{{ url options="section" }}?ls-art0={{ $articles_start+$articles_on_page+1 }}">weitere Artikel</a>
	</div>
{{ /if }}

<!-- Hidden Disqus on Frontpage -->
<div class="hidden">
	<div id="disqus_thread"></div>
</div>
