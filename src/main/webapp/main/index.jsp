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
<%@ include file="/include/head.jsp" %>
<%@ include file="/include/header.jsp" %>

<body>
	<div id="content-container">	
	<%@ include file="/include/headerLayout.jsp" %>
	

		<p><br></p>
		<div id="content">
		
			<div id="content-header">
				<h1><s:text name="it.ecomweb.page.title.index"/></h1>
			</div>
		
			<div id="content-body">
			
				<div id="content-image" class="subcolumn1-1">
					IMMAGINE DI PRESENTAZIONE A TUTTA PAGINA.<br>
					<img src="<s:property value="#imagePath"/>/Under-construction.png">
				</div>
		
			
				<div class="subcolumn1-3" id="content-text">
					<div id="download-text"><p><s:text name="it.ecomweb.page.index.text1"/></p></div>
					<div id="download-link"><p><a href="<s:url action="main/download"/>">BOTTONE DOWNLOAD</a></p></div>
				</div>
				
				<div class="subcolumn2-3" id="content-text">
					<div id="download-text"><p><s:text name="it.ecomweb.page.index.text2"/></p></div>
					<div id="download-link"><p><a href="<s:url action="main/download"/>">BOTTONE DOWNLOAD</a></p></div>					
				</div>
				
				<div class="subcolumn3-3" id="content-text">
					<div id="download-text"><p><s:text name="it.ecomweb.page.index.text3"/></p></div>
					<div id="download-link"><p><a href="<s:url action="main/buy"/>">BOTTONE ACQUISTA</a></p></div>					
				</div>
			
				<div id="home-message-text" class="subcolumn1-1">
					<h1 style="font-size: 30px;line-height: 30px; margin-top:15px;"><s:text name="it.ecomweb.page.index.text4"/></h1>
				</div>
			
			</div>
			
			<div id="content-footer">
				<a href="https://www.paypal.com/it/mrb/pal=9GUSU3SCTGKWU" target="_blank"><img src="<s:property value="#imagePath"/>/bnr_paypal_mrb_banner_468wx60h.gif" alt="%{getText('it.ecomweb.global.paypal.subscription')}" border="0"></a>
			</div>
		</div>
	</div>
	
	<%@ include file="/include/footerLayout.jsp" %>

</body>