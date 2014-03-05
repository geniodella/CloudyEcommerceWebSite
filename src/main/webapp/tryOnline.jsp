

<%@ include file="/include/head.jsp" %>
<%@ include file="/include/header.jsp" %>

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
											$('#register').html('Grazie!').append(' Ti arriverà un\'email coi dati di accesso.').css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif").css("line-height","5");
						                	next();
						          	    });
				                      }
	              	      			  else if(data.success==false){
	                                    if(data.msg==1){
	        			                    	  $('#error-container').html('Il captcha che hai inserito è errato!').css("background","#4AB3C6").css("line-height","2").css("margin","10px 0").css("color","white").css("border","2px solid #ccc").css("height", "30px").css("text-align", "center").css("font-size","16px").css("font-family","arial,verdana,sans-serif");
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

	<div id="content-container">
	
		<%@ include file="/include/headerLayout.jsp" %>
		<br>
		<div id="content">
			<div id="content-header">
				<h1><s:text name="it.ecomweb.page.title.tryOnline"/></h1>
			</div>
			
			<div id="content-body">
			
					<div class="subcolumn1-2" id="content-text" style="height:100px;">
						<h2><s:text name="it.ecomweb.page.tryOnline.text1"/></h2>
						<p><s:text name="it.ecomweb.page.tryOnline.text2"/></p>
						<br><br>
					</div>
				
					<div class="subcolumn2-2" id="content-text" style="height:320px;">
					
						<s:if test="%{secondAccess}">
							<h2><s:text name="it.ecomweb.page.tryOnline.text4"/></h2>
							<p><s:text name="it.ecomweb.page.tryOnline.text5"/></p>	
							<p><a href="./../form" onclick="window.open(this.href,'form','toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=505,height=560')">BOTTONE ACCESSO ONLINE</a></p>						
							<p><s:text name="it.ecomweb.page.tryOnline.text6"/></p>
						</s:if>
						<s:else>
							<h2><s:text name="it.ecomweb.page.tryOnline.text3"/></h2>
							<tr><td height="10"/></tr>
							<tr>
								<td>
									<s:actionerror cssClass="error"/>
								</td>
							</tr>
							<tr>
								<td>
									<s:fielderror cssClass="error"/>
								</td>
							</tr>
							<tr><td height="10"/></tr>
							<s:form name="freeDownloadForm" action="main/tryOnline" method="post" enctype="multipart/form-data">
								<s:textfield key="it.ecomweb.page.tryOnline.form.firstName.label" name="trace.firstName" size="39" />
								<s:textfield key="it.ecomweb.page.tryOnline.form.lastName.label" name="trace.lastName" size="39" />
								<s:textfield key="it.ecomweb.page.tryOnline.form.email.label" name="trace.mail" size="39" />
								
								<s:textfield key="it.ecomweb.page.tryOnline.form.capcha.label" name="answer" size="39" />
								<s:submit type="submit" key="it.ecomweb.button.tryOnline.label"/>
								<s:hidden name="secondAccess" value="true"/>
								<s:hidden name="productId" value="0"/>
								<tr><td height="10"></td></tr>
								<tr><td class="tdLabel" colspan="2"><s:text name="it.ecomweb.page.tryOnline.form.capchaCode.label"/></td></tr>
								<tr><td class="tdLabel" colspan="2"><img src="/EComWeb/stickyImg"/></td></tr>
							</s:form>
						</s:else>
					</div>
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
		<%@ include file="/include/footerLayout.jsp" %>
	</div>
</body>