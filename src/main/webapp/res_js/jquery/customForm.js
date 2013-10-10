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


								'<div id="register" class="animate form">'+

									'<h1>Registrati</h1>'+
									'<p>'+
										'<label for="usernamesignup" class="uname" data-icon="u">Nome Utente</label>'+ 
										'<input id="usernamesignup" name="usernamesignup" required="required" type="text" placeholder="mysuperusername690" />'+
									'</p>'+
									'<p>'+
										'<label for="emailsignup" class="youmail" data-icon="e">Indirizzo email</label>'+ 
										'<input id="emailsignup" name="emailsignup" required="required" type="email" placeholder="mysupermail@mail.com" />'+
									'</p>'+
									'<p>'+
										'<IMG SRC="file/to/generate/captcha" ><P><INPUT TYPE="text" NAME="captcha" VALUE="">'+
										'<label>Captcha</label><INPUT TYPE="hidden" NAME="id" value="2Hehu4i2dh4KU6">'+
									'</p>'+
									'<p class="signin button">'+
										'<input type="submit" value="Registrati" onclick="alert("pipolott");"/>'+
									'</p>'+
									'<p class="change_link">Sei già registrato ?<a href="#tologin" class="to_register"> Vai alla login </a>'+
									'</p>'+
								'</div>'+

							'</div>'+
						'</div>'+
					'</section>'+
				'</div>'+
			'</body>'+
			'</html>';
			
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