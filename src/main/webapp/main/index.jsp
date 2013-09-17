
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

<head>
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
		useControls: true,
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
								buildArrows : false, // If true, builds the forwards and backwards buttons
								autoPlay : true, // If true, the slideshow will start running; replaces "startStopped" option
								buildNavigation : false, // If true, builds a list of anchor links to link to each panel
								buildStartStop : false, // If true, builds the start/stop button
								mode : "vertical", // Set mode to "horizontal", "vertical" or "fade" (only first letter needed); replaces vertical option
								enableKeyboard : false, // if false, keyboard arrow keys will not work for this slider.
								stopAtEnd : false, // If true & the slideshow is active, the slideshow will stop on the last page. This also stops the rewind effect when infiniteSlides is false.
								delay : 10000, // How long between slideshow transitions in AutoPlay mode (in milliseconds)
								animationTime : 1500, // How long the slideshow transition takes (in milliseconds)
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
	
	<script>
	$(function(){
	 $('#slider2')
	  .anythingSlider({
	   toggleControls : true,
	   theme          : 'metallic',
	   navigationFormatter : function(i, panel){ // add thumbnails as navigation links
	    return '<img src="<s:property value="#imagePath"/>' + ['/shotCart', '/shotMostSoldProducts', '/shotOrderResume', '/shotOrderResumeCheckout','shotProdottiInEsaurimento','shotSearch','shotStrategieDiTrasporto'][i - 1] + '.png">';
	   }
	  })
	  // target all images inside the current slider
	  // replace with 'img.someclass' to target specific images
	  .find('.panel:not(.cloned) img') // ignore the cloned panels
	   .attr('rel','group')            // add all slider images to a colorbox group
	   .colorbox({
	     width: '90%',
	     height: '90%',
	     href: function(){ return $(this).attr('src'); },
	     // use $(this).attr('title') for specific image captions
	     title: 'Press escape to close',
	     rel: 'group'
   });
});
	</script>	   

	<div id="content-container">
		<%@ include file="/include/headerLayout.jsp"%>


		<p>
			<br>
		</p>
		<div id="content">

			<div id="content-header">
				<h1>
					<s:text name="it.ecomweb.page.title.index" />
				</h1>
			</div>


			<div id="content-body">
  
  			<div id="page-wrap">
					<ul id="slider1">

						<!--     <li><img src="demos/images/logoWorld.jpg" alt=""></li>  -->


						<li>
							<div class="textSlide">
              				<img src="<s:property value="#imagePath"/>/Under-construction.png" style="float:left;width:100px; height:100px; margin: 0px 20px 0px 0;position:relative;">
								<h3>FUNZIONALIT&Agrave; COMPLETE DELLA NAVIGAZIONE PRODOTTI</h3>
								<br>
								<ul>
									Immagini multiple per prodotto.
									Possibilit&agrave; di zoommare sull'immagine del
										prodotto.</br>
									Prodotti correlati.</br>
									Disponibilit&agrave; di stock.</br>
									Prezzi multistrato per grandi vendite.</br>
									Selezione delle opzioni del prodotto.</br>
								</ul>
							</div>
							<div class="textSlide">
							<img src="<s:property value="#imagePath"/>/cart.png" style="float:left;width:100px; height:100px; margin: 15px 20px 35px 0;position:relative;">
								<h3>FUNZIONALIT&Agrave; COMPLETE DEL CARRELLO</h3>
								<br>
								<ul>
									Checkout in una pagina.
									Utilizzo degli SSL per la sicurezza degli ordini, sia
										sul frontend che sul backend.</br>
									Spedizioni ad indirizzi diversi in un solo ordine.</br>
									Checkout senza account, in modalit&agrave; Guest
										Checkout.</br>
									Carrello con stima di spese fiscali e di spese di
										spedizione.</br>
									Opzione per creare un account all'inizio del checkout.</br>
									Buoni Regalo accettati per ordini e per articoli.</br>
									Salvataggio dei carrelli con tempo di scadenza
										configurabile.</br>
								</ul>
							</div>
							<div class="textSlide">
							<img src="<s:property value="#imagePath"/>/tag.jpg" style="float:left;width:100px; height:100px; margin: 0px 20px 0px 0;position:relative;">
								<h3>FUNZIONALIT&Agrave; DI RICERCA PER TAG</h3>
								<br>
								<ul>
									Possibilit&agrave; di etichettare i prodotti con un
										numero illimitato di etichette cosi da potenziare la
										funzionalita di ricerca che non viene fatta solo per nome.
									Un algoritmo ricalcola periodicamente il punteggio dei
										tag per mettere in risalto nella barra di ricerca i risultati
										relativi a etichette con punteggio piu alto.
									Possibilit&agrave; di scremare la ricerca per
										categoria o per un numero illimitato di caratteritische
										relative a un prodotto.</br>
								</ul>
							</div>
						</li>


						<li>
							<div class="textSlide">
								<h3>FUNZIONALIT&Agrave; DI ACQUISTO</h3>
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
							<img src="<s:property value="#imagePath"/>/customers.jpg" style="float:left;width:100px; height:100px; margin: 0px 20px 0px 0;position:relative;">
								<h3>GESTIONE CLIENTI</h3>
								<br>
								<ul>
									Ogni cliente ha la possibilit&agrave; di rivedere gli
										ordini fatti e scendere fino al dettaglio della singola
										spedizione analizzandone lo stato in qualsiasi momento.
								</ul>
							</div>
							<div class="textSlide">
							<img src="<s:property value="#imagePath"/>/ajax.jpg" style="float:left;width:100px; height:100px; margin:30px 20px 0px 0;position:relative;">
								<h3>UTILIZZO DELLA TECNOLOGIA AJAX</h3>
								<br>
								<ul>
									CloudyEcommerce f&agrave; molto uso della nuovissima
										tecnologia Ajax, per velocizzare e migliorare alcune delle
										funzionalit&agrave; pi&ugrave; usate come l'aggiunta al
										carrello. Invece che aggiornare la pagina e farne attendere il
										caricamento, il prodotto viene aggiunto al carrello
										istantaneamente. Lo stesso procedimento avviene per
										l'ordinamento dei prodotti in base ad un particolare
										attributo.
									Inoltre la tecnologia ajax viene utilizzata anche
										nella gestione del magazzino, offrendo una esperienza desktop
										like, questo porta grandi vantaggi, soprattutto se ci si trova
										a dover inserire molti prodotti e con periodicit&agrave;
										stringenti perch&egrave; non si &egrave; costretti ad
										aspettare il caricamento di tutta la pagina per
										l&grave;utilizzo di ogni funzionalit&agrave;, un difetto che
										hanno attualmente quasi tutti gli applicativi di ecommerce in
										mercato.</br>
								</ul>
							</div>
						</li>


						<li>
							<div class="textSlide">
							<img src="<s:property value="#imagePath"/>/java.png" style="float:left;width:100px; height:100px; margin: 0px 20px 0px 0;position:relative;">
								<h3>JAVA ENTERPRISE</h3>
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
							<img src="<s:property value="#imagePath"/>/customizerIcon.png" style="float:left;width:100px; height:100px; margin: 0px 20px 0px 0;position:relative;">
								<h3>FLESSIBILIT&Agrave;</h3>
								<br>
								<ul>
									CloudyEcommerce &egrave; completamente sviluppato da
										noi, non &egrave; una personalizzazione di un altro prodotto,
										ci&ograve; implica che qualsiasi modifica di qualsiasi genere
										&egrave; possibile, basta mettersi in contatto con noi e
										implementeremo le modifiche desiderate dal cliente, questo
										oltre alle modifiche che di volta in volta vengono apportate,
										parliamo di una serie di funzionalit&agrave; aggiuntive che
										vengono installate nell&acute;ecommerce mano mano che vengono
										sviluppate.
								</ul>
							</div>
							<div class="textSlide">
							<img src="<s:property value="#imagePath"/>/24hours.jpg" style="float:left;width:100px; height:100px; margin: 0px 20px 0px 0;position:relative;">
								<h3>SUPPORTO 24h</h3>
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
						</li>



					</ul>
					<!-- END AnythingSlider #1 -->
				
			</div>
			
			
		   <a class="highslide" href="<s:property value="#imagePath"/>/shotCart.png" onclick="return hs.expand(this)">
		        <img src="<s:property value="#imagePath"/>/shotCart2.png" style="padding: 0 5px;border: none;margin-left: 70px;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotMostSold.PNG" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotMostSold2.PNG" style="padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotOrderResume.PNG" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotOrderResume2.PNG" style="padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotOrder.PNG" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotOrder2.PNG" style="padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotSearch.PNG" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotSearch2.PNG" style="padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotProdottiInEsaurimento.PNG" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotProdottiInEsaurimento2.PNG" style="padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
		      <a class="highslide" href="<s:property value="#imagePath"/>/shotDelivery.png" onclick="return hs.expand(this)">
		         <img src="<s:property value="#imagePath"/>/shotDelivery2.png" style="padding: 0 5px;border: none;cursor: pointer;width:100px;height:100px" alt=""/>
		      </a>
     
     
      <span style="display: inline-block;padding-left: 99px; width: 63px;"> carrello</span>
      <span style="margin-left: 35px;display: inline-block;height: 40px;width: 95px;vertical-align: top;"> prodotti più venduti</span>
      <span style="display: inline-block;width: 90px;vertical-align: top;margin-left: 20px;"> riassunto ordini</span> 
      <span style="display: inline-block;width: 74px;vertical-align: top;margin-left: 25px;">ordini nel checkout</span> 
      <span style="display: inline-block;width: 70px;vertical-align: top;margin-left: 45px;"> ricerca</span> 
      <span style="display: inline-block;width: 86px;vertical-align: top;margin-left: 28px;"> prodotti in esaurimento</span> 
      <span style="display: inline-block;width: 80px;vertical-align: top;margin-left: 23px;"> strategia di spedizione</span>       
       

