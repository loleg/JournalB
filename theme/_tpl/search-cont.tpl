{{ list_search_results order="bypublishdate desc" }}
<li>
	<span class="info">
		<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</date>
	</span>
	{{ image rendition="square" }}<img src="{{ $image->src }}" align="left" />{{ /image }}
	<h4><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></h4>
	<caption>{{ $gimme->article->deck|truncate:150:"...":true }}</caption>
</li>   
{{ /list_search_results }} 