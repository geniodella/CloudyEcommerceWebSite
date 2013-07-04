
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
								animationTime : 1000, // How long the slideshow transition takes (in milliseconds)
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
								<h3>FUNZIONALIT&Agrave; COMPLETE DELLA NAVIGAZIONE PRODOTTI</h3>
								<br>
								<ul>
									<li>Immagini multiple per prodotto.</li>
									<li>Possibilit&agrave; di zoommare sull'immagine del
										prodotto.</li>
									<li>Prodotti correlati.</li>
									<li>Disponibilit&agrave; di stock.</li>
									<li>Prezzi multistrato per grandi vendite.</li>
									<li>Selezione delle opzioni del prodotto.</li>
								</ul>
							</div>
							<div class="textSlide">
								<h3>FUNZIONALIT&Agrave; COMPLETE DEL CARRELLO</h3>
								<br>
								<ul>
									<li>Checkout in una pagina.</li>
									<li>Utilizzo degli SSL per la sicurezza degli ordini, sia
										sul frontend che sul backend.</li>
									<li>Spedizioni ad indirizzi diversi in un solo ordine.</li>
									<li>Checkout senza account, in modalit&agrave; Guest
										Checkout.</li>
									<li>Carrello con stima di spese fiscali e di spese di
										spedizione.</li>
									<li>Opzione per creare un account all'inizio del checkout.</li>
									<li>Buoni Regalo accettati per ordini e per articoli.</li>
									<li>Salvataggio dei carrelli con tempo di scadenza
										configurabile.</li>
								</ul>
							</div>
							<div class="textSlide">
								<h3>FUNZIONALIT&Agrave; DI RICERCA PER TAG</h3>
								<br>
								<ul>
									<li>Possibilit&agrave; di etichettare i prodotti con un
										numero illimitato di etichette cosi da potenziare la
										funzionalita di ricerca che non viene fatta solo per nome.</li>
									<li>Un algoritmo ricalcola periodicamente il punteggio dei
										tag per mettere in risalto nella barra di ricerca i risultati
										relativi a etichette con punteggio piu alto.</li>
									<li>Possibilit&agrave; di scremare la ricerca per
										categoria o per un numero illimitato di caratteritische
										relative a un prodotto.</li>
								</ul>
							</div>
						</li>


						<li>
							<div class="textSlide">
								<h3>FUNZIONALIT&Agrave; DI ACQUISTO</h3>
								<br>
								<ul>
									<li>Permetter&agrave; ai tuoi clienti di acquistare anche
										senza essere preventivamente registrati.Questa infatti
										&egrave; una delle caratteristiche pi&ugrave; importanti di un
										ecommerce. Non bloccando il flusso di acquisto al checkout il
										cliente potr&agrave; decidere se acquistare senza registrarsi
										oppure registrarsi durante l'acquisto semplicemente scegliendo
										la propria password.</li>
								</ul>
							</div>
							<div class="textSlide">
								<h3>GESTIONE CLIENTI</h3>
								<br>
								<ul>
									<li>Ogni cliente ha la possibilit&agrave; di rivedere gli
										ordini fatti e scendere fino al dettaglio della singola
										spedizione analizzandone lo stato in qualsiasi momento.</li>
								</ul>
							</div>
							<div class="textSlide">
								<h3>UTILIZZO DELLA TECNOLOGIA AJAX</h3>
								<br>
								<ul>
									<li>CloudyEcommerce f&agrave; molto uso della nuovissima
										tecnologia Ajax, per velocizzare e migliorare alcune delle
										funzionalit&agrave; pi&ugrave; usate come l'aggiunta al
										carrello. Invece che aggiornare la pagina e farne attendere il
										caricamento, il prodotto viene aggiunto al carrello
										istantaneamente. Lo stesso procedimento avviene per
										l'ordinamento dei prodotti in base ad un particolare
										attributo.</li>
									<li>Inoltre la tecnologia ajax viene utilizzata anche
										nella gestione del magazzino, offrendo una esperienza desktop
										like, questo porta grandi vantaggi, soprattutto se ci si trova
										a dover inserire molti prodotti e con periodicit&agrave;
										stringenti perch&egrave; non si &egrave; costretti ad
										aspettare il caricamento di tutta la pagina per
										l&grave;utilizzo di ogni funzionalit&agrave;, un difetto che
										hanno attualmente quasi tutti gli applicativi di ecommerce in
										mercato.</li>
								</ul>
							</div>
						</li>


						<li>
							<div class="textSlide">
								<h3>JAVA ENTERPRISE</h3>
								<br>
								<ul>
									<li>Il cuore dell&acute;applicativo &egrave; sviluppato
										con tecnologia Java enterprise questo garantisce che il sito
										di ecommerce sia scalabile a tutti i livelli e fino a volumi
										di utenza molto alti, in contrapposizione ad architetture php
										che incontrano dei colli di bottiglia consistenti riguardo
										alla scalabilit&agrave;, l&acute;utilizzo di tecnologia java
										fa si che CloudyEcommerce si integri perfettamente con
										l&acute;infrastruttura SAAS.</li>
								</ul>
							</div>
							<div class="textSlide">
								<h3>FLESSIBILIT&Agrave;</h3>
								<br>
								<ul>
									<li>CloudyEcommerce &egrave; completamente sviluppato da
										noi, non &egrave; una personalizzazione di un altro prodotto,
										ci&ograve; implica che qualsiasi modifica di qualsiasi genere
										&egrave; possibile, basta mettersi in contatto con noi e
										implementeremo le modifiche desiderate dal cliente, questo
										oltre alle modifiche che di volta in volta vengono apportate,
										parliamo di una serie di funzionalit&agrave; aggiuntive che
										vengono installate nell&acute;ecommerce mano mano che vengono
										sviluppate.</li>
								</ul>
							</div>
							<div class="textSlide">
								<h3>SUPPORTO 24h</h3>
								<br>
								<ul>
									<li>Tutte le installazioni dell&acute;ecommerce vengono
										monitorate 24h da software di Application performance

										management, cosi da individuare eventuali problemi o cali
										delle prestazioni prima che vengano individuate dai clienti,
										questa forma di prevenzione limita i danni enormemente,
										inoltre per qualsiasi domanda o richiesta di aiuto &egrave;
										attivo un servizio tutti i giorni per aiutare i clienti.</li>
								</ul>
							</div>
						</li>



					</ul>
					<!-- END AnythingSlider #1 -->
				
			</div>

			<div class="subcolumn1-3" id="content-text">
				<div id="download-text">
					<p>
						<s:text name="it.ecomweb.page.index.text1" />
					</p>
				</div>
				<div id="download-link">
					<p>
						<a href="<s:url action="main/download"/>">BOTTONE DOWNLOAD</a>
					</p>
				</div>
			</div>

			<div class="subcolumn2-3" id="content-text">
				<div id="download-text">
					<p>
						<s:text name="it.ecomweb.page.index.text2" />
					</p>
				</div>
				<div id="download-link">
					<p>
						<a href="<s:url action="main/download"/>">BOTTONE DOWNLOAD</a>
					</p>
				</div>
			</div>

			<div class="subcolumn3-3" id="content-text">
				<div id="download-text">
					<p>
						<s:text name="it.ecomweb.page.index.text3" />
					</p>
				</div>
				<div id="download-link">
					<p>
						<a href="<s:url action="main/buy"/>">BOTTONE ACQUISTA</a>
					</p>
				</div>
			</div>

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