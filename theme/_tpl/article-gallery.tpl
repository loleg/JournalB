{{ set_default_article }}
{{ $is_gallery = false }}

<div id="slider_box" class="slider_box">
  <div id="slider" class="slider">
  <ul>

    {{ foreach $gimme->article->slideshows as $slideshow }}
      {{ foreach $slideshow->items as $item }}
        {{ if $item->is_image }}
          {{ if $item->image->width != 470 }} {{ continue }} {{ /if }}
          {{ $is_gallery = true }}
          <li class="sli_image"><img src="{{ $item->image->src }}" alt="{{ $item->caption }}" /></li>
        {{ /if }}
        
        {{ if $item->is_video }}
          {{ $is_gallery = true }}
          {{ $url = $item->video->url|replace:'youtu.be':'www.youtube.com/embed' }}
          {{ $url = $url|replace:'youtube.com/embed':'youtube.com/embed' }}
          {{ if preg_match("/youtube/", $url) }}
            <li class="sli_video"><iframe src="{{ $url }}?hl=de_DE" frameborder="0" alt="{{ $item->caption }}" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></li>
          {{ else }}
            <li class="sli_video"><iframe src="{{ $url }}" frameborder="0" alt="{{ $item->caption }}" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></li>
          {{ /if }}
        {{ /if }}
      {{ /foreach }}
      {{ break }}
    {{ /foreach }}
    
    {{ if not $is_gallery }}
      {{ image rendition="articlebig" }}
        {{ $is_gallery = true }}
        <li><img src="{{ $image->src }}" alt="{{ $image->caption }}" /></li>
      {{ /image }} 
    {{ /if }}
    
  </ul>
  </div>
</div>

{{ if $is_gallery }}
  <script type="text/javascript"> var is_gallery = true; </script>
{{ else }}
  <script type="text/javascript"> var is_gallery = false; $('article .deck').css('padding-bottom','20px'); </script>
{{ /if }}