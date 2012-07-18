{{ list_articles ignore_issue="true" ignore_section="true" constraints="type is dossier active is on" order="bysection desc" }}
            
{{ if $gimme->current_list->index == 2 }}                 
                 <div class="mobile-list-view clearfix header-fix">
{{ /if }}            
 
{{ if $gimme->current_list->index == 1 }}            
              <article>
                    <figure class="mobile-pull-left clearfix">
                        <a href="{{ url options="article" }}">{{ include file="_tpl/renditions/img_640x280.tpl" }}</a>
                        <big>Dossier:<br />
                        <b>{{ $gimme->article->name|strip }}</b> {{ $gimme->article->subtitle }}</big>
                    </figure>
                    <p>{{ include file="_tpl/admin_frontpageedit.tpl" }}{{ if !($gimme->article->teaser == "") }}{{ $gimme->article->teaser|strip_tags }}{{ else }}{{ $gimme->article->lede|strip_tags }}{{ /if }} <a href="{{ url options="article" }}">Zum Dossier</a></p>
                </article>
{{ else }}            
                    <article>
                        <figure class="left">
                            <a href="{{ url options="article" }}">{{ include file="_tpl/renditions/img_300x200.tpl" }}</a>
                        </figure>
                        <h2><a href="{{ url options="article" }}">{{ $gimme->article->name|strip }}</a></h2>
                        <p>{{ include file="_tpl/admin_frontpageedit.tpl" }}{{ if !($gimme->article->teaser == "") }}{{ $gimme->article->teaser|strip_tags }}{{ else }}{{ $gimme->article->lede|strip_tags }}{{ /if }}  <a href="{{ url options="article" }}">Zum Dossier</a></p>
                    </article>
{{ /if }}                    

{{ if $gimme->current_list->at_end }}                 
                </div>
{{ /if }}                
{{ /list_articles }}