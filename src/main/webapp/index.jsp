

<%@ include file="./include/head.jsp"%>
<%@ include file="./include/header.jsp"%>


<head>


<!-- jQuery (required) -->




         

<!-- Ideally, add the stylesheet(s) you are going to use here,
	 otherwise they are loaded and appended to the <head> automatically and will over-ride the IE stylesheet below -->

</head>

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

<script type="text/javascript">


    // override Highslide settings here
    // instead of editing the highslide.js file
    hs.graphicsDir = './res_js/highslide/graphics/';
    hs.align = 'center';
    hs.transitions = ['expand', 'crossfade'];
    hs.outlineType = 'rounded-white';
    hs.fadeInOut = true;
   
	// Add the controlbar
	hs.addSlideshow({
		//slideshowGroup: 'group1',
		interval: 5000,
		repeat: false,
		useControls: false,
		fixedControls: 'fit',
		overlayOptions: {
			opacity: 0.75,
			position: 'bottom center',
			hideOnMouseOut: true
		}
	});
             
</script>


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
		

			var randomSlide = Math.floor(Math.random() * 7);

			$('#slider1')
					.anythingSlider(
							{
								theme : 'metallic',
								easing : 'easeInOutBack',//tipo d'animazione
								startPanel : randomSlide,
								buildArrows : true, // If true, builds the forwards and backwards buttons
								autoPlay : true, // If true, the slideshow will start running; replaces "startStopped" option
								autoPlayLocked      : true, // If true, user changing slides will not stop the slideshow
								resumeDelay         : 6000,     // Resume slideshow after user interaction, only if autoplayLocked is true (in milliseconds). 
								buildNavigation : false, // If true, builds a list of anchor links to link to each panel
								buildStartStop : false, // If true, builds the start/stop button
								mode : "orizzontal", // Set mode to "horizontal", "vertical" or "fade" (only first letter needed); replaces vertical option
								enableKeyboard : false, // if false, keyboard arrow keys will not work for this slider.
								stopAtEnd : false, // If true & the slideshow is active, the slideshow will stop on the last page. This also stops the rewind effect when infiniteSlides is false.
								delay : 6000, // How long between slideshow transitions in AutoPlay mode (in milliseconds)
								animationTime : 1500, // How long the slideshow transition takes (in milliseconds)
								pauseOnHover: false,
								hashTags:false,
								navigationFormatter : function(index, panel) {
									return [ 'Slab', 'Parking Lot', 'Drive',
											'Glorius Dawn', 'Bjork?',
											'Traffic Circle' ][index - 1];
								},
								onSlideComplete : function(slider) {
									// alert('Welcome to Slide #' + slider.currentPage);
								}
							});

			// tooltips for first demo
			$.jatt();

		});
	</script>

		<%@ include file="/include/headerLayout.jsp"%>	

  			
	<div id="content-container">


		<div id="content">

