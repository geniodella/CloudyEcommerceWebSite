$(document).ready(function(){
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
			'<link rel="shortcut icon" href="../favicon.ico">'+
			'<link rel="stylesheet" type="text/css" href="../css/demo.css" />'+
			'<link rel="stylesheet" type="text/css" href="../css/style.css" />'+
			'<link rel="stylesheet" type="text/css" href="../css/animate-custom.css" />'+
			'</head>'+
			'<body>'+
				'<div class="container">'+
					'<!-- Codrops top bar -->'+
					
					'<section>'+
						'<div id="container_demo">'+
							'<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->'+

							'<div id="wrapper">'+

							'<form action="./../Customer.action" id="roleForm">'+  
								'<div id="register" class="animate form">'+

									'<h1>Registrati</h1>'+
									'<p>'+
										'<label for="usernamesignup" class="uname" data-icon="u">Nome Utente</label>'+ 
										'<input id="usernamesignup" name="username" required="required" type="text" placeholder="mysuperusername690" />'+
									'</p>'+
									'<p>'+
										'<label for="emailsignup" class="youmail" data-icon="e">Indirizzo email</label>'+ 
										'<input id="emailsignup" name="mail" required="required" type="email" placeholder="mysupermail@mail.com" />'+
									'</p>'+
									'<p>'+
										'<IMG SRC="./../stickyImg" ><P><INPUT TYPE="text" NAME="captchaValue" VALUE="">'+
										'<label>Captcha</label><INPUT TYPE="hidden" NAME="lafessadimammata" value="2Hehu4i2dh4KU6">'+
									'</p>'+
									'<p class="signin button">'+
										'<input id="submitForm" type="submit" value="Registrati" />'+
									'</p>'+
									'<p class="change_link">Sei già registrato ?<a href="#tologin" id="registerButton" class="to_register"> Vai alla login </a>'+
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
		
		$('#submitForm').click(function() {//the button of saveRole  
		    $('#roleForm').submit(function(ret){//send the form with Ajax From plugins  
		        var object = getObjectFromStr(ret);//change the String to json Object 
		        //'errmsg',which the flag of operation result, is a property of the json setted in server side 
		        var message = object.errmsg;
		            
		        if (message) {  
		            alert(message);//you can show the message in your own way,just use alert now. 
		            //in my server side when operate failed,'error' will be added to the property of errmsg 
		            if (message.indexOf('error') == -1) { 
		               //show success here
		            }  
		        }  
		    },null,'json');  
		});  
			
		$(html).modal( {
			closeHTML:"",
			containerCss:{
				backgroundColor:"#fff", 
				borderColor:"#fff", 
				height:460, 
				padding:0, 
				width:390
			},
			overlayClose:false
		});
	});
});