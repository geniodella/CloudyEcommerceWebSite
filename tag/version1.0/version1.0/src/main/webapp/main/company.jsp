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
				<h1><s:text name="it.ecomweb.page.title.company"/></h1>
			</div>
			<div id="content-body">
					<div class="subcolumn1-1" id="content-text">
						<h2><s:text name="it.ecomweb.page.company.text1"/></h2><br>
						<p><s:text name="it.ecomweb.page.company.text2"/></p>
						<br><img src="<s:property value="#imagePath"/>/Under-construction.png">
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