<!--			<div class="customeSlider2">
			<ul id="slider2" >
			  <li><img src="<s:property value="#imagePath"/>/shotCart.PNG" style="float:left;width:150px; height:150px; margin: 0px 20px 0px 0;position:relative;"></li>
			  <li><img src="<s:property value="#imagePath"/>/shotMostSoldProducts.PNG" style="float:left;width:150px; height:150px; margin: 0px 20px 0px 0;position:relative;"></li>
			  <li><img src="<s:property value="#imagePath"/>/shotOrderResume.PNG" style="float:left;width:150px; height:150px; margin: 0px 20px 0px 0;position:relative;"></li>
			  <li><img src="<s:property value="#imagePath"/>/shotOrderResumeCheckout.PNG" style="float:left;width:150px; height:150px; margin: 0px 20px 0px 0;position:relative;"></li>
			  <li><img src="<s:property value="#imagePath"/>/shotProdottiInEsaurimento.PNG" style="float:left;width:150px; height:150px; margin: 0px 20px 0px 0;position:relative;"></li>
			  <li><img src="<s:property value="#imagePath"/>/shotSearch.PNG" style="float:left;width:150px; height:150px; margin: 0px 20px 0px 0;position:relative;"></li>
			  <li><img src="<s:property value="#imagePath"/>/shotStrategieDiTrasporto.PNG" style="float:left;width:150px; height:150px; margin: 0px 20px 0px 0;position:relative;"></li>
			</ul>
			</div>

