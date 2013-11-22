
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/header.jsp"%>

<body>

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
													'<input id="usernamesignup" name="username" required="required" type="text" placeholder="mysuperusername690" />'+
												'</p>'+
												'<p>'+
													'<label for="emailsignup" class="youmail" data-icon="e">Indirizzo email</label>'+ 
													'<input id="emailsignup" name="mail" required="required" type="email" placeholder="mysupermail@mail.com" />'+
												'</p>'+
												'<p style="margin-top: 30px;">'+
													'<IMG SRC="./stickyImg" style="width: 250px;height: 60px;">'+
													'<span style="float: right;" src="res_img/captchaLogo.png"> Qual\'è il codice dell\'immagine?</span>'+
													'<INPUT TYPE="text" NAME="captchaValue" VALUE="" placeholder="Captcha" class="customCaptcha" style="width: 175px;float: right;margin-top: -40px;padding: 10px 5px;">'+
												
												'</p>'+
												'<p class="signin button">'+
													'<input id="submitForm" style="margin-top: 20px;" type="submit" value="Registrati" />'+
												'</p>'+
												'<p class="change_link" style="margin-top: 30px;">Sei già registrato ?<a href="#tologin" class="to_register"> Vai alla login </a>'+
												'</p>'+
											'</div>'+

										'</div>'+
										'</form>'+ 
									'</div>'+
								'</section>'+
							'</div>'+
						'</body>'+
						'</html>';
					
					
						$('#roleForm').live('submit', function(){		          
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
	                                    if(data.msg==1){
	        			                    	  $('#error-container').html('Il captcha che hai inserito è errato!').css("background","#4AB3C6").css("line-height","2").css("margin","10px 0").css("color","white").css("border","2px solid #ccc").css("height", "30px").css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif");
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

	<%@ include file="/include/headerLayout.jsp"%>
	<div id="content-container">

		<div id="content">

			<table style="background: transparent; border-spacing: 0;">
				<tr>
					<td style="width: 50%; background: transparent"></td>

					<td style="border-radius: 5px; background: transparent">


						<div id="content-body">
						
							<div style="margin-top: 20px;" class="subcolumn1-1" id="content-text">

             				 <h1 style="color:#46565F;font-weight:bold;font-size: 20px; line-height: 25px; padding: 0 50px;text-align:left">
				              LA NOSTRA OFFERTA
				              </h1>
				              <p style="color:black;text-align: left;font-size: 12px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
								Il settore dell'Information technology è in continua evoluzione a una velocità sempre piu rapida nuove tecnologie e nuovi dispoisitivi si affacciano sul mercato ogni giorno ed è sempre piu difficile tenersi al passo.
                Noi siamo una realta giovane sul mercato ma con molti anni di esperienza tecnica. Ci occupiamo di costruire architetture enterprise, mobile e distribuite.
							</p>

								<br>
                <div style="width: 980px;">
                <p style="color:black;text-align: left;font-size: 12px; line-height: 25px;margin-bottom: 0px; margin-top: 0px;padding: 0 0px 0 50px;width: 350px;float: left;">                                                                                                                        
                Attualmente abbiamo già disponibile una architettura enterprise che è quella su cui è basato CloudyEcommerce e inoltre una architettura mobile che ci permette di creare applicativi deploiabili su piu dispositivi differenti in totale trasparenza. Lavoriamo principalmente con tecnologie java , javascript, html css. I servizi che offriamo vanno dalla consulenza in analisi o sviluppo di sofware alla vendita di architetture e componenti software. 
Le spiccate capacita di problem solving in seguito a svariati anni di lavoro su differenti progetti enterprise per realtà informatiche medio grandi uniti all'utilizzo di metodologie di analisi funzionale e 
 </p>

 <img style="width: 550px;float: right;margin-right: 10px;" 
									src="./res_img/diagramma.png">
                  
                   <p style="color:black;text-align: left;font-size: 12px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
 tecnica all'avanguardia e all'utilizzo di tecniche di continous integration fanno si che la gestione di progetti complessi in tutte le sue fasi diventi un percorso fattibile e non come in molti casi un incubo. 
CloudyEcommerce è il primo dei nostri progetti ma abbiamo in cantiere un gioco su facebook oltre a tutta una serie du funzionalitá aggiuntive per CloudyEcommerce che sono illustrate nell'apposito link e volta per volta viene aggiornato quando le funzionalita vengono ultimate o quando ne stanno arrivando di nuove.
</p> 
                  
                    </div>
							</div>
              
              	<ul style="display: inline-block;">
                    <p>TECNOLOGIE LATO SERVER</p>
                         <li style="list-style: disc outside none;font-size: 13px;">J2EE</li>
                         <li style="list-style: disc outside none;font-size: 13px;">JMS</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Hibernate</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Struts 2</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Spring</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Spring Security</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Quartz scheduling framework</li>
                         <li style="list-style: disc outside none;font-size: 13px;">OSGI</li>
                      </ul>
                      <ul style="display: inline-block;padding: 0 140px;line-height: 2;">   
                         <p>TECNOLOGIE CLIENT E MOBILE</p>
                         <li style="list-style: disc outside none;font-size: 13px;">Ext JS</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Sencha Touch</li>
                         <li style="list-style: disc outside none;font-size: 13px;">jQuery</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Android</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Javascript</li>
                     </ul>    
                    <ul style="display: inline-block;line-height: 1.7;">     
                         <p>CONTINUOUS INTEGRATION</p>
                         <li style="list-style: disc outside none;font-size: 13px;">Maven</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Ant</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Hudson</li>
                         <li style="list-style: disc outside none;font-size: 13px;">jUnit</li>
                         <li style="list-style: disc outside none;font-size: 13px;">SVN</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Git</li>
                    </ul>

							  <div id="content-footer">
			<a style="float: left;"><img style="margin: 10px;"src="./res_img/creditCards.png"
				
								<!-- AddThis Button BEGIN -->
				<div style="float: right;margin-right: 30px;margin-top: 15px;" class="addthis_toolbox addthis_default_style addthis_32x32_style">
				
				<p style="font-size:15px;color:#36aad8;font-family: arial;font-weight: normal;margin-right: 10px;line-height: 0.3;">Condividi</p>
				 <a class="addthis_button_facebook"></a>
	    					   <a class="addthis_button_twitter"></a>
	    					   <a class="addthis_button_pinterest_share"></a>
	    					   <a class="addthis_button_linkedin"></a>
	    					   <a class="addthis_button_google_plusone_share"></a>
				</div>
				<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-525d1d5f0490962c"></script>
				
				<!-- per rimuovere hash dall'url -->
				<script type="text/javascript">
		          var addthis_config = addthis_config||{};
		          addthis_config.data_track_addressbar = false;
		        </script>
				<!-- AddThis Button END -->
				
		</div>
		 
            
            </div>

            
					</td>

					<td style="width: 100%; background: transparent"></td>

				</tr>
				<%@ include file="/include/footerLayout.jsp"%>
			</table>

		</div>
</body>