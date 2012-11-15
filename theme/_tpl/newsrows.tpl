<div class="newsrows dynamic-articlerows">
<!-- /start articlerows/ -->

{{ set_current_issue }}
{{ set_default_section }}

{{ if $gimme->section->number }}
  {{ $condition = "OnSection" }}
  {{ $show_blogs = false }}
{{ else }}
  {{ $condition = "OnFrontPage" }}
  {{ $show_blogs = true }}
{{ /if }}

{{ $articles_on_page = 30 }}
{{ $blogs_pos = 8 }}

{{ $start = $gimme->url->get_parameter("ls-art0") }}
{{ $start2 = $gimme->url->get_parameter("ls-art1") }}

{{ $articles_num_1 = 0 }}
{{ $articles_num_2 = 0 }}
{{ $articles_num_total_1 = 0 }}
{{ $articles_num_total_2 = 0 }}

{{ list_articles order="byPublishDate desc" ignore_issue="true" constraints="issue greater_equal 3 `$condition` is on" length="{{ $articles_on_page }}" }}  
  {{ if ($start + $articles_num_1)==$blogs_pos and $show_blogs }} {{ include file="_tpl/front-blogsdossiers.tpl" }} {{ /if }}
  {{ include file="_tpl/newsbox.tpl" }}
  
  {{ $articles_num_1 = $articles_num_1 + 1 }}
  {{ $articles_num_total_1 = $gimme->current_list->count }}
{{ /list_articles }}

{{ list_articles order="byPublishDate desc" ignore_issue="true" constraints="issue greater_equal 6 `$condition` is off" length="{{ $articles_on_page - $articles_num_1 }}" }}
  {{ if ($articles_on_page - $articles_num_1)>0 }}
    {{ include file="_tpl/newsbox.tpl" }}
  
    {{ $articles_num_2 = $articles_num_2 + 1 }}
  {{ /if }}
  {{ $articles_num_total_2 = $gimme->current_list->count }}
{{ /list_articles }}

{{ if ($start + $articles_num_1) < $articles_num_total_1 or ($start2 + $articles_num_2) < $articles_num_total_2 }}
  <div class="weitere" style="clear:both">
    <div class="wline"></div>
    <a href="{{ url options="section" }}?ls-art0={{ $start + $articles_num_1 }}&ls-art1={{ $start2 + $articles_num_2 }}" onclick="return loadWeitereArtikel(this);">weitere Artikel</a>
  </div>
{{ /if }}

<!-- /end articlerows/ -->
</div>

<!-- Hidden Disqus on Frontpage -->
<div class="hidden">
  <div id="disqus_thread"></div>
</div>
