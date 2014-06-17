
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
			
			var random = Math.floor((Math.random()*100)+1);
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
											'<IMG SRC="./stickyImg?'+random+'" style="width: 250px;height: 60px;" id="captchaId">'+
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
			
				
				$('#roleForm').die('submit');
				
				$('#roleForm').live('submit', function(event){	
					
					 $(this).find('input[type=submit]').attr('disabled', 'disabled');
					
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
           					$('#register').html(jQuery.i18n.prop('org.commercialsite.subscriptionform.loading'));
				         	    $('#register').animate({
									height: '50px'
							    }); 
				         	    
				         	    $('#register').append("<img id='theImg' src='res_img/loading.gif' style='margin: 0 200px;display: block;'/>").delay(1000).queue(function (next) {
									$('#register').html(jQuery.i18n.prop('org.commercialsite.subscriptionform.thanks')).append(jQuery.i18n.prop('org.commercialsite.subscriptionform.confirmalmessage')).css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif").css("line-height","5");
				                	next();
				          	    });
		                      }
         	      		  else if(data.success==false){
         	      		   $('input[type="submit"]').removeAttr('disabled');
         	      			  
                               if(data.msg==1){
   			                    	  $('#error-container').html(jQuery.i18n.prop('org.commercialsite.subscriptionform.wrongcaptcha')).css("background","#4AB3C6").css("line-height","2").css("margin","10px 0").css("color","white").css("border","2px solid #ccc").css("height", "30px").css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif");
         						}else if (data.msg==2){
         							 $('#error-container').html(jQuery.i18n.prop('org.commercialsite.subscriptionform.existinguser')).css("background","#4AB3C6").css("line-height","2").css("margin","10px 0").css("color","white").css("border","2px solid #ccc").css("height", "30px").css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif");
         						}
                               else{
         			                 $('#error-container').html(jQuery.i18n.prop('org.commercialsite.subscriptionform.existingemail')).append(jQuery.i18n.prop('org.commercialsite.subscriptionform.insertnewemail')).css("background","#4AB3C6").css("line-height","2").css("margin","10px 0").css("color","white").css("border","2px solid #ccc").css("height", "30px").css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif");
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
			
			jQuery(document).ready(function() {
					jQuery.i18n.properties({
						    name:'Application', 
						    path:'./resources/', 
						    mode:'both',
						    	  callback: function() {
								  
								  $('#moreToComeCustomTemplateTitleInternalDivId').append("<h3>"+jQuery.i18n.prop('org.commercialsite.moretocome.customtemplate.title')+"</h3>");
								  $('#moreToComeCustomTemplateDescrInternalDivId').append(jQuery.i18n.prop('org.commercialsite.moretocome.customtemplate.descr'));
								  
								  $('#moreToComeCdnIntegrationTitleInternalDivId').append("<h3>"+jQuery.i18n.prop('org.commercialsite.moretocome.cdnintegration.title')+"</h3>");
								  $('#moreToComeCdnIntegrationDescrInternalDivId').append(jQuery.i18n.prop('org.commercialsite.moretocome.cdnintegration.descr'));
								  
								  $('#moreToComeMobileClientTitleInternalDivId').append("<h3>"+jQuery.i18n.prop('org.commercialsite.moretocome.mobileclient.title')+"</h3>");
								  $('#moreToComeMobileClientDescrInternalDivId').append(jQuery.i18n.prop('org.commercialsite.moretocome.mobileclient.descr'));
								  
								  $('#moreToComeStatisticsTitleInternalDivId').append("<h3>"+jQuery.i18n.prop('org.commercialsite.moretocome.statistics.title')+"</h3>");
								  $('#moreToComeStatisticsDescrInternalDivId').append(jQuery.i18n.prop('org.commercialsite.moretocome.statistics.descr'));
								  
								  $('#moreToComeNewsletterTitleInternalDivId').append("<h3>"+jQuery.i18n.prop('org.commercialsite.moretocome.newsletter.title')+"</h3>");
								  $('#moreToComeNewsletterDescrInternalDivId').append(jQuery.i18n.prop('org.commercialsite.moretocome.newsletter.descr'));
								  

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
							
							$('#featuresCommercialSiteShareInternalDivId').append("<p>"+jQuery.i18n.prop('org.commercialsite.share')+"</p>");
										
							$('#featuresCommercialSiteTermsAndConditionsInternalDivId').append("<a>"+jQuery.i18n.prop('org.commercialsite.termsandconditions')+"</a>");
										
							}
						  
						});
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
												style="float: left; width: 200px; height: 200px; margin: 0px 100px 0px 0; position: relative;">
											<h3  style="margin-bottom:-30px;" id="moreToComeCustomTemplateTitleInternalDivId"></h3>
											<br>
											<ul id="moreToComeCustomTemplateDescrInternalDivId">
												
												</br>
											</ul>
										</div>
										<div class="textSlide">
											<img src="./res_img/clientMobile.jpg"
												style="float: left; width: 200px; height: 200px; margin: 0px 100px 0px 0; padding: 25px 0 0; position: relative;">
											<h3 style="margin-bottom:-30px;" id="moreToComeMobileClientTitleInternalDivId"></h3>
											<br>
											<ul id="moreToComeMobileClientDescrInternalDivId">
												
												</br>
											</ul>
										</div>
										
									</li>
									
									<li>										
										<div class="textSlide">
											<img src="./res_img/graph&stats.jpg"
												style="float: left; width: 200px; height: 200px; margin: 0px 100px 0px 0; position: relative;">
											<h3 id="moreToComeStatisticsTitleInternalDivId"></h3>
											<br>
											<ul id="moreToComeStatisticsDescrInternalDivId">
											</ul>
										</div>
										<div class="textSlide">
											<img src="./res_img/newsletter.jpg"
												style="float: left; width: 200px; height: 200px; margin: 35px 100px 0px 0; padding: 15px 0; position: relative;">
											<h3 style="margin-bottom:-30px;" id="moreToComeNewsletterTitleInternalDivId"></h3>
											<br>
											<ul id="moreToComeNewsletterDescrInternalDivId">
												
												</br>
											</ul>
										</div>
									</li>
									
									<li>
										<div class="textSlide">
											<img src="./res_img/cdn.png"
												style="float: left; width: 200px; height: 200px; margin: 0px 100px 0px 0; position: relative;">
											<h3 style="margin-bottom:-30px;" id="moreToComeCdnIntegrationTitleInternalDivId"></h3>
											<br>
											<ul id="moreToComeCdnIntegrationDescrInternalDivId">
												
												</br>
											</ul>
										</div>										
									</li>

								</ul>
								<!-- END AnythingSlider #1 -->

							</div>

						</div>

						   <div id="content-footer">
			<a style="float: left;"><img style="margin: 10px;"src="./res_img/creditCards.png">
				
								<!-- AddThis Button BEGIN -->
				<div id="customAddThis" >

				
<!-- 				<p id="featuresCommercialSiteShareInternalDivId" style="font-size:15px;color:#36aad8;font-family: arial;font-weight: normal;margin-right: 10px;line-height: 0.3;"></p> -->

				<div class="addthis_horizontal_follow_toolbox"></div>
				</div>
				
				
					<a id="featuresCommercialSiteTermsAndConditionsInternalDivId" style="float: right;margin-right: 30px;font-size: 15px;color: #36aad8;font-family: arial;font-weight: normal;" href="./termsAndConditions.jsp"><br></a>
				
				
				
				<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
				<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5182d50a1862ddb1"></script>
				
				<!-- per rimuovere hash dall'url -->
				<script type="text/javascript">
		          var addthis_config = addthis_config||{};
		          addthis_config.data_track_addressbar = false;
		        </script>
				<!-- AddThis Button END -->
				
				<!-- AddThis Button END -->
				
		</div>

					</td>

				</tr>
			</table>
		</div> <%@ include file="/include/footerLayout.jsp"%>

		</div>
</body>