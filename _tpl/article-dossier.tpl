<div class="contentbar section-politik">

	<article>
		<h1>{{ $gimme->article->name }}</h1>  

		<div class="article_info_mobile">
			<time>
				{{ if $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" == $smarty.now|camp_date_format:"%e.%m.%Y"}}
					{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
				{{ else }}
					{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
				{{ /if }}
			</time> | 
			<author>{{ $gimme->article->author->name }}</author>
		</div>
		
		{{ include file="_tpl/article-gallery.tpl" }}
		
		<div class="dossier-deck">
			{{ if $gimme->article->subtitle != "" }}<span class="subtitle">{{ $gimme->article->subtitle }}</span>{{ /if }}
			{{ $gimme->article->full_text }}
		</div>

		<div class="dossier-articles">
		{{ list_related_articles }}
				
			<div class="newsbox section-{{ $gimme->article->section->url_name }} layoutbgimage" onclick="location='{{ uri options="article" }}'"
			{{ image rendition="topfront" }} style="background-image: url({{ $image->src }});" {{ /image }}>
		
				<info>
					<div>
						<span class="info">
							<time>
								{{ if $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" == $smarty.now|camp_date_format:"%e.%m.%Y"}}
									{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}
								{{ else }}
									{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}
								{{ /if }}
							</time> | 
						</span>
						<h1><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h1>
					</div>
				</info>
			
				<a class="favorite" href="#">Favorite</a>
				
			</div>
						
		{{ /list_related_articles }}
		</div>

	</article>

<aside>
 {{ if $gimme->article->has_map }}                
        <article>
            <figure>
                <div class="map-holder">
                {{ map show_locations_list="false" show_reset_link="false" width="300" height="250" auto_zoom=false }}
                </div>
            </figure>
        </article>
{{ /if }}                
                
{{ if !($gimme->article->youtube_shortcode == "") }}
           <article>                         
               <figure>
              <script type="text/javascript">
var embedParts="{{ $gimme->article->youtube_shortcode }}".split("/");
document.write("<iframe title=\"YouTube video player\" width=\"300\" height=\"229\" src=\"http://www.youtube.com/embed/"+embedParts[3]+"?wmode=opaque\" frameborder=\"0\" allowfullscreen></iframe>");
</script>
                <p>{{ $gimme->article->youtube_video_description }}</p>
            </figure>
        </article>
{{ /if }}

{{ if !($gimme->article->linklist == "") }}            
              <article class="mobile-hide">
                  <header>
                      <p>Interessante Links zum Thema</p>
                    </header>
                    
{{ $links=str_replace("<p>", "", explode("</p>", str_replace("<div>", "", str_replace("</div>", "", $gimme->article->linklist)))) }}
{{ foreach $links as $link }}
{{ $linkAry=explode("- ", $link, 2) }}
{{ if count($linkAry) == 2 }}     
               
                    <section class="recommend">
                        <p>{{ substr($linkAry[1], 0) }} {{ $linkAry[0] }}</p>
                    </section>

{{ /if }}
{{ /foreach }}                    

                  <footer>
                      <a href="#" class="more">Link vorschlagen</a>
                    </footer>
                </article>
{{ /if }}
 </aside>
 
	
</div>

