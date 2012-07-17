
<div class="row adbox authorbox">
	<div class="community-title grey underline">Zum Autor</div>
	<description>
		{{ list_article_authors }}
			{{ if $gimme->author->type == "Author"}}
				<div class='author-block'>
					<img src="{{ $gimme->author->picture->imageurl }}" class="author-pic">
					<div class="author-name">{{ $gimme->author->name }}</div>
					{{ $gimme->author->biography->text }}
				</div>
			{{ /if }}
		{{ /list_article_authors }}
	</description>
</div>

{{ if $gimme->article->box_themes!="" }}
	<div class="row adbox">
		<div class="community-title grey underline">Zum Thema</div>
		<description>{{ $gimme->article->box_themes }}</description>
	</div>
{{ /if }}

<div class="row adbox">
	<div class="community-title grey">Weitere Artikel zum Thema</div>

		<p><div class="community-title">Der Vorplatz wird zum Streitpunkt</div>
		<div class="info">13.06.2012 / 13:40 / Marc Lachmann</div></p>
		<p><div class="community-title">Urs Fischer uberholt sogar Alexander Tschappat</div>
		<div class="info">13.06.2012 / 13:40 / Marc Lachmann</div></p>
		<p><div class="community-title">Die Abfallgebuhren steigen ins Unermessliche</div>
		<div class="info">13.06.2012 / 13:40 / Marc Lachmann</div></p>

</div>