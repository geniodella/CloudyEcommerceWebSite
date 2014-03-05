
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
													'<span style="float: right;" src="res_img/captchaLogo.png"> Qual\'&egrave; il codice dell\'immagine?</span>'+
													'<INPUT TYPE="text" NAME="captchaValue" VALUE="" placeholder="Captcha" class="customCaptcha" style="width: 175px;float: right;margin-top: -40px;padding: 10px 5px;">'+
												
												'</p>'+
												'<p class="signin button">'+
													'<input id="submitForm" style="margin-top: 20px;" type="submit" value="Registrati" />'+
												'</p>'+
												'<p class="change_link" style="margin-top: 30px;">Sei gi&agrave; registrato ?<a href="#tologin" id="registerButton" class="to_register"> Vai alla login </a>'+
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
											$('#register').html('Grazie!').append(' Ti arriver&agrave; un\'email coi dati di accesso.').css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif").css("line-height","5");
						                	next();
						          	    });
				                      }
	              	      			  else if(data.success==false){
	                                    if(data.msg==1){
	        			                    	  $('#error-container').html('Il captcha che hai inserito &egrave; errato!').css("background","#4AB3C6").css("line-height","2").css("margin","10px 0").css("color","white").css("border","2px solid #ccc").css("height", "30px").css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif");
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
						
							<div style="margin-top: 20px;width:960px;height: 3730px;" class="subcolumn1-1" id="content-text">
                 <h1 style="color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 30px; line-height: 25px; padding: 0 50px;text-align:center;margin-bottom:60px;">
				              Termini e condizioni del servizio CloudyEcommerce
				              </h1> 
            <div style="width: 970px;height: 270px;">  
              <h1 style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              1.Premessa 
				              </h1> 
               <p style="float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							 
            1.1 Le presenti condizioni generali ("Condizioni Generali") si applicano alla fornitura di servizi per la creazione e gestione di un negozio e-commerce basato su una piattaforma CloudyEcommerce, come meglio indicati nel paragrafo 2 ("Servizi") offerti da Formez & Consulting S.r.l.  attraverso il sito web www.cloudyecommerce.com ("Sito")
</br>1.2 L'utilizzo dei Servizi &egrave; riservato esclusivamente a professionisti, intesi come persone fisiche o giuridiche che agiscono nell'esercizio della propria attivit&agrave; professionale ("Clienti" o "Cliente")
</br>1.3 L'utilizzo dei Servizi implica la piena conoscenza delle Condizioni Generali. CloudyEcommerce potr&agrave; modificare le Condizioni Generali in qualunque momento senza preavviso. I Clienti sono invitati a leggere attentamente le Condizioni Generali, messe a disposizione sul Sito, prima dell'utilizzo dei Servizi
      				</p>
									
									</div>

             				   <h1 style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              2.Servizi
				              </h1>                
				                 <p style="color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
				      2.1 I Servizi includono, in particolare:
                     
                      <ul style="margin-left: 30px;">
							<li style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                  hosting della piattaforma CloudyEcommerce;
								  </li>
						
            	<li style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
             registrazione di nomi a dominio per conto del Cliente;
              </li>
              
							<li style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                   supporto tecnico; 
                   </li>
             
							<li style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                   personalizzazione grafica;
                   </li>
             
							<li style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                   creazioni di moduli personalizzati;
                   </li>
            
							<li style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                    marketing;
                   </li>
                  		<li style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                   moduli e template aggiuntivi.
                   </li> 
                   		
                   
              </ul>
                      
						</p>
                    

					   <h1 style="margin-top: 30px;width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              3.Modalit&agrave; d'acquisto
				              </h1>
				                <p style="float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;margin-bottom: 20px;padding: 0 0px 0 50px;">
							3.1 Per poter utilizzare la piattaforma CloudyEcommerce, il Cliente deve selezionare un profilo mensile o annuale tra quelli disponibili sul Sito, successivamente ricever&agrave; una email dove risponder&agrave; a un' email dove indicher&agrave; il nome a dominio su cui installare la piattaforma CloudyEcommerce. Il Cliente pu&ograve; decidere di installare la piattaforma CloudyEcommerce su un nome a dominio gi&agrave; in suo possesso.

								 </p>
                 
               <h1 style="width: 350px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              4. Prezzo e modalit&agrave; di pagamento
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
						4.1 I prezzi dei Servizi sono espressi nel Sito in Euro e includono le tasse, ove applicabili. Il pagamento dei Servizi potr&agrave; essere effettuato con carta di credito, secondo le opzioni indicate sul Sito, oppure con PayPal.
</br>4.2 CloudyEcommerce si impegna a fornire la piattaforma entro e non oltre settantadue ore dall'accettazione dell'ordine da parte di CloudyEcommerce.
								 </p>
                 
                    <h1 style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              5. Nomi a dominio
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							5.1 CloudyEcommerce registra nomi dominio a nome e per conto del Cliente. I nomi a dominio registrati da CloudyEcommerce resteranno di propriet&agrave; del Cliente anche a seguito della disattivazione di un account Cliente.
</br>5.2 Con l'invio dell'ordine, il Cliente conferisce mandato a CloudyEcommerce a compiere tutte le attivit&agrave; necessarie ai fini della registrazione del nome a dominio indicato dal Cliente, inclusa la presa visione delle condizioni di servizio e dell'informativa privacy messe di volta in volta a disposizione sui siti web dei Registrant utilizzati per la registrazione.
								 </p>
                 
                    <h1 style="width: 650px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              6. Rinnovo automatico dell'account Cliente o dei nomi a dominio
				              </h1>
				         <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
						6.1 Il Cliente riconosce che il rinnovo dell'account Cliente o dei nomi a dominio &egrave; responsabilit&agrave; unica ed esclusiva del Cliente. CloudyEcommerce non assume alcun obbligo in tal senso. Il Cliente esonera CloudyEcommerce da ogni responsabilit&agrave; derivante dal mancato rinnovo per qualsivoglia motivo dell'account Cliente o del nome a dominio. Il Cliente riconosce che vi possono essere molte ragione per cui CloudyEcommerce sia impossibilitato a rinnovare l'account Cliente o il nome a dominio, incluso ma non limitato all'incapacit&agrave; di CloudyEcommerce s.r.l., per qualunque motivo, di addebitare i costi di rinnovo sulla carta di credito o account paypal. Il Cliente riconosce che il suddetto account Cliente e/o nome a dominio, se non rinnovato per tempo, verr&agrave; automaticamente terminato dal Registrant su cui il servizio &egrave; attivo.
								 </p>
                 
                   <h1 style="width: 800px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              7. Cancellazione del rinnovo automatico dell'account Cliente o dei nomi a dominio
				              </h1>
				            <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							7.1 Per cancellare il rinnovo automatico dell'account Cliente o il rinnovo automatico del nome a dominio, il Cliente deve inviare una comunicazione scritta a CloudyEcommerce almeno 16 (sedici) giorni prima della data di scadenza dell'account Cliente o del nome a dominio, chiedendo la cancellazione del rinnovo automatico dell'account Cliente o la cancellazione del rinnovo automatico del nome a dominio, inviando una email a admin@CloudyEcommerce.com . CloudyEcommerce accetta che al momento della ricezione della richiesta di cancellazione del rinnovo automatico dell'account Cliente o di cancellazione del rinnovo automatico del nome a dominio non saranno addebitati costi aggiuntivi al Cliente, e che l'account hosting e/o il nome a dominio verranno disattivati il giorno di richiesta di cancellazione. Eventuali dati presenti nell'account Cliente verranno completamente eliminati. 
								 </p>
                 
                   <h1 style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              8. Backup e Accesso ai Dati
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							8.1 Allo scopo di mantenere un'alta efficienza operativa, CloudyEcommerce esegue regolarmente il backup dei dati sui propri server, ma non ha alcun obbligo o dovere nei confronti del Cliente di eseguire backup secondo tali modalit&agrave;. E' responsabilit&agrave; esclusiva del Cliente eseguire i backup dei dati e dei files ospitati sui server di CloudyEcommerce.
</br>8.2 L'accesso ai dati della propria piattaforma ecommerce, fornita dal servizio CloudyEcommerce, &egrave; garantito solo attraverso il pannello di controllo di backend (raggiungibile tramite www.nomesito.xx/admin) della piattaforma stessa. E' espressamente vietato l'utilizzo di qualsivoglia tool esterno per l'accesso ai propri dati, siano essi files che dati contenuti nel database. CloudyEcommerce si riserva il diritto di procedere all'immediata sospensione della piattaforma in presenza di ogni tentativo di accesso non autorizzato veicolato attraverso mezzi che non siano il pannello di controllo della piattaforma. 
								 </p>
                 
                    <h1 style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				             9. Diritti di propriet&agrave; intellettuale
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
						9.1  L'uso dei Servizi non implica in alcun modo la concessione al Cliente di una licenza d'uso dei moduli, codici e grafiche di propriet&agrave; di CloudyEcommerce. CloudyEcommerce si riserva il diritto di autorizzare la riproduzione, permanente o temporanea, totale o parziale, dei propri moduli, codici e grafiche, con qualsiasi mezzo o in qualsiasi forma; la traduzione, l'adattamento, la trasformazione e ogni altra modificazione, qualsiasi forma di distribuzione al pubblico. Il Cliente non pu&ograve;, direttamente o indirettamente, modificare, decompilare o disassemblare il codice sorgente dei moduli di propriet&agrave; di CloudyEcommerce.
</br>9.2 L'utilizzo dei Servizi non implica conferimento al Cliente di alcun diritto o interesse nei confronti dei marchi, dei prodotti, di qualsivoglia progetto, diritto di propriet&agrave; intellettuale o industriale, denominazione commerciale, insegna o slogan o di altro segno distintivo di CloudyEcommerce. In particolare, il Cliente non potr&agrave;, in mancanza di espressa autorizzazione di Formez&Consulting, utilizzare denominazione, marchi o altri segni distintivi di CloudyEcommerce per brochure, pubblicit&agrave; o altre forme di comunicazione aventi carattere promozionale, n&egrave; potr&agrave; fare riferimento al rapporto professionale con CloudyEcommerce al fine di promuovere se stesso, i propri servizi o societ&agrave; ad esso in qualunque modo collegate, anche dopo la disattivazione di un account Cliente o successivamente al recesso.
								 </p>
                 
                  <h1 style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              10. Responsabilit&agrave;
				              </h1>
				               <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							10.1 Il Cliente si impegna ad utilizzare i Servizi nel rispetto della normativa vigente ed &egrave; pienamente responsabile dei contenuti dei propri siti web. Il Cliente si impegna a farsi carico di tutti i rischi connessi all'utilizzo o mancato utilizzo dei Servizi, nonch&egrave; al contenuto dei propri siti web, e ad assumersi la piena responsabilit&agrave; dell'eventuale pregiudizio causato a terzi dall'utilizzo dei Servizi, o dal contenuto dei propri siti web, anche dopo la disattivazione di un account Cliente o successivamente al recesso del Cliente. Il Cliente si impegna pertanto a non ritenere CloudyEcommerce responsabile in alcun modo di eventuali danni derivanti o causati dall'utilizzo dei Servizi o dal contenuto dei propri siti web, nei limiti consentiti dalla legge.
</br>10.2 In nessun caso e in nessuna circostanza CloudyEcommerce potr&agrave; essere ritenuta responsabile per perdite di dati o di files dei Clienti ospitati sui propri server.
</br>10.3 CloudyEcommerce non potr&agrave; essere ritenuta responsabile per l'uso dei domini prescelti dal Cliente ai fini dell'installazione di una piattaforma CloudyEcommerce. Il Cliente si impegna a tenere indenne CloudyEcommerce da qualunque pretesa di terzi in relazione a tali domini, anche dopo la disattivazione di un account Cliente o successivamente al recesso del Cliente.
</br>10.4 L'utilizzo di un account Cliente come uno spazio di storage online per l'archiviazione di file elettronici &egrave; vietato e comporta la disattivazione dell'account Cliente senza alcun preavviso. Formez & Consulting non ha l'obbligo di monitorare i contenuti immessi dal Cliente sulla piattaforma CloudyEcommerce. Tuttavia, Formez & Consulting potr&agrave; rimuovere tali contenuti o vietare qualsiasi utilizzo dei Servizi che ritiene sia (o possa essere) in violazione delle Condizioni Generali o di diritti di propriet&agrave; intellettuale di terze parti.
</br>10.5 Formez & Consulting non ha alcun obbligo di intervento per la risoluzione di problemi segnalati dal cliente. La piattaforma viene fornita cos&igrave; com' &egrave;. I termini dell'assistenza tecnica sono approfonditi nella pagina Assistenza Tecnica 
								 </p>
                 
                    <h1 style="width: 500px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              11. Disattivazione dell'account Cliente e recesso
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							11.1 Formez & Consulting potr&agrave; procedere, a sua insindacabile discrezione, alla disattivazione di un account Cliente qualora ritenga che il medesimo violi diritti di terzi o sia in altro modo contrario alla legge, o qualora richiesto dalle autorit&agrave; competenti.
</br>11.2 Formez & Consulting potr&agrave; disattivare l'account Cliente anche nel caso in cui il Cliente non provveda al saldo delle ultime due o pi&ugrave; fatture.
</br>11.3 Il Cliente potr&agrave; recedere dal contratto in qualunque momento secondo le seguenti modalit&agrave;:
</br>invio di una email a admin@CloudyEcommerce.com
</br>11.4 In caso di recesso, il Cliente non ha diritto alla restituzione del prezzo corrisposto ad CloudyEcommerce n&egrave; ad alcun rimborso.
</br>11.5 In caso di disattivazione di un account cliente o di recesso, CloudyEcommerce potr&agrave; cancellare tutti i dati archiviati dei Clienti entro 30 giorni dalla data di disattivazione o recesso. In caso di disattivazione dell'account cliente per le ragioni indicate nel paragrafo 11.2 che precede, CloudyEcommerce provveder&agrave; alla cancellazione immediata di tutti i dati del Cliente.
								 </p>
                 
                 
                 
             <h1 style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              12.Garanzia
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
						12.1 Il Cliente utilizza i Servizi a proprio rischio. Formez & Consulting si impegna a fornire in modo continuativo i Servizi, senza, tuttavia, assumere alcun obbligo al riguardo. In particolare, Formez & Consulting non fornisce alcuna garanzia in merito alla funzionalit&agrave; del Sito, dei moduli, codici e grafiche di propriet&agrave; di CloudyEcommerce e dei Servizi, o all'assenza di errori nel Sito.
								 </p>
                 
                 	   <h1 style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              13.Disposizioni finali
				              </h1>
				           <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							13.1 Qualora una parte delle Condizioni Generali dovesse essere inapplicabile, tutte le altre parti rimarranno valide ed efficaci tra le parti.
								 </p>
                 
                   <h1 style="width: 500px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				               14.Legge applicabile e foro competente
				              </h1>
				        <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							14.1 Le presenti Condizioni Generali sono regolate dalla legge italiana e devono essere interpretate in conformit&agrave; con le leggi italiane.
  </br>14.2 Per le controversie derivanti dall'interpretazione, validit&agrave; e/o esecuzione, delle presenti Condizioni Generali sar&agrave; competente il foro di Roma.
								 </p>
                 
                  <h1 style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              15.Contatti
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							15.1 Per ulteriori informazioni ed assistenza sul Sito o sulle modalit&agrave; di acquisto dei Servizi on-line il Cliente pu&ograve; contattare Formez & Consulting al seguente indirizzo e-mail: admin@CloudyEcommerce.com
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