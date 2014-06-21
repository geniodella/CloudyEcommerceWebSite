<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML+RDFa 1.0//EN" "http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<html  xmlns="http://www.w3.org/1999/xhtml"
      xmlns:og="http://ogp.me/ns#"
      xmlns:fb="https://www.facebook.com/2008/fbml"
>



<head>

<meta name="test" content="<%= request.getRequestURI() %>" />
<% if(request.getRequestURI().equals("/")){ %>
<title>soluzioni e-commerce | creazione ecommerce | software per e commerce</title>
<meta name="keywords" content="soluzioni e-commerce, creazione ecommerce, software per e commerce, soluzioni per e commerce" />
<meta name="description" content="Cloudy Ecommerce è un ecommerce SaaS versatile e completamente personalizzabile su richiesta,
basato su java e ajax molto veloce e per qualsiasi tipo di negozio. Venite a trovarci oggi stesso!" />
<% } %>

<% if(request.getRequestURI().equals("/index.jsp")){ %>
<title>soluzioni e-commerce | creazione ecommerce | software per e commerce</title>
<meta name="keywords" content="soluzioni e-commerce, creazione ecommerce, software per e commerce, soluzioni per e commerce" />
<meta name="description" content="Cloudy Ecommerce è un ecommerce SaaS versatile e completamente personalizzabile su richiesta,
basato su java e ajax molto veloce e per qualsiasi tipo di negozio.  Venite a trovarci oggi stesso!" />
<link rel="canonical" href="http://www.cloudyecommerce.com/" />

<% } %>


<% if(request.getRequestURI().equals("/company.jsp")){ %>
<title>supporto applicativo | sito di e-commerce | gestione di progetti</title>
<meta name="keywords" content="supporto applicativo, sito di e-commerce, gestione di progetti, gestione ecommerce" />
<meta name="description" content="La nostra azienda vi offre la migliore gestione del progetto e supporto per le applicazioni Java e Ajax per i siti di e-commerce veloce. Per maggiori dettagli visitare oggi!" />
<link rel="canonical" href="http://www.cloudyecommerce.com/company.jsp" />
<% } %>

<% if(request.getRequestURI().equals("/buy.jsp")){ %>
<title>software gestione aziendale | java e-commerce</title>
<meta name="keywords" content="software ecommerce, software gestione aziendale, java e-commerce" />
<meta name="description" content="Scegliere la migliore gestione aziendale e Java soluzioni e-commerce, software per le vostre esigenze e volumi di attività. Per acquistarlo visitare oggi!" />
<link rel="canonical" href="http://www.cloudyecommerce.com/buy.jsp" />
<% } %>


<% if(request.getRequestURI().equals("/docs.jsp")){ %>
<title>grafici in statistica | soluzioni ecommerce | piattaforma e commerce</title>
<meta name="keywords" content="grafici in statistica, soluzioni ecommerce, piattaforma e commerce" />
<meta name="description" content="Vi offriamo le migliori soluzioni e-commerce e la piattaforma con i modelli grafici delle statistiche di personalizzazione. Per maggiori dettagli visitare oggi!" />
<link rel="canonical" href="http://www.cloudyecommerce.com/docs.jsp" />
<% } %>


<% if(request.getRequestURI().equals("/support.jsp")){ %>
<title>ssl certificato | supporto tecnico</title>
<meta name="keywords" content="ssl certificate, supporto tecnico, certificato ssl" />
<meta name="description" content="Forniamo supporto tecnico e certificato SSL che garantisce un rapido e professionale per tutti i nostri clienti. Venite a trovarci oggi stesso!" />
<link rel="canonical" href="http://www.cloudyecommerce.com/support.jsp" />
<% } %>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Cloudy Ecommerce</title>
 <meta name="Description" content="Cloudy Ecommerce è un ecommerce SaaS versatile e completamente personalizzabile su richiesta,
basato su java e ajax molto veloce e per qualsiasi tipo di negozio.">
<meta name="Keywords" content="ecommerce,saas,vendere,negozio,personalizzabile">

	<script type="text/javascript" src="./res_js/jquery/jquery-1.8.0.js"></script>
	
