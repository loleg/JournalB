{{ image rendition="articlebig" }}
              <figure class="clearall">
                  <img src="{{ $image->src }}" width="{{ $image->width }}" height="{{ $image->height }}" style="max-width: 100%" alt="{{ $image->caption }} (photo: {{ $image->photographer }})" />
              </figure>
{{ /image }} 
