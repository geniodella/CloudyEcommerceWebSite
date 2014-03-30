
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/header.jsp"%>
<link rel="stylesheet" href="./css/custom-cloudyecommerce.css" media="screen">

<body>
	<%@ include file="/include/headerLayout.jsp"%>
	
	<style type="text/css"> 
	#simplemodal-container a.modalCloseImg {
	    display:inline;
	    z-index:3200;
	    position:absolute;
	    top:5px;
	    right:-98px;
	    cursor:pointer;
	}
</style>

<script>
		$(function() {
			
		
				$("#contact-form").click(function(){
					
					var random = Math.floor((Math.random()*100)+1);
					var html=
						'<!DOCTYPE html>'+
						
						'<html lang="en" class="no-js">'+
					
						'<head>'+
						'<meta charset="UTF-8" />'+
						'<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  -->'+
						'<meta name="viewport" content="width=device-width, initial-scale=1.0">'+
						'<meta name="keywords"'+
							'content="html5, css3, form, switch, animation, :target, pseudo-class" />'+
						'<meta name="author" content="Codrops" />'+
						'<link rel="stylesheet" type="text/css" href="./css/demo.css" />'+
						'<link rel="stylesheet" type="text/css" href="./css/style.css" />'+
						'<link rel="stylesheet" type="text/css" href="./css/animate-custom.css" />'+
						'</head>'+
						'<body>'+
							'<div class="container">'+
								'<!-- Codrops top bar -->'+
								
								'<section>'+
									'<div id="container_demo">'+
										'<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->'+

										'<div id="wrapper">'+

										'<form action="Customer.action" id="roleForm">'+  
											'<div id="register" class="animate form" style="height:390px">'+
                        
												'<h1 style="padding: 10px;">Registrati</h1>'+
                        						'<div id="error-container"></div>'+
												'<p>'+
													'<label for="usernamesignup" class="uname" data-icon="u">Nome Utente</label>'+ 
													'<input id="usernamesignup" name="username" required="required" type="text" placeholder="username" />'+
												'</p>'+
												'<p>'+
													'<label for="emailsignup" class="youmail" data-icon="e">Indirizzo email</label>'+ 
													'<input id="emailsignup" name="mail" required="required" type="email" placeholder="email" />'+
												'</p>'+
												'<p style="margin-top: 30px;">'+
													'<IMG SRC="./stickyImg?'+random+'" style="width: 250px;height: 60px;" id="captchaId">'+
													'<span style="float: right;" src="res_img/captchaLogo.png"> Qual\'è il codice dell\'immagine?</span>'+
													'<INPUT TYPE="text" NAME="captchaValue" VALUE="" placeholder="Captcha" class="customCaptcha" style="width: 175px;float: right;margin-top: -40px;padding: 10px 5px;">'+
												
												'</p>'+
												'<p class="signin button">'+
													'<input id="submitForm" style="margin-top: 20px;" type="submit" value="Registrati" />'+
												'</p>'+
												'<p class="change_link" style="margin-top: 30px;">Sei già registrato ?<a href="#tologin" id="registerButton" class="to_register"> Vai alla login </a>'+
												'</p>'+
											'</div>'+

										'</div>'+
										'</form>'+ 
									'</div>'+
								'</section>'+
							'</div>'+
						'</body>'+
						'</html>';
						
						$('#registerButton').live('click', function(){	
							window.location.href="/24777_BackSite";
						});
					
						
						$('#roleForm').die('submit');
						
						$('#roleForm').live('submit', function(event){	
							
							 $(this).find('input[type=submit]').attr('disabled', 'disabled');
							
							var formData = $("#roleForm").serializeArray();	
              				if(event.handled !== true){   
						    	$.ajax({
						            type: 'POST',
						            url: 'Customer.action',
						            data:formData,
						            dataType: 'json', 
						            success: function(data){  
	                      
	              	      			  if(data.success==true){                  								                                    
										var msg = $('#register');                
	                					$('#register').html('Caricamento...');
						         	    $('#register').animate({
											height: '50px'
									    }); 
						         	    
						         	    $('#register').append("<img id='theImg' src='res_img/loading.gif' style='margin: 0 200px;display: block;'/>").delay(1000).queue(function (next) {
											$('#register').html('Grazie!').append(' Ti arriverà un\'email coi dati di accesso.').css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif").css("line-height","5");
						                	next();
						          	    });
				                      }
	              	      		  else if(data.success==false){
	              	      		   $('input[type="submit"]').removeAttr('disabled');
	              	      			  
	                                    if(data.msg==1){
	        			                    	  $('#error-container').html('Il captcha che hai inserito è errato!').css("background","#4AB3C6").css("line-height","2").css("margin","10px 0").css("color","white").css("border","2px solid #ccc").css("height", "30px").css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif");
	              						}else if (data.msg==2){
	              							 $('#error-container').html('Utente esistente!').css("background","#4AB3C6").css("line-height","2").css("margin","10px 0").css("color","white").css("border","2px solid #ccc").css("height", "30px").css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif");
	              						}
	                                    else{
	              			                 $('#error-container').html('Email esistente!').append(' Inserire una nuova email.').css("background","#4AB3C6").css("line-height","2").css("margin","10px 0").css("color","white").css("border","2px solid #ccc").css("height", "30px").css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif");
	              						}
	                                  }
	                                  event.handled = true;
				                    }	                          
						       });
                			  }
              				return false;
						});    
					
						
					$(html).modal( {
						closeHTML:"<a class='modalCloseImg'>X</a>", 
						containerCss:{
							backgroundColor:"transparent", 
							borderColor:"#fff", 
							height:460, 
							padding:0, 
							width:390
						},
						overlayClose:false
					});
					
					
					
					
				});
		});
				
				</script>
				
	
	<div id="content-container">

		<p>
			<br>
		</p>
		<div id="content">

			<table align="center" style="background: transparent; border-spacing: 0;padding:0 5px">
				<tr>

					<td style="border-radius: 5px; background: transparent">


						<div id="content-body" style="border:none; margin:0px;background: white;">
            
            <p style="font-size:35px;color:black;font-family: 'Della Respira',serif;font-weight: normal;line-height: 2;margin:30px 150px 40px;text-align: center;">Scegli la soluzione migliore per le tue esigenze e i tuoi volumi d'affari.</p>

							<div class="pricing-tabel" id="content-text" style="background: transparent;margin: 0px;padding: 0px">


								<table border="0" bordercolor="#D9DEE1"
									style="padding: 0 20px;background-color: transparent" width="100%" cellpadding="10"
									cellspacing="0">
									
									 <tr>
                  	<th width="30%"
											style="border-top: 1px solid #D9DEE1;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1;background: #ECF2F6;">
                      </th>
                      <th width="2%"></th>
                      <th width="30%"
											style="border-top: 1px solid #D9DEE1;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1;background: white;">
                      </th>
                      <th width="2%"></th>
                      <th width="30%"
											style="border-top: 1px solid #D9DEE1;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1;background: #ECF2F6;">
                      </th>
                  </tr>

									<tr>
										<th width="30%"
											style="border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1; color: #479CCF; background: #ECF2F6; font-size: 20px;"><span style="font-size: 40px;">30</span>&#128;/Mese</th>
										<th width="2%"></th>
                    <th width="30%"
											style="border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1; color: #479CCF; background: white; font-size: 20px;"><span style="font-size: 40px;">80</span>&#128;/Mese</th>
										<th width="2%"></th>
                    <th width="30%"
											style="border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1; color: #479CCF; background: #ECF2F6; font-size: 20px;"><span style="font-size: 40px;">120</span>&#128;/Mese</th>
									</tr>
									<tr>
										<td
											style="font-size: 16px !important; text-align: center; background: #ECF2F6; border-left: 1px solid #D9DEE1; border-right: 1px solid #D9DEE1; border-color: #D9DEE1; border-style: solid solid solid solid; border-width: 0 1px 1px 1px">BASE</td>
										<td></td>
                    <td
											style="font-size: 16px !important; text-align: center; background: white;border-color: #D9DEE1; border-style: solid solid solid solid; border-left: 1px solid #D9DEE1; border-right: 1px solid #D9DEE1; border-width: 0 1px 1px 1px">PROFESSIONALE</td>
										<td></td>
                    <td
											style="font-size: 16px !important; text-align: center; background: #ECF2F6; border-color: #D9DEE1; border-style: solid solid solid solid; border-right: 1px solid #D9DEE1; border-width: 0 1px 1px 1px">ILLIMITATO</td>
										</tr>
                    
                    	<tr>
										<td
											style="font-weight: normal;font-size: 14px;text-align: center; border-right: 1px solid #D9DEE1;border-left: 1px solid #D9DEE1; background: #ECF2F6"></td>
                      <td></td>
										<td
											style="font-weight: normal;font-size: 14px;text-align: center; border-right: 1px solid #D9DEE1;border-left: 1px solid #D9DEE1;background: white;"></td>
                      <td></td>
										<td
											style="font-weight: normal;font-size: 14px;padding: 0 0 0 0px; text-align: center; border-right: 1px solid #D9DEE1;border-left: 1px solid #D9DEE1; background: #ECF2F6"></td>
									
									</tr>
                  
									<tr>
										<td
											style="font-weight: normal;font-size: 14px;text-align: center; border-right: 1px solid #D9DEE1;border-left: 1px solid #D9DEE1; background: #ECF2F6">500
											Prodotti</td>
                      <td></td>
										<td
											style="font-weight: normal;font-size: 14px;text-align: center; border-right: 1px solid #D9DEE1;border-left: 1px solid #D9DEE1;background: white;">3000
											Prodotti</td>
                      <td></td>
										<td
											style="font-weight: normal;font-size: 14px;padding: 0 0 0 0px; text-align: center; border-right: 1px solid #D9DEE1;border-left: 1px solid #D9DEE1; background: #ECF2F6">Prodotti
											illimitati</td>
									
									</tr>
									<tr>
										<td
											style="font-weight: normal;font-size: 14px;text-align: center; border-right: 1px solid #D9DEE1;border-left: 1px solid #D9DEE1; background: #ECF2F6">Spazio
											d'archiviazione 1GB</td>
                      <td></td>
										<td
											style="font-weight: normal;font-size: 14px;text-align: center; border-right: 1px solid #D9DEE1;border-left: 1px solid #D9DEE1;background: white;">Spazio
											d'archiviazione 5GB</td>
                      <td></td>
										<td
											style="font-weight: normal;font-size: 14px;padding: 0; text-align: center; border-right: 1px solid #D9DEE1;border-left: 1px solid #D9DEE1; background: #ECF2F6">Spazio
											d'archiviazione illimitato</td>
									
									</tr>
									<tr>
										<td
											style="font-weight: normal;font-size: 14px;text-align: center;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1; background: #ECF2F6">Larghezza
											di banda illimitata</td>
                      <td></td>
										<td
											style="font-weight: normal;font-size: 14px;text-align: center;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1;background: white;">Larghezza
											di banda illimitata</td>
                      <td></td>
										<td
											style="font-weight: normal;font-size: 14px;padding: 0; text-align: center;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1; background: #ECF2F6">Larghezza
											di banda illimitata</td>
									
									</tr>

									<tr height="30px">
										<td
											style="padding: 0; text-align: center;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1; background: #ECF2F6"></td>
                      <td></td>
										<td
											style="padding: 0; text-align: center;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1; background: white"></td>
                      <td></td>
										<td
											style="padding: 0; text-align: center;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1; background: #ECF2F6"></td>
										
									</tr>

									<tr>
										<td
											style="padding: 0 0 0 95px;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1; background: #ECF2F6">
										
											<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
								<input type="hidden" name="cmd" value="_xclick">
								<input type="hidden" name="currency_code" value="EUR">
								<input type="hidden" name="item_name" value="Cloudy Ecommerce base soluzione mensile">  	
                <input type="hidden" name="business" value="geniodella@gmail.com"> 									
 								<input type="hidden" name="cancel_return" id="cancel_return" value="www.cloudyecommerce.com">
								<input type="hidden" name="hosted_button_id" value="AR48NTJLZMBJJ">
								 <input type="hidden" name="amount" value="30">
								<input type="hidden" name="rm" value="2">
								<input type="hidden" name="notify_url" value="http://www.cloudyecommerce.com/receiveNotificationPaypal.action">
								<input type="image" style="height:44;width:160" src="res_img/bottoneAcquistaBaseBlu.png" border="0" name="submit" alt="PayPal - Il metodo rapido, affidabile e innovativo per pagare e farsi pagare.">
								
								</form>
											
										</td>
                    <td></td>
										<td
											style="padding: 0 0 0 95px;border-right: 1px solid #D9DEE1;border-left: 1px solid #D9DEE1; background: white">
											
												<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
								<input type="hidden" name="cmd" value="_xclick">
								<input type="hidden" name="currency_code" value="EUR">
                <input type="hidden" name="item_name" value="Cloudy Ecommerce professionale soluzione mensile">
								<input type="hidden" name="business" value="geniodella@gmail.com">
								<input type="hidden" name="cancel_return" id="cancel_return" value="www.cloudyecommerce.com">
								<input type="hidden" name="hosted_button_id" value="UBFVK6LHQTJW4">
								 <input type="hidden" name="amount" value="80">
								<input type="hidden" name="rm" value="2">
								<input type="hidden" name="notify_url" value="http://www.cloudyecommerce.com/receiveNotificationPaypal.action">
								<input type="image" style="height:44;width:160" src="res_img/bottoneAcquistaProfessionalBlu.png" border="0" name="submit" alt="PayPal - Il metodo rapido, affidabile e innovativo per pagare e farsi pagare.">
								
								</form>
										</td>
                    <td></td>
										<td
											style="padding: 0 0 0 95px;border-right: 1px solid #D9DEE1;border-left: 1px solid #D9DEE1; background: #ECF2F6">
											
											<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
								<input type="hidden" name="cmd" value="_xclick">
								<input type="hidden" name="currency_code" value="EUR">
                				<input type="hidden" name="item_name" value="Cloudy Ecommerce illimitato soluzione mensile">
								<input type="hidden" name="business" value="geniodella@gmail.com"> 
								<input type="hidden" name="cancel_return" id="cancel_return" value="www.cloudyecommerce.com">
								<input type="hidden" name="hosted_button_id" value="MQ4X5XXBYP4CW">
								 <input type="hidden" name="amount" value="120">
								<input type="hidden" name="rm" value="2">
								<input type="hidden" name="notify_url" value="http://www.cloudyecommerce.com/receiveNotificationPaypal.action">
								<input type="image" style="height:44;width:160" src="res_img/bottoneAcquistaBlu.png" border="0" name="submit" alt="PayPal - Il metodo rapido, affidabile e innovativo per pagare e farsi pagare.">
								
								</form>
										</td>
								
									</tr>
									<tr>
										<td style="background:#ECF2F6;border-right: 1px solid #D9DEE1;border-bottom: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1;">											
										</td>
                    <td></td>
										<td style="background: white;border-bottom: 1px solid #D9DEE1;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1;">											
										</td>
                    <td></td>
										<td style="background:#ECF2F6;border-bottom: 1px solid #D9DEE1;border-right: 1px solid #D9DEE1; border-left: 1px solid #D9DEE1;">											
										</td>
									
									</tr>
								</table>

							</div>
              
              <p style="font-size:35px;color:black;font-family: 'Della Respira',serif;font-weight: normal;text-align:center;margin-left: 10px;line-height: 3;">Offerta speciale</p>
              
              <div class="discount-tabel" id="content-text" style="background: transparent;margin: 20px 0 20px 0;padding: 0px">


								<table border="0" bordercolor="#D9DEE1"
									style="background-color: transparent" width="100%" cellpadding="10"
									cellspacing="0">

									<tr>
										<td
											style="border-radius: 5px 0 0 0;padding: 0 0 0 85px;  background: white">
											<img style="border-radius: 5px;"
											src="res_img/sconto1.png"></img>
										</td> 										
										<td
											style="padding: 0 0 0 85px; background: white">
											<img style="border-radius: 5px;"
											src="res_img/sconto3.png"></img>
										</td>
										<td
											style="border-radius: 0 5px 0 0;padding: 0 0 0 85px; background: white">
											<img style="border-radius: 5px;"
											src="res_img/sconto4.png"></img>
										</td>
									</tr>
									<tr>
										<td
											style="font-size: 16px !important; text-align: center; background: white;">ANNUALE</td>
										<td
											style="font-size: 16px !important; text-align: center; background: white;">ANNUALE</td>										
										<td
											style="font-size: 16px !important; text-align: center; background: white;">ANNUALE</td>
									</tr>
								
									<tr>
										<td
											style="border-radius: 0 0 0 5px;padding: 0 0 0 105px;background: white">
											
											<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
								<input type="hidden" name="cmd" value="_xclick">
								<input type="hidden" name="currency_code" value="EUR">
								<input type="hidden" name="item_name" value="Cloudy Ecommerce base soluzione annuale">
								<input type="hidden" name="business" value="geniodella@gmail.com">
								<input type="hidden" name="cancel_return" id="cancel_return" value="www.cloudyecommerce.com">
								<input type="hidden" name="hosted_button_id" value="V9NXRVAFFSSCE">
								 <input type="hidden" name="amount" value="324">
								<input type="hidden" name="rm" value="2">
								<input type="hidden" name="notify_url" value="http://www.cloudyecommerce.com/receiveNotificationPaypal.action">
								<input type="image" style="height:44;width:160" src="res_img/Seleziona1.png" border="0" name="submit" alt="PayPal - Il metodo rapido, affidabile e innovativo per pagare e farsi pagare.">
								
								</form>
										</td>										
										<td
											style="padding: 0 0 0 105px;background: white">
											
											<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
								<input type="hidden" name="cmd" value="_xclick">
								<input type="hidden" name="currency_code" value="EUR">
								<input type="hidden" name="item_name" value="Cloudy Ecommerce professionale soluzione annuale">
								<input type="hidden" name="business" value="geniodella@gmail.com"> 
								<input type="hidden" name="cancel_return" id="cancel_return" value="www.cloudyecommerce.com">
								<input type="hidden" name="hosted_button_id" value="TJPRS3L9Z47H4">
								 <input type="hidden" name="amount" value="612">
								<input type="hidden" name="rm" value="2">
								<input type="hidden" name="notify_url" value="http://www.cloudyecommerce.com/receiveNotificationPaypal.action">
								<input type="image" style="height:44;width:160" src="res_img/Seleziona3.png" border="0" name="submit" alt="PayPal - Il metodo rapido, affidabile e innovativo per pagare e farsi pagare.">
								
								</form>
										</td>
										<td
											style="border-radius:0 0 5px 0;padding: 0 0 0 105px;background: white">
											
											<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
								<input type="hidden" name="cmd" value="_xclick">
								<input type="hidden" name="currency_code" value="EUR">
								<input type="hidden" name="item_name" value="Cloudy Ecommerce illimitato soluzione annuale">
								<input type="hidden" name="business" value="geniodella@gmail.com">
								<input type="hidden" name="cancel_return" id="cancel_return" value="www.cloudyecommerce.com">
								<input type="hidden" name="hosted_button_id" value="WJZDGS626A89J">
								 <input type="hidden" name="amount" value="1152">
								<input type="hidden" name="rm" value="2">
								<input type="hidden" name="notify_url" value="http://www.cloudyecommerce.com/receiveNotificationPaypal.action">
								<input type="image" style="height:44;width:160" src="res_img/Seleziona4.png" border="0" name="submit" alt="PayPal - Il metodo rapido, affidabile e innovativo per pagare e farsi pagare.">
								
								</form>
										</td>
									
									</tr>
								</table>

							</div>

						</div>

						  <div id="content-footer" style="margin-top: -15px;">
			<a style="float: left;"><img style="margin: 10px;"src="./res_img/creditCards.png">
				
								<!-- AddThis Button BEGIN -->
