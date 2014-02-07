
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
								delay : 10000, // How long between slideshow transitions in AutoPlay mode (in milliseconds)
								animationTime : 1500, // How long the slideshow transition takes (in milliseconds)
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

			<table align="center" style="background: transparent; border-spacing: 0;">
				<tr>

					<td style="border-radius: 5px; background: transparent">


						<div id="content-body">

							<div id="page-wrap">
								<ul id="slider1">

									<!--     <li><img src="demos/images/logoWorld.jpg" alt=""></li>  -->


									<li>
										<div class="textSlide">
											<img
												src="./res_img/template.jpg"
												style="float: left; width: 200px; height: 200px; padding: 10px 0; margin: 0px 100px 0px 0; position: relative;">
											<h3>Template grafici personalizzati</h3>
											<br>
											<ul>
												Una serie di template grafici personalizzati verranno creati
												per permettervi di scegliere che veste grafica dare al sito,
												ci siamo presi un p&ograve; di tempo per agire su questa
												caratteristica perch&egrave; vogliamo offrire una reale
												differenza tra una veste grafica e l'altra e non solo un
												mero cambiamento di immagini e di colori come spesso succede
												nelle altre soluzioni in commercio.
												</br>
											</ul>
										</div>
										<div class="textSlide">
											<img src="./res_img/clientMobile.jpg"
												style="float: left; width: 200px; height: 200px; margin: 0px 100px 0px 0; padding: 25px 0 0; position: relative;">
											<h3>Client per cellulari</h3>
											<br>
											<ul>
												&Egrave; attualmente in sviluppo una versione ridotta del
												backoffice per cellulari android e iphone che permette di
												controllare le informazioni principali relative
												all'attivit&agrave; commerciale, inoltre tramite il
												meccanismo di notifica push, il gestore del negozio viene
												avvisato qualora ci siano prodotti in scadenza o ordini che
												aspettano di essere processati con una certa urgenza.
												</br>
											</ul>
										</div>
										
									</li>
									
									<li>										
										<div class="textSlide">
											<img src="./res_img/graph&stats.jpg"
												style="float: left; width: 200px; height: 200px; margin: 0px 100px 0px 0; position: relative;">
											<h3>Grafici e statistiche</h3>
											<br>
											<ul>Un set di grafici personalizzabili verr&agrave; reso
												disponibile per monitorare tutte le attivit&agrave;, i
												grafici saranno altamente personalizzabili scegliendo le
												variabili da monitorare, inoltre un sistema di notifiche
												aiuter&agrave; il gestore del magazzino a monitorare in
												maniera proattiva le urgenze come la scadenza di prodotti o
												gli ordini che attendono di essere processati.
											</ul>
										</div>
										<div class="textSlide">
											<img src="./res_img/newsletter.jpg"
												style="float: left; width: 200px; height: 200px; margin: 35px 100px 0px 0; padding: 15px 0; position: relative;">
											<h3>Campagne e newsletter</h3>
											<br>
											<ul>
												Verr&agrave; potenziata la funzionalit&agrave; di sconto gia
												esistente, con la possibilit&agrave; di creare delle vere e
												proprie campagne pubblicitarie che raggruppino una serie di
												prodotti e la possibilit&agrave; di creare una serie di
												sconti con scadenza o relativi a una fascia particolare di
												clientela, modulando gli sconti per quantit&agrave; di
												prodotti per tempistiche particolari (saldi natalizi o
												estivi). Inoltre verr&agrave; resa disponibile la
												funzionalit&agrave; di newsletter per cui sar&agrave;
												possibile inviare ai clienti delle newsletter a scadenza
												prefissata o in qualsivoglia momento decidendone la
												tipologia di contenuti.
												</br>
											</ul>
										</div>
									</li>
									
									<li>
										<div class="textSlide">
											<img src="./res_img/cdn.png"
												style="float: left; width: 200px; height: 200px; margin: 0px 100px 0px 0; position: relative;">
											<h3>Integrazione con CDN</h3>
											<br>
											<ul>
												A breve implementeremo l'integrazione con una infrattura di
												CDN (content delivery network) dove verranno immagazzinate
												tutte le immagini dei prodotti cosi da garantire una
												maggiore velocit&agrave; nella visualizzazione delle pagine
												in maniera trasparente alla locazione degli utenti del sito.
												</br>
											</ul>
										</div>										
									</li>

								</ul>
								<!-- END AnythingSlider #1 -->

							</div>

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

					</td>

				</tr>
			</table>
		</div> <%@ include file="/include/footerLayout.jsp"%>

		</div>
</body>