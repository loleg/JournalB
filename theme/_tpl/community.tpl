<!-- Start community feed -->
{{ list_articles length="30" order="byPublishDate desc" constraints="issue is 5 type is fweet" ignore_section="true" ignore_issue="true" }} 
	
	{{ include file="_tpl/community-item.tpl" }}
	
{{ /list_articles }}
<!-- End community feed -->

<div class="row socialbox">
	<a href="http://twitter.com/journalb" target="_blank">
	    <div style="float: left; width: 60px;">Follow<br>us on<br>Twitter</div>
    	<div style="float: left; width: 54px; margin-right: 15px; padding-top: 5px;"><img src="{{ url static_file='_img/twitter_.png' }}"/></div>
    </a>
    <a href="http://www.facebook.com/journalb.bern" target="_blank">
	    <div style="float: left; width: 59px;">Join<br>us on<br>Facebook</div>
	    <div style="float: left; width: 40px; padding-top: 5px;"><img src="{{ url static_file='_img/facebook_.png' }}"></div>
    </a>
</div>

<div class="row adbox supportbox">
    <div class="community-title grey">Journal B<br>unterstutzen</div>
    <div class="icon"><img src="{{ url static_file='_img/unterstutzen.png' }}" /></div>
    <div class="spenden">
    	<div class="description">
    		Alle Artikel auf journal-b.ch sind frei verfügbar. Wenn Ihnen unsere Arbeit etwas wert ist, nutzen Sie doch die Gelegenheit, uns mit einer Spende zu unterstützen oder werden Sie Mitglied in unserem Trägerverein. Danke für Ihren Beitrag.
    	</div>
    	<div class="link"><a href="#" onclick="$(this).parents('.spenden').hide().next().slideDown(); return false;"">Jetzt spenden!</a></div>
    </div>
    <div class="spenden hidden">
    	<div class="description">
    	Praesent dictum porta ante, in congue ante ultrices eu. Pellentesque odio enim, faucibus sit amet.
    	</div>
    	<center><br/>
    		<a href="http://flattr.com" target="_blank"><img src="{{ url static_file='_img/spenden-flattr.png' }}" alt="Flattr this" title="Flattr this"></a>
    		<a href="https://www.paypal.com/"><img src="{{ url static_file='_img/spenden-paypal.gif' }}" alt="Spenden mit PayPal" title="Spenden mit PayPal"></a>
    		<br/>
    		<a href="https://www.yellowpay.ch"><img style="background:black" src="{{ url static_file='_img/spenden-postfinance.gif' }}" alt="Spenden mit PostFinance" title="Spenden mit PostFinance"></a>
    		<br/>
    		<small>Postcheckkonto: PC 80-667-0</small>
    	</center>
    </div>
</div>