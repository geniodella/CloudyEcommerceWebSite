
<%@ include file="/include/head.jsp"%>
<%@ include file="/include/header.jsp"%>

<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

<!-- jQuery (required) -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script>
	window.jQuery
			|| document
					.write('<script src="../res_js/jquery.min.js"><\/script>')
</script>

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
								mode : "orizzontal", // Set mode to "horizontal", "vertical" or "fade" (only first letter needed); replaces vertical option
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

<%@ include file="/include/headerLayout.jsp"%>

	<div id="content-container">
		

		<div id="content">

			<table style="background: transparent; border-spacing: 0;">
				<tr>
					<td style="width: 50%; background: transparent"></td>

					<td style="border-radius: 5px; background: transparent">


						<div id="content-body">

							<div id="page-wrap">
								<ul id="slider1">

									<!--     <li><img src="demos/images/logoWorld.jpg" alt=""></li>  -->


									<li>
										<div class="textSlide">
											<img
												src="<s:property value="#imagePath"/>/Under-construction.png"
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
											<img src="<s:property value="#imagePath"/>/cart.png"
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
											<img src="<s:property value="#imagePath"/>/tag.jpg"
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
										<div style="padding: 20px 0" class="textSlide">
											<img
												src="<s:property value="#imagePath"/>/Under-construction.png"
												style="float: left; width: 200px; height: 200px; margin: 0px 100px 0px 0; position: relative;">
											<h3>Funzionalit&agrave; di acquisto</h3>
											<br>
											<ul>Permetter&agrave; ai tuoi clienti di acquistare
												anche senza essere preventivamente registrati.Questa infatti
												&egrave; una delle caratteristiche pi&ugrave; importanti di
												un ecommerce. Non bloccando il flusso di acquisto al
												checkout il cliente potr&agrave; decidere se acquistare
												senza registrarsi oppure registrarsi durante l'acquisto
												semplicemente scegliendo la propria password.
											</ul>
										</div>
									</li>
									
									<li>										
										<div class="textSlide">
											<img src="<s:property value="#imagePath"/>/customers.jpg"
												style="float: left; width: 200px; height: 200px; margin: 0px 100px 0px 0; position: relative;">
											<h3>Grafici e statistiche</h3>
											<br>
											<ul>un set di grafici personalizzabili verr&agrave; reso
												disponibile per monitorare tutte le attivit&agrave;, i
												grafici saranno altamente personalizzabili scegliendo le
												variabili da monitorare, inoltre un sistema di notifiche
												aiuter&agrave; il gestore del magazzino a monitorare in
												maniera proattiva le urgenze come la scadenza di prodotti o
												gli ordini che attendono di essere processati.
											</ul>
										</div>
										<div class="textSlide">
											<img src="<s:property value="#imagePath"/>/ajax.jpg"
												style="float: left; width: 200px; height: 200px; margin: 0px 100px 0px 0; padding: 15px 0; position: relative;">
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

								</ul>
								<!-- END AnythingSlider #1 -->

							</div>

							<div id="home-message-text" class="subcolumn1-1">
								<h1
									style="font-size: 30px; line-height: 30px; margin-top: 15px;">
									<s:text name="it.ecomweb.page.index.text4" />
								</h1>
							</div>

						</div>

						  <div id="content-footer">
			<a style="float: left;"><img style="margin: 10px;"src="<s:property value="#imagePath"/>/creditCards.png"
				
								<!-- AddThis Button BEGIN -->
				<div style="float: right;margin-right: 30px;margin-top: 15px;" class="addthis_toolbox addthis_default_style addthis_32x32_style">
				 <a class="addthis_button_facebook"></a>
	    					   <a class="addthis_button_twitter"></a>
	    					   <a class="addthis_button_pinterest_share"></a>
	    					   <a class="addthis_button_linkedin"></a>
	    					   <a class="addthis_button_google_plusone_share"></a>
				</div>
				<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-525d1d5f0490962c"></script>
				<!-- AddThis Button END -->
				
		</div> <%@ include file="/include/footerLayout.jsp"%>

					</td>

					<td style="width: 100%; background: transparent"></td>

				</tr>
			</table>

		</div>
</body>