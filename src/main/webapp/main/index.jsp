
<%
	/**
	 * Title: E-Commerce CMS 
	 * Description: E-Commerce CMS 
	 * Copyright: Copyright (c) 2008
	 * Company: 
	 * 
	 * @author Enrico Cesaretti
	 * @version 1.0
	 */
%>
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/header.jsp"%>

<html  
      xmlns:og="http://ogp.me/ns#"
      xmlns:fb="https://www.facebook.com/2008/fbml"
>

<head>
<meta property="og:title" content="TITOLO" />
<meta property="og:description" content="PIPELLA DESCRIPTION" />
<meta property="og:url" content="http://127.0.0.1:8080/CloudyEcommerceWebSite/main/index.action#&panel1-3"/>
<meta property="og:img" content="" />

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

<!-- jQuery (required) -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script>window.jQuery|| document.write('<script src="../res_js/jquery.min.js"><\/script>')</script>

<!-- Anything Slider optional plugins -->
<script src="../res_js/jquery/jquery.easing.1.2.js"></script>

<!-- http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js -->
<script src="../res_js/jquery/swfobject.js"></script>

<!-- Demo stuff -->
<link rel="stylesheet" href="../res_css/page.css" media="screen">
<script src="../res_js/jquery/jquery.jatt.min.js"></script>

<!-- AnythingSlider -->
<link rel="stylesheet" href="../res_css/anythingslider.css">
<script src="../res_js/jquery/jquery.anythingslider.js"></script>

 <!-- ColorBox -->
 <link href="../res_css/colorbox/colorbox.css" rel="stylesheet">
 <script src="../res_js/jquery/jquery.colorbox-min.js"></script>

                                                                          
<!-- highslide --> 
<script type="text/javascript" src="../res_js/highslide/highslide-with-gallery.js"></script>
<link rel="stylesheet" type="text/css" href="../res_js/highslide/highslide.css" />


<script type="text/javascript">


    // override Highslide settings here
    // instead of editing the highslide.js file
    hs.graphicsDir = '../res_js/highslide/graphics/';
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
         

<!-- Ideally, add the stylesheet(s) you are going to use here,
	 otherwise they are loaded and appended to the <head> automatically and will over-ride the IE stylesheet below -->
	<link rel="stylesheet" href="../res_css/theme-metallic.css">
	<link rel="stylesheet" href="../res_css/theme-minimalist-round.css">
	<link rel="stylesheet" href="../res_css/theme-minimalist-square.css">
	<link rel="stylesheet" href="../res_css/theme-construction.css">
	<link rel="stylesheet" href="../res_css/theme-cs-portfolio.css">
	
</head>

<body>

	<script>
		$(function() {

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

    <table style="background: transparent;border-spacing: 0;">
      <tr>
     <td style="width:50%;background:transparent"></td>

     <td style="border-radius: 5px;background:transparent">
     
			<div id="content-body">
			
			<div style="background: white;margin: 0px 60px;" id="home-message-text" class="subcolumn1-1">
					<h1 style="font-size: 30px; line-height: 30px; margin-top: 15px;">
						<s:text name="it.ecomweb.page.index.text4" />
					</h1>
				</div>
			
  
  			<div id="page-wrap">
					<ul id="slider1">

						<li>
							<div class="textSlide" style="height: 190px;padding:10px 0">
              				<img src="<s:property value="#imagePath"/>/productsNavigation.jpg" style="float:left;width:200px; height:230px;padding: 0px 0; margin: 0px 100px 0px 0;position:relative;">
								<h3 style="margin-top: 30px;">Funzionalit&agrave; complete della navigazione prodotti</h3>
								<br>
								<ul>
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
							<img src="<s:property value="#imagePath"/>/cart.png" style="float:left;width:200px; height:200px; margin: 30px 100px 0px 0;padding: 25px 0 10px;position:relative;">
								<h3 style="margin-top: 30px;">Funzionalit&agrave; complete del carrello</h3>
								<br>
								<ul style="padding: 0 130px;">
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
							<img src="<s:property value="#imagePath"/>/funzionalitaAcquisto.jpg" style="float:left;width:250px; height:200px;margin: 0px 50px 0px 0;position:relative;">
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
							<img src="<s:property value="#imagePath"/>/tag.jpg" style="float:left;width:200px; height:200px; margin: 30px 100px 0px 0;position:relative;">
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
							<img src="<s:property value="#imagePath"/>/customers.jpg" style="float:left;width:200px; height:200px; margin: 0px 100px 0px 0;position:relative;">
								<h3>Gestione clienti</h3>
								<br>
								<ul>
									Ogni cliente ha la possibilit&agrave; di rivedere gli
										ordini fatti e scendere fino al dettaglio della singola
										spedizione analizzandone lo stato in qualsiasi momento.
								</ul>
							</div>
							<div class="textSlide">
							<img src="<s:property value="#imagePath"/>/ajax.jpg" style="float:left;width:200px; height:250px; margin:-40px 100px 20px 0;padding: 35px 0;position:relative;">
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
							<img src="<s:property value="#imagePath"/>/java.png" style="float:left;width:200px; height:200px; margin: 10px 100px 0px 0;position:relative;">
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
							<img src="<s:property value="#imagePath"/>/customizerIcon.png" style="padding: 10px 0;float:left;width:200px; height:200px; margin: 20px 100px 0px 0;position:relative;">
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
							<img src="<s:property value="#imagePath"/>/24hours.jpg" style="float:left;width:200px; height:200px; margin: 20px 100px 0px 0;position:relative;">
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
							<img src="<s:property value="#imagePath"/>/iaas.jpg" style="float:left;width:200px; height:200px; margin: 20px 100px 0px 0;position:relative;">
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
					 <a class="highslide" style="margin-left: 30px;" href="<s:property value="#imagePath"/>/shotCart.png" onclick="return hs.expand(this)">
		        <img src="<s:property value="#imagePath"/>/shotCart2.png" style="visibility: visible;padding: 0 5px;border: none;margin-left: 70px;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotMostSold.PNG" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotMostSold2.PNG" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotOrderResume.PNG" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotOrderResume2.PNG" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotOrder.PNG" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotOrder2.PNG" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotSearch.PNG" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotSearch2.PNG" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotProdottiInEsaurimento.PNG" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotProdottiInEsaurimento2.PNG" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotDelivery.png" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotDelivery2.png" style="visibility: visible;padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
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
			<a style="float: left;"><img style="margin: 10px;"src="<s:property value="#imagePath"/>/creditCards.png"
				
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
				<!-- AddThis Button END -->
				
		</div>

		</div>
    
    	
    
    
   
		
		</div>
		
	
	<%@ include file="/include/footerLayout.jsp"%>

    </td>
    
    <td style="width:100%;background:transparent"></td>

      </tr>      
    </table> 
		
	</div>
	
	


</body>