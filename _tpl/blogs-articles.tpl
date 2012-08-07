
<div class="titlebox section-blogs" id="mobile_startpoint">
	<h2><a href="{{ uri options="issue" }}">Blog</a> / </h2><h1><a href="{{ uri options="section" }}">{{ $gimme->section->name }}</a></h1>
</div>

{{ assign var="articles_on_page" value="10" }}

{{ list_articles order="byPublishDate desc" length="`$articles_on_page`" }}

	<div class="blogbox section-blogs">

		<info>
			<date>{{ $gimme->article->publish_date|camp_date_format:"%e.%m.%Y" }}</date> | 
			<date>{{ $gimme->article->publish_date|camp_date_format:"%H:%i" }}</date> | 
			Nummer {{ $gimme->article->number }}
		</info>
		<author><a href="#">{{ $gimme->article->author->name }}</a></author>
	
		<div class="blogboxcontent">
			<div class="title"><a href="{{ uri options="article" }}">{{ $gimme->article->name }}</a></div>
			<description><p>{{ $gimme->article->full_text }}</p></description>
		</div>
		
		<div class="weiter"><a href="{{ uri options="article" }}">> weiter lesen</a></div>
		
	</div>
		
{{ /list_articles }}