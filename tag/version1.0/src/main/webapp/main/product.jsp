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
				<h1><s:text name="it.ecomweb.page.title.product"/></h1>
			</div>
			<div id="content-body">
					<div class="subcolumn1-1" id="content-text">
						<h2><s:text name="it.ecomweb.page.product.text1"/></h2><br>
						<p><s:text name="it.ecomweb.page.product.text2"/></p>
						<p><s:text name="it.ecomweb.page.product.text3"/></p>
						<p><s:text name="it.ecomweb.page.product.text4"/></b>
						<p><s:text name="it.ecomweb.page.product.text5"/></p>
						<p><s:text name="it.ecomweb.page.product.text6"/></p>
					</div>
				
					<div class="subcolumn1-3" id="content-form">
						<h2><s:text name="it.ecomweb.page.product.text7"/></h2><br>
						<p><s:text name="it.ecomweb.page.product.text8"/>
						<br>
						<s:text name="it.ecomweb.page.product.text9"/>
						<br>
						<s:text name="it.ecomweb.page.product.text10"/>
						<a href="<s:property value="#pagePath" />/main/download.action#compareProduct">
						<s:text name="it.ecomweb.page.product.text11"/>
						</a>
						</p>
					</div>
					
					<div class="subcolumn2-3" id="content-text">
						<h2><s:text name="it.ecomweb.page.product.text12"/></h2><br>
						<p>Immagine versione free</p>
					</div>
					
					<div class="subcolumn3-3" id="content-text">
						<h2><s:text name="it.ecomweb.page.product.text13"/></h2><br>
						<p>Immagine versione enterprise</p>
					</div>
					
				</div>
			
			</div>
			
			<div id="content-footer">
				<a href="https://www.paypal.com/it/mrb/pal=9GUSU3SCTGKWU" target="_blank"><img src="<s:property value="#imagePath"/>/bnr_paypal_mrb_banner_468wx60h.gif" alt="%{getText('it.ecomweb.global.paypal.subscription')}" border="0"></a>
			</div>
		</div>
	</div>
	<%@ include file="/include/footerLayout.jsp" %>
</body>