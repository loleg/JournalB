
{{ if not $gimme->section->description == "" }}
	<div class="row adbox authorbox collapse_box">
		<div class="community-title grey collapse_title">Zum Thema</div>
		<div class="description collapse_content">
			{{ $gimme->section->description }}
		</div>
	</div>
{{ /if }}