<!-- 	<script type="text/javascript" src="./res_js/jquery/jquery-1.3.1.min.js"></script> -->
	<script type="text/javascript" src="./res_js/jquery/jquery.i18n.properties-min-1.0.9.js"></script>
	<script type="text/javascript" src="./res_js/jquery/jquery.ui.all.js"></script>
	<script type="text/javascript" src="./res_js/jquery/jquery.tooltip.js"></script>
	<script type="text/javascript" src="./res_js/jquery/jquery.autocomplete.js"></script>
	<script type="text/javascript" src="./res_js/jquery/jquery.ajaxform.js"></script>
	<script type="text/javascript" src="./res_js/ecommerce/global/windowOnload.js"></script>
	
	<script type="text/javascript" src="./res_js/ecommerce/jquery/admin.jquery.js"></script>

<!-- <script type="text/javascript" src="./res_js/jquery/customForm.js"></script> -->
<script type="text/javascript" src="./res_js/jquery/jquery.simplemodal.js"></script>


<!-- <script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script> -->
<!-- <script>window.jQuery|| document.write('<script src="../res_js/jquery.min.js"><\/script>')</script> -->

<!-- Anything Slider optional plugins -->
<script src="./res_js/jquery/jquery.easing.1.2.js"></script>

<!-- http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js -->
<script src="./res_js/jquery/swfobject.js"></script>

<!-- Demo stuff -->
<link rel="stylesheet" href="./res_css/page.css" media="screen">
<script src="./res_js/jquery/jquery.jatt.min.js"></script>


	
<link href='http://fonts.googleapis.com/css?family=Della+Respira' rel='stylesheet' type='text/css'>


<!-- AnythingSlider -->
<link rel="stylesheet" href="./res_css/anythingslider.css">
<script src="./res_js/jquery/jquery.anythingslider.js"></script>

<script type="text/javascript" src="./res_js/jquery/jquery.simplemodal.js"></script>

 <!-- ColorBox -->
 <link href="./res_css/colorbox/colorbox.css" rel="stylesheet">
 <script src="./res_js/jquery/jquery.colorbox-min.js"></script>
 
 
                                                                          
<!-- highslide --> 
<script type="text/javascript" src="./res_js/highslide/highslide-with-gallery.js"></script>
<link rel="stylesheet" type="text/css" href="./res_js/highslide/highslide.css" />

<meta property="og:title" content="Il primo ecommerce SaaS completamente personalizzabile" />
<meta property="og:description" content="Cloudy Ecommerce è un ecommerce SaaS versatile e completamente personalizzabile su richiesta,
basato su java e ajax molto veloce e per qualsiasi tipo di negozio."/>
<meta property="og:url" content="http://www.cloudyecommerce.com"/>
<meta property="og:image" content="./res_img/logoSito.jpg" />

<link rel="stylesheet" type="text/css" href="./res_css/EComWeb_default.css" title="default" media="screen" />

	<link rel="stylesheet" href="./res_css/theme-metallic.css">
	<link rel="stylesheet" href="./res_css/theme-minimalist-round.css">
	<link rel="stylesheet" href="./res_css/theme-minimalist-square.css">
	<link rel="stylesheet" href="./res_css/theme-construction.css">
	<link rel="stylesheet" href="./res_css/theme-cs-portfolio.css">
	<link rel="shortcut icon" type="image/x-icon" href="./res_img/favicon.ico">
	<link rel="shortcut icon" type="image/png" href="./res_img/favicon.png"/>


<!-- Twitter card -->
  	<meta property="twitter:card" content="summary">
  	<meta property="twitter:title" content="Il primo ecommerce SaaS completamente personalizzabile">
  	<meta property="twitter:description" content="Cloudy Ecommerce è un ecommerce SaaS versatile e completamente personalizzabile su richiesta,
basato su java e ajax molto veloce e per qualsiasi tipo di negozio.">
  	<meta property="twitter:image" content="./res_img/logoSito.jpg">
  	<meta property="twitter:url" content="http://www.cloudyecommerce.com">
  	<meta property="twitter:site" content="@Geniodella">
  	
  	
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-45388829-1', 'cloudyecommerce.com');
ga('require', 'displayfeatures');
  ga('send', 'pageview');
  </script>  	

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

</head>