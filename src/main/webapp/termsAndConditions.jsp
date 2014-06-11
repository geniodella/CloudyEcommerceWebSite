
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
				
				
				jQuery(document).ready(function() {
					jQuery.i18n.properties({
						    name:'Application', 
						    path:'./resources/', 
						    mode:'both',
						    language:'it_IT',
						    	  callback: function() {
								  
									$('#termsAndConditionsTitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions.title'));									
									$('#termsAndConditionsTitle2InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions1_title'));
									
									$('#termsAndConditions1-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions1_1'));
									$('#termsAndConditions1-2InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions1_2'));
									$('#termsAndConditions1-3InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions1_3'));
									
									$('#termsAndConditions2-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions2_title'));
									$('#termsAndConditions2-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions2_1'));
									$('#termsAndConditions2-1-Descr1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions2_1_descr_1'));
									$('#termsAndConditions2-2-Descr2InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions2_1_descr_2'));
									$('#termsAndConditions2-3-Descr3InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions2_1_descr_3'));
									$('#termsAndConditions2-4-Descr4InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions2_1_descr_4'));
									$('#termsAndConditions2-5-Descr5InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions2_1_descr_5'));
									$('#termsAndConditions2-6-Descr6InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions2_1_descr_6'));
									$('#termsAndConditions2-7-Descr7InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions2_1_descr_7'));
									
									$('#termsAndConditions3-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions3_title'));
									$('#termsAndConditions3-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions3_1'));
									
									$('#termsAndConditions4-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions4_title'));
									$('#termsAndConditions4-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions4_1'));
									$('#termsAndConditions4-2InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions4_2'));
									
									$('#termsAndConditions5-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions5_title'));
									$('#termsAndConditions5-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions5_1'));
									$('#termsAndConditions5-2InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions5_2'));
									
									$('#termsAndConditions6-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions6_title'));
									$('#termsAndConditions6-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions6_1'));
									
									$('#termsAndConditions7-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions7_title'));
									$('#termsAndConditions7-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions7_1'));
									
									$('#termsAndConditions8-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions8_title'));
									$('#termsAndConditions8-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions8_1'));
									$('#termsAndConditions8-2InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions8_2'));
									
									$('#termsAndConditions9-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions9_title'));
									$('#termsAndConditions9-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions9_1'));
									$('#termsAndConditions9-2InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions9_2'));
									
									$('#termsAndConditions10-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions10_title'));
									$('#termsAndConditions10-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions10_1'));
									$('#termsAndConditions10-2InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions10_2'));
									$('#termsAndConditions10-3InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions10_3'));
									$('#termsAndConditions10-4InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions10_4'));
									$('#termsAndConditions10-5InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions10_5'));
									
									$('#termsAndConditions11-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions11_title'));
									$('#termsAndConditions11-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions11_1'));
									$('#termsAndConditions11-2InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions11_2'));
									$('#termsAndConditions11-3InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions11_3'));
									$('#termsAndConditions11-3-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions11_3_1'));
									$('#termsAndConditions11-4InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions11_4'));
									$('#termsAndConditions11-5InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions11_5'));
									
									$('#termsAndConditions12-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions12_title'));
									$('#termsAndConditions12-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions12_1'));
									
									$('#termsAndConditions13-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions13_title'));
									$('#termsAndConditions13-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions13_1'));
									
									$('#termsAndConditions14-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions14_title'));
									$('#termsAndConditions14-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions14_1'));
									$('#termsAndConditions14-2InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions14_2'));
									
									$('#termsAndConditions15-TitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions15_title'));
									$('#termsAndConditions15-1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.termsandconditions15_1'));
									
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

			<table align="center" style="background: transparent; border-spacing: 0;">
				<tr>

					<td style="border-radius: 5px; background: transparent">


						<div id="content-body" style="border: 1px solid white;">
						
							<div style="margin-top: 20px;width:960px;height: 3730px;" class="subcolumn1-1" id="content-text">
                 <h1 id="termsAndConditionsTitleInternalDivId" style="color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 30px; line-height: 25px; padding: 0 50px;text-align:center;margin-bottom:30px;">
				              
				              </h1> 
            <div style="width: 970px;height: 270px;">  
              <h1 id="termsAndConditionsTitle2InternalDivId" style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              
				              </h1> 
               <p style="float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
					<span id="termsAndConditions1-1InternalDivId"></span>		
					</br><span id="termsAndConditions1-2InternalDivId"></span>
					</br><span id="termsAndConditions1-3InternalDivId"></span>
      				</p>
									
									</div>

             				   <h1 id="termsAndConditions2-TitleInternalDivId" style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              
				              </h1>                
				                 <p id="termsAndConditions2-1InternalDivId" style="color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
				     	<ul style="margin-left: 30px;">
							<li id="termsAndConditions2-1-Descr1InternalDivId" style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                 			</li>
						
            	<li id="termsAndConditions2-2-Descr2InternalDivId" style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
            
              </li>
              
							<li id="termsAndConditions2-3-Descr3InternalDivId" style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                   
                   </li>
             
							<li id="termsAndConditions2-4-Descr4InternalDivId" style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                  
                   </li>
             
							<li id="termsAndConditions2-5-Descr5InternalDivId" style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                  
                   </li>
            
							<li id="termsAndConditions2-6-Descr6InternalDivId" style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                   
                   </li>
                  		<li id="termsAndConditions2-7-Descr7InternalDivId" style="list-style-image: initial;list-style-type: disc;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 15px; line-height: 10px; margin-top: 20px;padding: 0 0px 0 14px;">
                  
                   </li> 
                   		
                   
              </ul>
                      
						</p>
                    

					   <h1 id="termsAndConditions3-TitleInternalDivId" style="margin-top: 30px;width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              
				              </h1>

				                <p id="termsAndConditions3-1InternalDivId" style="float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;margin-bottom: 20px;padding: 0 0px 0 50px;">
							</p>

				                <p style="float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;margin-bottom: 20px;padding: 0 0px 0 50px;">
							3.1 Per poter utilizzare la piattaforma CloudyEcommerce, il Cliente deve selezionare un profilo mensile o annuale tra quelli disponibili sul Sito, successivamente ricever&agrave; una email  dove indicher&agrave; il nome a dominio su cui installare la piattaforma CloudyEcommerce. Il Cliente pu&ograve; decidere di installare la piattaforma CloudyEcommerce su un nome a dominio gi&agrave; in suo possesso.

								 </p>
                 
               <h1 id="termsAndConditions4-TitleInternalDivId" style="width: 350px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
						<span id="termsAndConditions4-1InternalDivId" ></span>
					</br><span id="termsAndConditions4-2InternalDivId"></span>
								 </p>
                 
                    <h1 id="termsAndConditions5-TitleInternalDivId" style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							<span id="termsAndConditions5-1InternalDivId"> </span>
						</br><span id="termsAndConditions5-2InternalDivId" ></span>
								 </p>
                 
                    <h1 id="termsAndConditions6-TitleInternalDivId" style="width: 650px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              
				              </h1>
				         <p id="termsAndConditions6-1InternalDivId" style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
						 </p>
                 
                   <h1 id="termsAndConditions7-TitleInternalDivId" style="width: 800px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				             </h1>
				            <p id="termsAndConditions7-1InternalDivId" style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							</p>
                 
                   <h1 id="termsAndConditions8-TitleInternalDivId" style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							<span id="termsAndConditions8-1InternalDivId" ></span>
							</br><span id="termsAndConditions8-2InternalDivId" ></span> 
								 </p>
                 
                    <h1 id="termsAndConditions9-TitleInternalDivId" style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				           
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
						<span id="termsAndConditions9-1InternalDivId"></span> 
					</br><span id="termsAndConditions9-2InternalDivId" ></span>
								 </p>
                 
                  <h1 id="termsAndConditions10-TitleInternalDivId" style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              
				              </h1>

				               <p  style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							<span id="termsAndConditions10-1InternalDivId" ></span>
								</br><span id="termsAndConditions10-2InternalDivId" ></span>
								</br><span id="termsAndConditions10-3InternalDivId" ></span>
								</br><span id="termsAndConditions10-4InternalDivId" ></span>
								</br><span id="termsAndConditions10-5InternalDivId" ></span>

				               <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							10.1 Il Cliente si impegna ad utilizzare i Servizi nel rispetto della normativa vigente ed &egrave; pienamente responsabile dei contenuti dei propri siti web. Il Cliente si impegna a farsi carico di tutti i rischi connessi all'utilizzo o mancato utilizzo dei Servizi, nonch&egrave; al contenuto dei propri siti web, e ad assumersi la piena responsabilit&agrave; dell'eventuale pregiudizio causato a terzi dall'utilizzo dei Servizi, o dal contenuto dei propri siti web, anche dopo la disattivazione di un account Cliente o successivamente al recesso del Cliente. Il Cliente si impegna pertanto a non ritenere CloudyEcommerce responsabile in alcun modo di eventuali danni derivanti o causati dall'utilizzo dei Servizi o dal contenuto dei propri siti web, nei limiti consentiti dalla legge.
