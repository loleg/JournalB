<!-- Start community feed -->
{{ list_articles length="30" order="byPublishDate desc" constraints="issue is 5 type is fweet" ignore_section="true" ignore_issue="true" }} 
	
	{{ include file="_tpl/community-item.tpl" }}
	
{{ /list_articles }}
<!-- End community feed -->

<div class="row socialbox">
	<a href="http://twitter.com/journalb" target="_blank">
	    <div style="float: left; width: 60px;">Follow<br>us on<br>Twitter</div>
    	<div style="float: left; margin-right: 15px; padding-top: 5px;" class="icon icon-twitter"></div>
    </a>
    <a href="http://www.facebook.com/journalb.bern" target="_blank">
	    <div style="float: left; width: 59px;">Join<br>us on<br>Facebook</div>
	    <div style="float: left; padding-top: 5px;" class="icon icon-facebook"></div>
    </a>
</div>

<div class="row adbox supportbox">
    <div class="community-title grey">Journal B<br>unterstutzen</div>
    <div class="icon icon-support"></div>
    <div class="spenden">
    	<div class="description">
    		Alle Artikel auf journal-b.ch sind frei verfügbar. Wenn Ihnen unsere Arbeit etwas wert ist, nutzen Sie doch die Gelegenheit, uns mit einer Spende zu unterstützen oder werden Sie Mitglied in unserem Trägerverein. Danke für Ihren Beitrag.
    	</div>
    	<div class="link"><a href="#" onclick="$(this).parent().hide().parents('.spenden').next().slideDown(); return false;"">Jetzt spenden!</a></div>
    </div>
    <div class="spenden hidden" style="text-align:center; margin-top:1em">
		<a href="http://flattr.com" target="_blank" class="icon icon-flattr" title="Flattr this"><span /></a>
		<a href="https://www.paypal.com/" class="icon icon-paypal" title="Spenden mit PayPal"><span /></a>
		<br/>
		<a href="https://www.yellowpay.ch" class="icon icon-postfinance" title="Spenden mit PostFinance"><span /></a>
		<br/>
		<small>Postcheckkonto: PC 80-667-0</small>
    </div>
</div>