
{{ if not $gimme->section->description == "" }}
	<div class="row adbox authorbox collapse_box">
		<div class="community-title grey underline collapse_title">Zum Thema</div>
		<description class="collapse_content">
			{{ $gimme->section->description }}
		</description>
	</div>
{{ /if }}