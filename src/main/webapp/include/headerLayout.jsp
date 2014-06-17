<script>
	
	jQuery(document).ready(function() {
					jQuery.i18n.properties({
						    name:'Application', 
						    path:'./resources/', 
						    mode:'both',
						    	  callback: function() {
								  
									$('#headerHome').append(jQuery.i18n.prop('org.commercialsite.header.home'));
									$('#headerAboutUs').append(jQuery.i18n.prop('org.commercialsite.header.aboutUs'));
									$('#headerBuy').append(jQuery.i18n.prop('org.commercialsite.header.buy'));
									$('#headerIncoming').append(jQuery.i18n.prop('org.commercialsite.header.incoming'));
									$('#headerSupport').append(jQuery.i18n.prop('org.commercialsite.header.support'));
									$('#headerTry').append(jQuery.i18n.prop('org.commercialsite.header.try'));
									}
					});
	});
</script>

<table style="background: white; margin-top: 20px; border-spacing: 0;">
	<tr>
		<td
			style="margin-bottom: 30px; margin-top: 20px; width: 50%; background: white">
			<a style="float: left; margin-left: 20px;"
			href="./index.jsp"><h1>
					<img height="110" width="380"
						src="./res_img/logo.jpg">
				</h1></a>
		</td>

		<td
			style="margin-bottom: 30px; margin-top: 20px; width: 50%; background: white"></td>

		<td id="header-logo" style="height: 150px;margin-right: 30px;">

			<div>
				<div id="header-menu-box">
					<a href="./index.jsp">
					<img height="50" width="50" style="margin-bottom: 5px;margin-top: 23px"
						class="rollover"
						src="./res_img/home_off.png">
						<span id="headerHome" />
            <br></a>
				</div>
				<div id="header-menu-box">
					<a href="./company.jsp">
									
					<br>
					<img height="50" width="50" style="margin-bottom: 5px;margin-top: 3px"
						class="rollover"
						src="./res_img/company_off.png">
						<span id="headerAboutUs" />
						<br></a>
				</div>
				<div id="header-menu-box">
					<a href="./buy.jsp">
					<br>
					<img height="60" width="60" style="margin-bottom: 5px;margin-top: -7px"
						class="rollover" src="./res_img/pig.png"><span id="headerBuy" /><br></a>
				</div>
				<div id="header-menu-box">
					<a href="./docs.jsp">
				
					<br>
					<img height="50" width="50" style="margin-bottom: 5px;margin-top: 4px"
						class="rollover"
						src="./res_img/megafono.jpg"><span id="headerIncoming" /><br></a>
				</div>
				<div id="header-menu-box">
					<a href="./support.jsp">
					<br>
					<img height="50" width="50" style="margin-bottom: 5px;margin-top: 5px"
						class="rollover"
						src="./res_img/support_off.png"><span id="headerSupport" /><br></a>
				</div>
				<div id="contact-form" style="width: 100px;">
				
					<img height="67" width="90" style="margin-bottom: 5px;margin-top: 14px"
						class="rollover"
						src="./res_img/registrazioneIcona.png"><span id="headerTry" /><br> 
					
				</div>
			</div>
		</td>

	</tr>
</table>