</br>10.2 In nessun caso e in nessuna circostanza CloudyEcommerce potr&agrave; essere ritenuta responsabile per perdite di dati o di files dei Clienti ospitati sui propri server.
</br>10.3 CloudyEcommerce non potr&agrave; essere ritenuta responsabile per l'uso dei domini prescelti dal Cliente ai fini dell'installazione di una piattaforma CloudyEcommerce. Il Cliente si impegna a tenere indenne CloudyEcommerce da qualunque pretesa di terzi in relazione a tali domini, anche dopo la disattivazione di un account Cliente o successivamente al recesso del Cliente.
</br>10.4 L'utilizzo di un account Cliente come uno spazio di storage online per l'archiviazione di file elettronici &egrave; vietato e comporta la disattivazione dell'account Cliente senza alcun preavviso. Formez & Consulting non ha l'obbligo di monitorare i contenuti immessi dal Cliente sulla piattaforma CloudyEcommerce. Tuttavia, Formez & Consulting potr&agrave; rimuovere tali contenuti o vietare qualsiasi utilizzo dei Servizi che ritiene sia (o possa essere) in violazione delle Condizioni Generali o di diritti di propriet&agrave; intellettuale di terze parti.
</br>10.5 Formez & Consulting non ha alcun obbligo di intervento per la risoluzione di problemi segnalati dal cliente. La piattaforma viene fornita cosi' com' &egrave;. I termini dell'assistenza tecnica sono approfonditi nella pagina Assistenza Tecnica 

								 </p>
                 
                    <h1 id="termsAndConditions11-TitleInternalDivId" style="width: 500px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				             
				              </h1>
				              <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							<span id="termsAndConditions11-1InternalDivId"  ></span>
							</br><span id="termsAndConditions11-2InternalDivId" ></span>
							</br><span id="termsAndConditions11-3InternalDivId" ></span>
							</br><span id="termsAndConditions11-3-1InternalDivId" ></span>
							</br><span id="termsAndConditions11-4InternalDivId" ></span>
							</br><span id="termsAndConditions11-5InternalDivId" ></span>
								 </p>
                 
                 
                 
             <h1 id="termsAndConditions12-TitleInternalDivId" style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              
				              </h1>
				              <p id="termsAndConditions12-1InternalDivId" style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
						
								 </p>
                 
                 	   <h1 id="termsAndConditions13-TitleInternalDivId" style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				             
				              </h1>
				           <p id="termsAndConditions13-1InternalDivId" style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							
								 </p>
                 
                   <h1 id="termsAndConditions14-TitleInternalDivId" style="width: 500px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				               
				              </h1>
				        <p style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							<span id="termsAndConditions14-1InternalDivId" ></span>
					  </br><span id="termsAndConditions14-2InternalDivId" ></span>
								 </p>
                 
                  <h1 id="termsAndConditions15-TitleInternalDivId" style="width: 300px;color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              
				              </h1>
				              <p id="termsAndConditions15-1InternalDivId" style="margin-bottom: 20px;float: left;color:black;text-align: left;font-weight:normal;font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
							
								 </p>
						
                    </div>
                    
                    
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

            
					</td>

				</tr>
				<%@ include file="/include/footerLayout.jsp"%>
			</table>

		</div>
</body>