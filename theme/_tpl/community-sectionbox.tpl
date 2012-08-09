
{{ if not $gimme->section->description == "" }}
	<div class="row adbox authorbox">
		<div class="community-title grey underline">Zum Thema</div>
		<description>
			{{ $gimme->section->description }}
		</description>
	</div>
{{ /if }}