<!-- 			<div class="subcolumn1-3" id="content-text"> -->
<!-- 				<div id="download-text"> -->
<!-- 					<p> -->
<%-- 						<s:text name="it.ecomweb.page.index.text1" /> <!-- testo i18n path "main->resources->languages_actions.properties" --> --%>
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 				<div id="download-link"> -->
<!-- 					<p> -->
<%-- 						<a href="<s:url action="main/download"/>">BOTTONE DOWNLOAD</a> --%>
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="subcolumn2-3" id="content-text"> -->
<!-- 				<div id="download-text"> -->
<!-- 					<p> -->
<%-- 						<s:text name="it.ecomweb.page.index.text2" /> --%>
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 				<div id="download-link"> -->
<!-- 					<p> -->
<%-- 						<a href="<s:url action="main/download"/>">BOTTONE DOWNLOAD</a> --%>
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="subcolumn3-3" id="content-text"> -->
<!-- 				<div id="download-text"> -->
<!-- 					<p> -->
<%-- 						<s:text name="it.ecomweb.page.index.text3" /> --%>
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 				<div id="download-link"> -->
<!-- 					<p> -->
<%-- 						<a href="<s:url action="main/buy"/>">BOTTONE ACQUISTA</a> --%>
<!-- 					</p> -->
<!-- 				</div> -->
<!-- 			</div> -->

			<div id="home-message-text" class="subcolumn1-1">
				<h1 style="font-size: 30px; line-height: 30px; margin-top: 15px;">
					<s:text name="it.ecomweb.page.index.text4" />
				</h1>
			</div>

		</div>

		<div id="content-footer">
			<a href="https://www.paypal.com/it/mrb/pal=9GUSU3SCTGKWU"
				target="_blank"><img
				src="<s:property value="#imagePath"/>/bnr_paypal_mrb_banner_468wx60h.gif"
				alt="%{getText('it.ecomweb.global.paypal.subscription')}" border="0"></a>
		</div>
	</div>
	</div>

	<%@ include file="/include/footerLayout.jsp"%>

</body>