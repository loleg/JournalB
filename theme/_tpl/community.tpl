<!-- Start community feed -->
{{ list_articles length="20" order="byPublishDate desc" constraints="issue is 2 type is fweet is_ad is off" ignore_section="true" ignore_issue="true" }} 
	{{ include file="_tpl/community-item.tpl" }}
{{ /list_articles }}
<!-- End community feed -->

<div class="row socialbox">
	<a href="http://twitter.com/journalb" target="_blank">
	    <div style="float: left; width: 60px;">Follow<br>us on<br>Twitter</div>
    	<div style="float: left; margin-right: 15px; margin-top: 8px;" class="icon icon-twitter"></div>
    </a>
    <a href="http://www.facebook.com/journalb.bern" target="_blank">
	    <div style="float: left; width: 59px; margin-left: 1em;">Join<br>us on<br>Facebook</div>
	    <div style="float: left; margin-top: 8px; margin-left: 7px;" class="icon icon-facebook"></div>
    </a>
</div>

{{ include file="_tpl/community-spenden.tpl" }}

<div class="community-ads">
	{{ list_articles order="byPublishDate desc" constraints="issue is 2 type is fweet is_ad is on" ignore_section="true" ignore_issue="true" }} 
		{{ include file="_tpl/community-item.tpl" }}
	{{ /list_articles }}
</div>