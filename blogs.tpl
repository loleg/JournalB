<!-- Blogs page template -->

{{ include file="_tpl/_html-head.tpl" }}

<body class="section-page">

<div class="container">

    <div class="main">

        {{ include file="_tpl/header.tpl" }}

        <div class="row content">

	        {{ include file="_tpl/blogs-list.tpl" }}
            
        </div><!-- /content -->

    </div><!-- /main -->

    <div class="sidebar">

        <div class="row header">
            <div class="row nav" align="center">
                <ul><li style="float: none;"><a href="#">Community</a></li></ul>
            </div>
        </div>

        <div class="row content">
            
            {{ include file="_tpl/community.tpl" }}

        </div>

    </div>

</div><!-- /container -->

{{ include file="_tpl/_html-foot.tpl" }}