
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
													'<input id="usernamesignup" name="username" required="required" type="text" placeholder="username" />'+
												'</p>'+
												'<p>'+
													'<label for="emailsignup" class="youmail" data-icon="e">Indirizzo email</label>'+ 
													'<input id="emailsignup" name="mail" required="required" type="email" placeholder="email" />'+
												'</p>'+
												'<p style="margin-top: 30px;">'+
													'<IMG SRC="./stickyImg" style="width: 250px;height: 60px;">'+
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

			<table align="center" style="background: transparent; border-spacing: 0;">
				<tr>

					<td style="border-radius: 5px; background: transparent">


						<div id="content-body" style="border: 1px solid white;">
						
							<div style="margin-top: 20px;width:960px" class="subcolumn1-1" id="content-text">
            
            <div style="width: 970px;height: 300px;border-bottom: 1px solid #c1c1c1;">  
              <h1 style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              SUPPORTO TECNICO 
				              </h1> 
               <p style="width: 350px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							 
            Se hai domande o se hai bisogno di aiuto, puoi contare sul nostro supporto clienti 
            il quale garantisce un servizio rapido e professionale per tutti i clienti .
             Il modo pi&ugrave; veloce per ottenere una risposta efficace &egrave; contattarci tramite email all'indirizzo ... o skype .....
             
      				</p>

               <img style="width: 350px;float: right;margin-right: 10px;" 
									src="./res_img/supportTech.jpg">
									
									</div>

             				 <h1 style="margin-top: 20px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              CERTIFICATI SSL
				              </h1>                
				              <ul >
							<li style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
              Cos'&egrave; un certificato SSL
              </li>
              </ul>
                      <p style="color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							
								Un certificato SSL &egrave; uno strumento che assicura una comunicazione sicura di dati sensibili appena viene fatta la sottomissione a un sito web, in particolare vengono identificate le informazioni e i numeri di carta di credito. 
								Il certificato SSL cripta queste informazioni appena vengono trasferite tra siti internet.
								</p>

                        <ul >
							<li style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
              Come funzionano i certificati SSL 
              </li>
              </ul>
              <p style="color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">                                                                                                                        
               
               I certificati SSL criptano le informazioni quando vengono effettuati i pagamenti cosicch&egrave; gli hackers non possono leggere queste informazioni come se stessero fluendo attraverso un'autostrada di informazioni.
				Una volta che i dati raggiungono la destinazione stabilita, vengono decriptati nella forma originale per essere usati. 
				 </p>
                            <ul >
							<li style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                   Per il mio sito internet ho bisogno di un certificato SSL? 
                   </li>
              </ul>
                  <p style="border-bottom:1px solid #c1c1c1;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 20px 50px;">
					
					Se stai ricevendo dei pagamenti direttamente dal tuo negozio online, avrai bisogno di un certificato SSL. 
					Questo essenziale strumento &egrave; richiesto per le transazioni online. In aggiunta, i clienti hanno una garanzia nel sapere che il vostro sito web &egrave; sicuro, ci&ograve; incrementer&agrave; le conversioni. 
					Se stai usando il QuickBooks Web Connector, avrai anche  bisogno di un certificato SSL.
					</p>    
                    
                    
                     <h1 style="margin-top: 20px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              PAYPAL
				              </h1>
				              <p style="border-bottom:1px solid #c1c1c1; color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 20px 50px;">
								fase1<br>
								Visita PayPal.com e fare clic su "Inizia ora ".<br>
								
								fase 2<br>
								Immettere le informazioni richieste . Il processo richiede il nome del proprietario del conto PayPal , indirizzo, indirizzo email , indirizzo commerciale e le informazioni di contatto del servizio clienti business . Una volta che sono state inserite tutte le informazioni richieste, inviare il modulo.
								<br>
								fase 3 <br>
								Apri la tua email e controllare i nuovi messaggi . Cercare l'email di verifica inviata da PayPal . Questa notifica normalmente arriva in pochi minuti ed &egrave; necessario per aprire il tuo conto .
								<br>
								fase 4<br>
								Accedere a PayPal e seguire le istruzioni rimanenti che richiedono di immettere informazioni sul tuo conto bancario . &Egrave; possibile impostare un conto Business PayPal o con un conto bancario personale o aziendale . Inserisci il nome della tua banca con il numero di conto personale o aziendale e il numero di account come indicato . PayPal invier&agrave; una richiesta di verifica alla banca sotto forma di due piccoli depositi . Normalmente ci vogliono 3-5 giorni il processo di verifica da completare.
								<br>
								fase 5<br>
								Controllare le vostre transazioni personali o bancarie tre o cinque giorni dopo aver impostato l'account PayPal. Una volta che vedete due depositi da PayPal , &egrave; possibile completare la configurazione dell'account .
								<br>
								fase 6<br>
								Accedi al tuo conto PayPal e segui le istruzioni per completare la verifica del tuo conto bancario personale o aziendale. PayPal vi dir&agrave; che il vostro nuovo conto PayPal &egrave; completato e vi chieder&agrave; di scegliere il metodo di pagamento di business preferito . Potrai anche essere in grado di impostare altre funzioni di business come ad esempio la richiesta di una MasterCard di addebito, o la creazione di un sistema di shopping online.
							  </p>


						<h1 style="margin-top: 20px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              DOMINIO
				              </h1>
				              <p style="color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
								Il nome di dominio &egrave; la prima scelta necessaria da fare per stabilire il vostro business online. L'indirizzo web &egrave; una decisione importante perch&egrave; tramite esso i clienti potranno trovare il tuo nuovo negozio.
								Dovreste scegliere il vostro nome di dominio in maniera tale che rappresenti la vostra azienda e i vostri interessi. Tenere in mente il marchio, ci&ograve; che offrite. Tutto questo contribuisce a richiamare traffico mirato verso il vostro sito web.
								Se riuscite a mantenere un nome breve ci sono molte meno probabilit&agrave; che la gente sbagli la digitazione del nome di dominio.Sicuramente un dominio breve &egrave; pi&ugrave; facile da ricordare quindi &egrave; probabile che la gente ne parli pi&ugrave; facilmente. Tutto questo facilita la conoscenza del vostro sito.
								 </p>
						
                    </div>
                    
                    
		</div>
		
              
              

							    <div id="content-footer">
			<a style="float: left;"><img style="margin: 10px;"src="./res_img/creditCards.png">
				
								<!-- AddThis Button BEGIN -->
				<div style="margin-right: 30px;margin-top: 10px;margin-left: 100px;width: 250px;display: inline-block;" class="addthis_toolbox addthis_default_style addthis_32x32_style">
				
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
		 
            
            </div>

            
					</td>

				</tr>
				<%@ include file="/include/footerLayout.jsp"%>
			</table>

		</div>
</body>