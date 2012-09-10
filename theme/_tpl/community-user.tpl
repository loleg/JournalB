<div class="row adbox authorbox collapse_box">
	<div class="community-title grey collapse_title">Zum Autor</div>
	<div class="description collapse_content">
		<div class='author-block'>
			<div style="background-image:url('{{ $user->author->picture->imageurl }}')" class="author-pic"></div>
			<div class="author-name">
			  {{ if $user->author->user->defined }}
			    <a href="{{ $view->url(['username' => $user->author->user->uname], 'user') }}">
			  {{ /if }}
			  {{ $user->author->name }}
			  {{ if $user->author->user->defined }}
			    </a>
			  {{ /if }}	
			</div>
			{{ $user->author->biography->text }}
		</div>
	</div>
</div>