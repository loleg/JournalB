{{ if preg_match("/Mobile/", $smarty.server.HTTP_USER_AGENT) }}
	<script>
		if ($("#mobile_startpoint").length > 0){
		  window.location = "#mobile_startpoint";
		}
	</script>
{{ /if }}

<script>collapsebleElements();</script>
<script src="{{ url static_file='_js/tabs.js' }}"></script>

</body>
</html>