<!-- 			<div id="content-header"> -->
<!-- 				<h1> -->
<%-- 					<s:text name="it.ecomweb.page.title.index" /> --%>
<!-- 				</h1> -->
<!-- 			</div> -->

    <table align="center" style="background: transparent;border-spacing: 0;">
      <tr>
    

     <td style="border-radius: 5px;background:transparent">
     
			<div id="content-body">
			
			<div style="background: white;margin: 0px 60px;" id="home-message-text" class="subcolumn1-1">
					<h1 style="font-size: 30px; line-height: 30px; margin-top: 15px;">
					Il software è <b>completamente personalizzabile</b> in base alle tue esigenze!
					</h1>
				</div>
			
  
  			<div id="page-wrap">
					<ul id="slider1">

						<li>
							<div class="textSlide" style="height: 190px;padding:10px 0">
              				<img src="./res_img/productsNavigation.jpg" style="float:left;width:200px; height:230px;padding: 0px 0; margin: 0px 100px 0px 0;position:relative;">
								<h3 style="margin-top: 30px;">Funzionalit&agrave; complete della navigazione prodotti</h3>
								<br>
								<ul style="margin-left:157px">
										<li style="list-style: disc outside none;font-size: 13px;">Immagini multiple per prodotto.
									Possibilit&agrave; di zoommare sull'immagine del
										prodotto.</li>
									<li style="list-style: disc outside none;font-size: 13px;">Prodotti correlati.</li>
									<li style="list-style: disc outside none;font-size: 13px;">Disponibilit&agrave; di stock.</li>
									<li style="list-style: disc outside none;font-size: 13px;">Prezzi multistrato per grandi vendite.</li>
									<li style="list-style: disc outside none;font-size: 13px;">Selezione delle opzioni del prodotto.</li>
								</ul>
							</div>
							<div class="textSlide" style="padding: 30px 0;">
							<img src="./res_img/cart.png" style="float:left;width:200px; height:200px; margin: 30px 100px 0px 0;padding: 25px 0 10px;position:relative;">
								<h3 style="margin-top: 30px;">Funzionalit&agrave; complete del carrello</h3>
								<br>
								<ul style="padding: 0 110px;margin-left:206px">
									<li style="list-style: disc outside none;font-size: 13px;">Checkout in una pagina.</li>
									<li style="list-style: disc outside none;font-size: 13px;">Utilizzo degli SSL per la sicurezza degli ordini, sia sul frontend che sul backend.</li>
									<li style="list-style: disc outside none;font-size: 13px;">Spedizioni a indirizzi diversi in un solo ordine.</li>
									<li style="list-style: disc outside none;font-size: 13px;">Checkout senza account in modalit&agrave; Guest	Checkout.</li>
									<li style="list-style: disc outside none;font-size: 13px;">Carrello con stima di spese fiscali e di spese di spedizione.</li>
									<li style="list-style: disc outside none;font-size: 13px;">Opzione per creare un account all'inizio del checkout.</li>
									<li style="list-style: disc outside none;font-size: 13px;">Salvataggio dei carrelli con tempo di scadenza configurabile.</li>
								</ul>
							</div>							
						</li>
						
						<li>
							<div style="padding:20px 0;height:190px" class="textSlide">
							<img src="./res_img/funzionalitaAcquisto.jpg" style="float:left;width:250px; height:200px;margin: 0px 50px 0px 0;position:relative;">
								<h3 style="margin-top: 10px;">Funzionalit&agrave; di acquisto</h3>
								<br>
								<ul>
									Permetter&agrave; ai tuoi clienti di acquistare anche
										senza essere preventivamente registrati.Questa infatti
										&egrave; una delle caratteristiche pi&ugrave; importanti di un
										ecommerce. Non bloccando il flusso di acquisto al checkout il
										cliente potr&agrave; decidere se acquistare senza registrarsi
										oppure registrarsi durante l'acquisto semplicemente scegliendo
										la propria password.
								</ul>
							</div>
							<div class="textSlide">
							<img src="./res_img/tag.jpg" style="float:left;width:200px; height:200px; margin: 30px 100px 0px 0;position:relative;">
								<h3 style="margin-top: 30px;">Funzionalit&agrave; di ricerca per tag</h3>
								<br>
								<ul>
									Possibilit&agrave; di etichettare i prodotti con un
										numero illimitato di etichette cosi da potenziare la
										funzionalita di ricerca che non viene fatta solo per nome.
									Un algoritmo ricalcola periodicamente il punteggio dei
										tag per mettere in risalto nella barra di ricerca i risultati
										relativi a etichette con punteggio piu alto.
									Possibilit&agrave; di scremare la ricerca per
										categoria o per un numero illimitato di caratteristiche
										relative a un prodotto.</br>
								</ul>
							</div>
						</li>


						<li>
							
							<div class="textSlide" style="height: 190px;">
							<img src="./res_img/customers.jpg" style="float:left;width:200px; height:200px; margin: 0px 100px 0px 0;position:relative;">
								<h3>Gestione clienti</h3>
								<br>
								<ul>
									Ogni cliente ha la possibilit&agrave; di rivedere gli
										ordini fatti e scendere fino al dettaglio della singola
										spedizione analizzandone lo stato in qualsiasi momento.
								</ul>
							</div>
							<div class="textSlide">
							<img src="./res_img/ajax.jpg" style="float:left;width:200px; height:250px; margin:-40px 100px 20px 0;padding: 35px 0;position:relative;">
								<h3 style="margin-top: 20px;">Utilizzo della tecnologia Ajax</h3>
								<br>
								<ul>
									CloudyEcommerce f&agrave; uso della nuovissima
										tecnologia Ajax per velocizzare e migliorare alcune delle
										funzionalit&agrave; pi&ugrave; usate come l'aggiunta al
										carrello. Lo stesso procedimento avviene per
										l'ordinamento dei prodotti in base ad un particolare
										attributo.
									Inoltre la tecnologia ajax viene utilizzata anche
										nella gestione del magazzino, offrendo una esperienza desktop
										like, questo porta grandi vantaggi, soprattutto se ci si trova
										a dover inserire molti prodotti e con periodicit&agrave;
										stringenti perch&egrave; non si &egrave; costretti ad
										aspettare il caricamento di tutta la pagina per
										l&grave;utilizzo di ogni funzionalit&agrave;.
								</ul>
							</div>
						</li>


						<li>
							<div class="textSlide" style="height: 190px;">
							<img src="./res_img/java.png" style="float:left;width:200px; height:200px; margin: 10px 100px 0px 0;position:relative;">
								<h3>Java Enterprise</h3>
								<br>
								<ul>
									Il cuore dell&acute;applicativo &egrave; sviluppato
										con tecnologia Java enterprise questo garantisce che il sito
										di ecommerce sia scalabile a tutti i livelli e fino a volumi
										di utenza molto alti, in contrapposizione ad architetture php
										che incontrano dei colli di bottiglia consistenti riguardo
										alla scalabilit&agrave;, l&acute;utilizzo di tecnologia java
										fa si che CloudyEcommerce si integri perfettamente con
										l&acute;infrastruttura SAAS.
								</ul>
							</div>
							<div class="textSlide">
							<img src="./res_img/customizerIcon.png" style="padding: 10px 0;float:left;width:200px; height:200px; margin: 20px 100px 0px 0;position:relative;">
								<h3 style="margin-top: 30px;">Flessibilit&agrave;</h3>
								<br>
								<ul  style="padding: 0 170px;">
									CloudyEcommerce &egrave; completamente sviluppato da
										noi, non &egrave; una personalizzazione di un altro prodotto,
										ci&ograve; implica che qualsiasi modifica di qualsiasi genere
										&egrave; possibile, basta mettersi in contatto con noi e
										implementeremo le modifiche desiderate dal cliente, questo
										oltre alle modifiche che di volta in volta vengono apportate,
										parliamo di una serie di funzionalit&agrave; aggiuntive che
										vengono installate nell&acute;ecommerce man mano che vengono
										sviluppate.
								</ul>
							</div>
						</li>
						
						<li>
							<div class="textSlide" style="height: 190px;">
							<img src="./res_img/24hours.jpg" style="float:left;width:200px; height:200px; margin: 20px 100px 0px 0;position:relative;">
								<h3 style="margin-top: 30px;">Supporto 24h</h3>
								<br>
								<ul>
									Tutte le installazioni dell&acute;ecommerce vengono
										monitorate 24h da software di Application performance

										management, cosi da individuare eventuali problemi o cali
										delle prestazioni prima che vengano individuate dai clienti,
										questa forma di prevenzione limita i danni enormemente,
										inoltre per qualsiasi domanda o richiesta di aiuto &egrave;
										attivo un servizio tutti i giorni per aiutare i clienti.
								</ul>
							</div>
						
							<div class="textSlide" style="height: 190px;">
							<img src="./res_img/iaas.jpg" style="float:left;width:200px; height:200px; margin: 20px 100px 0px 0;position:relative;">
								<h3 style="margin-top: 30px;">Infrastructure as a Service</h3>
								<br>
								<ul>
									CloudyEcommerce &egrave; un servizio, i vantaggi di questa scelta sono evidenti perch&egrave;
									chi usufruisce di questo servizio non ha bisogno di installare nei propri uffici un' architettura hardware 
									comprensiva di uno o piu server, gruppi di continuit&agrave;, 
									abbonamenti luce e internet	aziendali, sistemi di sicurezza, sistemi di ridondanza e salvataggio dei dati poich&egrave;
									viene gestito tutto da noi.
								</ul>
							</div>
						</li>



					</ul>
					<!-- END AnythingSlider #1 -->
				
			</div>
      
      <p style="font-size:20px;color:#36aad8;font-family: arial;font-weight: normal;margin-left: 10px;line-height: 3;">ANTEPRIMA DI ALCUNE FUNZIONALITA'</p>
      
				<div style="background: white;width: 900px;margin-bottom: 10px;">
					 <a class="highslide" style="margin-left: 30px;" href="./res_img/shotCart.png" onclick="return hs.expand(this)">
		        <img src="./res_img/shotCart2.png" style="visibility: visible;padding: 0 5px;border: none;margin-left: 70px;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="./res_img/shotMostSold.PNG" onclick="return hs.expand(this)">
		         <img src="./res_img/shotMostSold2.PNG" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="./res_img/shotOrderResume.PNG" onclick="return hs.expand(this)">
		         <img src="./res_img/shotOrderResume2.PNG" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="./res_img/shotOrder.PNG" onclick="return hs.expand(this)">
		         <img src="./res_img/shotOrder2.PNG" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="./res_img/shotSearch.PNG" onclick="return hs.expand(this)">
		         <img src="./res_img/shotSearch2.PNG" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="./res_img/shotProdottiInEsaurimento.PNG" onclick="return hs.expand(this)">
		         <img src="./res_img/shotProdottiInEsaurimento2.PNG" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="./res_img/shotDelivery.png" onclick="return hs.expand(this)">
		         <img src="./res_img/shotDelivery2.png" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
     
     
      <span style="display: inline-block;padding-left: 130px; width: 63px;"> carrello</span>
      <span style="margin-left: 35px;display: inline-block;height: 40px;width: 95px;vertical-align: top;"> prodotti più venduti</span>
      <span style="display: inline-block;width: 90px;vertical-align: top;margin-left: 20px;"> riassunto ordini</span> 
      <span style="display: inline-block;width: 74px;vertical-align: top;margin-left: 25px;">ordini nel checkout</span> 
      <span style="display: inline-block;width: 70px;vertical-align: top;margin-left: 45px;"> ricerca</span> 
      <span style="display: inline-block;width: 86px;vertical-align: top;margin-left: 28px;"> prodotti in esaurimento</span> 
      <span style="display: inline-block;width: 80px;vertical-align: top;margin-left: 23px;"> strategia di spedizione</span>       
       

				</div>
				
				   <div id="content-footer">
			<a style="float: left;"><img style="margin: 10px;"src="./res_img/creditCards.png"
				
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
    
    	
    
    
   
		
		</div>
		
	

    </td>
    
      </tr>      
    </table> 
	<%@ include file="/include/footerLayout.jsp"%>
		
	</div>
	
	


</body>