<!-- Search page template -->

{{ include file="_tpl/_html-head.tpl" }}

<body class="search-page">

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}
        
        <div class="searchbox search-top">
        	<h1>Suchen</h1>
		</div>

        <ol class="row content search-content">

			{{ include file="_tpl/search-content.tpl" }}
            
        </ol><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        {{ include file="_tpl/community-header.tpl" }}

        <div class="row content">
            
            {{ include file="_tpl/community.tpl" }}

        </div>

    </div>
	
	{{ include file="_tpl/footer.tpl" }}

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}