<!--  			<div style="margin-right: 30px;margin-top: 10px;margin-left: 100px;width: 250px;display: inline-block;" class="addthis_toolbox addthis_default_style addthis_32x32_style">-->
				
				<div id="customAddThis" class="addthis_toolbox addthis_default_style addthis_32x32_style">
								
				<p style="font-size:15px;color:#36aad8;font-family: arial;font-weight: normal;margin-right: 10px;line-height: 0.3;">Condividi</p>
				 <a class="addthis_button_facebook"></a>
	    					   <a class="addthis_button_twitter"></a>
	    					   <a class="addthis_button_pinterest_share"></a>
	    					   <a class="addthis_button_linkedin"></a>
	    					   <a class="addthis_button_google_plusone_share"></a>
				</div>
				
				
					<a style="float: right;margin-right: 30px;font-size: 15px;color: #36aad8;font-family: arial;font-weight: normal;" href="./termsAndConditions.jsp"><br>Termini e condizioni di vendita</a>
				
				
				
				<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-525d1d5f0490962c"></script>
				
				<!-- per rimuovere hash dall'url -->
				<script type="text/javascript">
		          var addthis_config = addthis_config||{};
		          addthis_config.data_track_addressbar = false;
		        </script>
				<!-- AddThis Button END -->
				
		</div>
   
					</td>

				</tr>
			</table>
 <%@ include file="/include/footerLayout.jsp"%>
		</div>
</body>