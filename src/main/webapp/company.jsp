
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
			
			jQuery(document).ready(function() {
					jQuery.i18n.properties({
						    name:'Application', 
						    path:'./resources/', 
						    mode:'both',
						    	  callback: function() {
								  
									$('#companyPageCommercialSiteTitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.companypage.title'));
									
									$('#companyPageCommercialSiteBlock1InternalDivId').append(jQuery.i18n.prop('org.commercialsite.companypage.block1'));
									$('#companyPageCommercialSiteBlock2InternalDivId').append(jQuery.i18n.prop('org.commercialsite.companypage.block2'));
									$('#companyPageCommercialSiteBlock3InternalDivId').append(jQuery.i18n.prop('org.commercialsite.companypage.block3'));
									
									$('#companyPageCommercialSiteServerTechnologiesTitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.companypage.server.technologies.title'));
									$('#companyPageCommercialSiteClientTechnologiesTitleInternalDivId').append(jQuery.i18n.prop('org.commercialsite.companypage.client.technologies.title'));
								  
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


						<div id="content-body">
						
							<div style="margin-top: 20px;" class="subcolumn1-1" id="content-text">

             				 <h1 id="companyPageCommercialSiteTitleInternalDivId" style="color:#46565F;font-family:'Della Respira',serif;font-weight:bold;font-size: 24px; line-height: 25px; padding: 0 50px;text-align:left">
				              
				              </h1>
				              <p id="companyPageCommercialSiteBlock1InternalDivId" style="width: 870px;font-weight:normal;color:black;text-align: left;font-family:Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
								
							</p>

								<br>
                <div style="width: 980px;">
                <p id="companyPageCommercialSiteBlock2InternalDivId" style="font-weight:normal;color:black;text-align: left;font-family:Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px;margin-bottom: -1px; margin-top: 0px;padding: 0 0px 0 50px;width: 350px;float: left;">                                                                                                                        
               
 </p>

 <img style="width: 550px;float: right;margin-right: 10px;" 
									src="./res_img/diagramma.png">
                  
                   <p id="companyPageCommercialSiteBlock3InternalDivId" style="width: 875px;font-weight:normal;color:black;text-align: left;font-family:Verdana, Arial, Helvetica, sans-serif;font-size: 14px; line-height: 25px; margin-top: 15px;padding: 0 0px 0 50px;">
 
</p> 
                  
                    </div>
							</div>
              
              	     <ul style="padding: 0 0px 0 80px;font-family:Verdana, Arial, Helvetica, sans-serif;font-weight:normal;display: inline-block;">
                    <p id="companyPageCommercialSiteServerTechnologiesTitleInternalDivId" style="font-family: 'Della Respira',serif;font-weight:bold;"></p>
                         <li style="list-style: disc outside none;font-size: 13px;">J2EE</li>
                         <li style="list-style: disc outside none;font-size: 13px;">JMS</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Hibernate</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Struts 2</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Spring</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Spring Security</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Quartz Scheduling framework</li>
                         <li style="list-style: disc outside none;font-size: 13px;">OSGI</li>
                      </ul>
                      <ul style="font-weight:normal;display: inline-block;padding:0 90px 0 120px;line-height: 2.39;">   
                         <p id="companyPageCommercialSiteClientTechnologiesTitleInternalDivId" style="font-family: 'Della Respira',serif;font-weight:bold;"></p>
                         <li style="list-style: disc outside none;font-size: 13px;">Ext JS</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Sencha Touch</li>
                         <li style="list-style: disc outside none;font-size: 13px;">jQuery</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Android</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Javascript</li>
                     </ul>    
                    <ul style="font-weight:normal;display: inline-block;line-height: 1.9;">     
                         <p style="font-family: 'Della Respira',serif;font-weight:bold;">CONTINUOUS INTEGRATION</p>
                         <li style="list-style: disc outside none;font-size: 13px;">Maven</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Ant</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Hudson</li>
                         <li style="list-style: disc outside none;font-size: 13px;">jUnit</li>
                         <li style="list-style: disc outside none;font-size: 13px;">SVN</li>
                         <li style="list-style: disc outside none;font-size: 13px;">Git</li>
                    </ul>

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