

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
	
	 hs.allowMultipleInstances = false;
             
</script>


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
						window.location.href="/24333_BackSite";
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
								  
									  $('#headTitleSlider').append("<h1 style='font-size: 30px; line-height: 30px; margin-top: 15px;'>"+jQuery.i18n.prop('org.commercialsite.headSlider.title')+"</h1>");
						    		
									  $('#productNavigationFeaturesTitleInternalDivId').append("<h3 style='margin-bottom: 0px;'>"+jQuery.i18n.prop('org.commercialsite.productnavigation.title')+"</h3>");
									  $('#productNavigationFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.productnavigation.descr1')+"</li>");
									  $('#productNavigationFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.productnavigation.descr2')+"</li>");
									  $('#productNavigationFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.productnavigation.descr3')+"</li>");
									  $('#productNavigationFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.productnavigation.descr4')+"</li>");
									  $('#productNavigationFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.productnavigation.descr5')+"</li>");
									  
									  $('#productCartFeaturesTitleInternalDivId').append("<h3 style='margin-bottom: 0px;'>"+jQuery.i18n.prop('org.commercialsite.cartfeatures.title')+"</h3>");
									  $('#productCartFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.cartfeatures.descr1')+"</li>");
									  $('#productCartFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.cartfeatures.descr2')+"</li>");
									  $('#productCartFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.cartfeatures.descr3')+"</li>");
									  $('#productCartFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.cartfeatures.descr4')+"</li>");
									  $('#productCartFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.cartfeatures.descr5')+"</li>");
									  $('#productCartFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.cartfeatures.descr6')+"</li>");
									  $('#productCartFeaturesInternalDivId').append("<li style='list-style: disc outside none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.cartfeatures.descr7')+"</li>");
									 
									  $('#productPurchaseFeaturesTitleInternalDivId').append("<h3 style='margin-bottom: 0px;'>"+jQuery.i18n.prop('org.commercialsite.purchasefeatures.title')+"</h3>");
									  $('#productPurchaseFeaturesInternalDivId').append("<li style='list-style: none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.purchasefeatures.descr1')+"</li>");
									  
									  $('#productTagFeaturesTitleInternalDivId').append("<h3 style='margin-bottom: 0px;'>"+jQuery.i18n.prop('org.commercialsite.tagfeatures.title')+"</h3>");
									  $('#productTagFeaturesInternalDivId').append("<li style='list-style: none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.tagfeatures.descr1')+"</li>");
									  
									  $('#productCustomerManagementFeaturesTitleInternalDivId').append("<h3 style='margin-bottom: 0px;'>"+jQuery.i18n.prop('org.commercialsite.customermanagement.title')+"</h3>");
									  $('#productCustomerManagementFeaturesInternalDivId').append("<li style='list-style: none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.customermanagement.descr1')+"</li>");
									  
									  $('#productAjaxTechnologyFeaturesTitleInternalDivId').append("<h3 style='margin-bottom: 0px;'>"+jQuery.i18n.prop('org.commercialsite.ajaxtechnology.title')+"</h3>");
									  $('#productAjaxTechnologyFeaturesInternalDivId').append("<li style='list-style: none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.ajaxtechnology.descr1')+"</li>");
									  
									  $('#productJavaEnterpriseFeaturesTitleInternalDivId').append("<h3 style='margin-bottom: 0px;'>"+jQuery.i18n.prop('org.commercialsite.javaenterprise.title')+"</h3>");
									  $('#productJavaEnterpriseFeaturesInternalDivId').append("<li style='list-style: none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.javaenterprise.descr1')+"</li>");
									  
									  $('#productFlexibilityFeaturesTitleInternalDivId').append("<h3 style='margin-bottom: 0px;'>"+jQuery.i18n.prop('org.commercialsite.flexibility.title')+"</h3>");
									  $('#productFlexibilityFeaturesInternalDivId').append("<li style='list-style: none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.flexibility.descr1')+"</li>");
									  
									  $('#productSupportFeaturesTitleInternalDivId').append("<h3 style='margin-bottom: 0px;'>"+jQuery.i18n.prop('org.commercialsite.support.title')+"</h3>");
									  $('#productSupportFeaturesInternalDivId').append("<li style='list-style: none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.support.descr1')+"</li>");
									  
									  $('#productIaasFeaturesTitleInternalDivId').append("<h3 style='margin-bottom: 0px;'>"+jQuery.i18n.prop('org.commercialsite.iaas.title')+"</h3>");
									  $('#productIaasFeaturesInternalDivId').append("<li style='list-style: none;font-size: 13px;'>"+jQuery.i18n.prop('org.commercialsite.iaas.descr1')+"</li>");
						    		  
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
												
										$('#featuresPreviewTitleInternalDivId').append("<p>"+jQuery.i18n.prop('org.commercialsite.featurespreview.title')+"</p>");
										
										$('#featuresPreview1InternalDivId').append("<p>"+jQuery.i18n.prop('org.commercialsite.featurespreview.descr1')+"</p>");
										$('#featuresPreview2InternalDivId').append("<p>"+jQuery.i18n.prop('org.commercialsite.featurespreview.descr2')+"</p>");
										$('#featuresPreview3InternalDivId').append("<p>"+jQuery.i18n.prop('org.commercialsite.featurespreview.descr3')+"</p>");
										$('#featuresPreview4InternalDivId').append("<p>"+jQuery.i18n.prop('org.commercialsite.featurespreview.descr4')+"</p>");
										$('#featuresPreview5InternalDivId').append("<p>"+jQuery.i18n.prop('org.commercialsite.featurespreview.descr5')+"</p>");
										$('#featuresPreview6InternalDivId').append("<p>"+jQuery.i18n.prop('org.commercialsite.featurespreview.descr6')+"</p>");
										$('#featuresPreview7InternalDivId').append("<p>"+jQuery.i18n.prop('org.commercialsite.featurespreview.descr7')+"</p>");
										
										$('#featuresCommercialSiteShareInternalDivId').append("<p>"+jQuery.i18n.prop('org.commercialsite.share')+"</p>");
										
										$('#featuresCommercialSiteTermsAndConditionsInternalDivId').append("<a>"+jQuery.i18n.prop('org.commercialsite.termsandconditions')+"</a>");
								    }
						  
						});
				    });
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
					<h1 id="headTitleSlider" style="font-size: 30px; line-height: 30px; margin-top: 15px;">
					</h1>
				</div>
			
  
  			<div id="page-wrap">
					<ul id="slider1">

						<li>
							<div class="textSlide" style="height: 190px;padding:10px 0">
              				<img src="./res_img/productsNavigation.jpg" style="float:left;width:200px; height:230px;padding: 0px 0; margin: 0px 100px 0px 0;position:relative;">
								<h3 id="productNavigationFeaturesTitleInternalDivId" style="margin-top: 30px;"></h3>
								<br>
								<ul id="productNavigationFeaturesInternalDivId"  style="list-style-type: none;margin-left: 157px;padding: 0 160px;font-family: Verdana, Arial, Helvetica, sans-serif !important;font-size: 13px!important;font-weight: normal!important;line-height: 1.5;">
																		
								</ul>
							</div>
							<div class="textSlide" style="padding: 30px 0;">
							<img src="./res_img/cart.png" style="float:left;width:200px; height:200px; margin: 30px 100px 0px 0;padding: 25px 0 10px;position:relative;">
								<h3 id="productCartFeaturesTitleInternalDivId"  style="margin-top: 30px;"></h3>
								<br>
								<ul id="productCartFeaturesInternalDivId" style="list-style-type: none;margin-left: 206px;padding: 0 110px;font-family: Verdana, Arial, Helvetica, sans-serif !important;font-size: 13px!important;font-weight: normal!important;line-height: 1.5;">
								
								</ul>
							</div>							
						</li>
						
						<li>
							<div style="padding:20px 0;height:190px" class="textSlide">
							<img src="./res_img/funzionalitaAcquisto.jpg" style="float:left;width:250px; height:200px;margin: 0px 50px 0px 0;position:relative;">
								<h3 id="productPurchaseFeaturesTitleInternalDivId" style="margin-top: 10px;"></h3>
								<br>
								<ul id="productPurchaseFeaturesInternalDivId" style="list-style-type: none;
											margin: 0;
											padding: 0 160px;
											font-family: Verdana, Arial, Helvetica, sans-serif !important;
											font-size: 13px!important;
											font-weight: normal!important;
											line-height: 1.5;">
									
								</ul>
							</div>
							<div class="textSlide">
							<img src="./res_img/tag.jpg" style="float:left;width:200px; height:200px; margin: 30px 100px 0px 0;position:relative;">
								<h3 id="productTagFeaturesTitleInternalDivId" style="margin-top: 30px;"></h3>
								<br>
								<ul  id="productTagFeaturesInternalDivId" style="list-style-type: none;
											margin: 0;
											padding: 0 160px;
											font-family: Verdana, Arial, Helvetica, sans-serif !important;
											font-size: 13px!important;
											font-weight: normal!important;
											line-height: 1.5;">
									
								</ul>
							</div>
						</li>


						<li>
							
							<div class="textSlide" style="height: 190px;">
							<img src="./res_img/customers.jpg" style="float:left;width:200px; height:200px; margin: 0px 100px 0px 0;position:relative;">
								<h3 id="productCustomerManagementFeaturesTitleInternalDivId" ></h3>
								<br>
								<ul id="productCustomerManagementFeaturesInternalDivId" style="list-style-type: none;
											margin: 0;
											padding: 0 160px;
											font-family: Verdana, Arial, Helvetica, sans-serif !important;
											font-size: 13px!important;
											font-weight: normal!important;
											line-height: 1.5;">
									
								</ul>
							</div>
							<div class="textSlide">
							<img src="./res_img/ajax.jpg" style="float:left;width:200px; height:250px; margin:-40px 100px 20px 0;padding: 35px 0;position:relative;">
								<h3 id="productAjaxTechnologyFeaturesTitleInternalDivId" style="margin-top: 20px;"></h3>
								<br>
								<ul id="productAjaxTechnologyFeaturesInternalDivId" style="list-style-type: none;
											margin: 0;
											padding: 0 160px;
											font-family: Verdana, Arial, Helvetica, sans-serif !important;
											font-size: 13px!important;
											font-weight: normal!important;
											line-height: 1.5;">
									
								</ul>
							</div>
						</li>


						<li>
							<div class="textSlide" style="height: 190px;">
							<img src="./res_img/java.png" style="float:left;width:200px; height:200px; margin: 10px 100px 0px 0;position:relative;">
								<h3 id="productJavaEnterpriseFeaturesTitleInternalDivId" ></h3>
								<br>
								<ul id="productJavaEnterpriseFeaturesInternalDivId">
									
								</ul>
							</div>
							<div class="textSlide">
							<img src="./res_img/customizerIcon.png" style="padding: 10px 0;float:left;width:200px; height:200px; margin: 20px 100px 0px 0;position:relative;">
								<h3 id="productFlexibilityFeaturesTitleInternalDivId" style="margin-top: 30px;"></h3>
								<br>
								<ul id="productFlexibilityFeaturesInternalDivId" style="list-style-type: none;
											margin: 0;
											padding: 0 170px;
											font-family: Verdana, Arial, Helvetica, sans-serif !important;
											font-size: 13px!important;
											font-weight: normal!important;
											line-height: 1.5;">
									
								</ul>
							</div>
						</li>
						
						<li>
							<div class="textSlide" style="height: 190px;">
							<img src="./res_img/24hours.jpg" style="float:left;width:200px; height:200px; margin: 20px 100px 0px 0;position:relative;">
								<h3 id="productSupportFeaturesTitleInternalDivId" style="margin-top: 30px;"></h3>
								<br>
								<ul id="productSupportFeaturesInternalDivId" style="list-style-type: none;
											margin: 0;
											padding: 0 160px;
											font-family: Verdana, Arial, Helvetica, sans-serif !important;
											font-size: 13px!important;
											font-weight: normal!important;
											line-height: 1.5;">
									
								</ul>
							</div>
						
							<div class="textSlide" style="height: 190px;">
							<img src="./res_img/iaas.jpg" style="float:left;width:200px; height:200px; margin: 20px 100px 0px 0;position:relative;">
								<h3 id="productIaasFeaturesTitleInternalDivId" style="margin-top: 30px;"></h3>
								<br>
								<ul id="productIaasFeaturesInternalDivId" style="list-style-type: none;
											margin: 0;
											padding: 0 160px;
											font-family: Verdana, Arial, Helvetica, sans-serif !important;
											font-size: 13px!important;
											font-weight: normal!important;
											line-height: 1.5;">
									
								</ul>
							</div>
						</li>



					</ul>
					<!-- END AnythingSlider #1 -->
				
			</div>
      
      <p id="featuresPreviewTitleInternalDivId" style="font-size:20px;color:#36aad8;font-family: arial;font-weight: normal;margin-left: 10px;line-height: 3;"></p>
      
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
     
     
      <span id="featuresPreview1InternalDivId" style="display: inline-block;padding-left: 130px; width: 63px;"></span>
      <span id="featuresPreview2InternalDivId" style="margin-left: 35px;display: inline-block;height: 40px;width: 95px;vertical-align: top;"></span>
      <span id="featuresPreview3InternalDivId" style="display: inline-block;width: 90px;vertical-align: top;margin-left: 20px;"></span> 
      <span id="featuresPreview4InternalDivId" style="display: inline-block;width: 74px;vertical-align: top;margin-left: 25px;"></span> 
      <span id="featuresPreview5InternalDivId" style="display: inline-block;width: 70px;vertical-align: top;margin-left: 45px;"></span> 
      <span id="featuresPreview6InternalDivId" style="display: inline-block;width: 86px;vertical-align: top;margin-left: 28px;"></span> 
      <span id="featuresPreview7InternalDivId" style="display: inline-block;width: 80px;vertical-align: top;margin-left: 23px;"></span>       
       

				</div>
				
				   <div id="content-footer">
			<a style="float: left;"><img style="margin: 10px;"src="./res_img/creditCards.png">
				
								<!-- AddThis Button BEGIN -->
				<div style="margin-right: 30px;margin-top: 10px;margin-left: 100px;width: 250px;display: inline-block;" class="addthis_toolbox addthis_default_style addthis_32x32_style">
				
				<p id="featuresCommercialSiteShareInternalDivId" style="font-size:15px;color:#36aad8;font-family: arial;font-weight: normal;margin-right: 10px;line-height: 0.3;"></p>
				 <a class="addthis_button_facebook"></a>
	    					   <a class="addthis_button_twitter"></a>
	    					   <a class="addthis_button_pinterest_share"></a>
	    					   <a class="addthis_button_linkedin"></a>
	    					   <a class="addthis_button_google_plusone_share"></a>
				</div>
				
				
					<a id="featuresCommercialSiteTermsAndConditionsInternalDivId" style="float: right;margin-right: 30px;font-size: 15px;color: #36aad8;font-family: arial;font-weight: normal;" href="./termsAndConditions.jsp"><br></a>
				
				
				
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