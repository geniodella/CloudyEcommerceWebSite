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
				<h1><s:text name="it.ecomweb.page.title.error"/></h1>
			</div>
			<div id="content-body">
					<div class="subcolumn1-1" id="content-text">
						<h2>ERRORE IMPREVISTO</h2><br>
						<p>Si � verificato un errore imprevisto nel sistema</p>
					</div>
					
				</div>
			
			</div>
			
			<div id="content-footer">
				<a href="https://www.paypal.com/it/mrb/pal=9GUSU3SCTGKWU" target="_blank"><img src="<s:property value="#imagePath"/>/bnr_paypal_mrb_banner_468wx60h.gif" alt="Registrati gratuitamente a PayPal e comincia subito ad accettare pagamenti con carta di credito." border="0"></a><!-- End PayPal Logo -->
			</div>
		</div>
	</div>
	<%@ include file="/include/footerLayout.jsp" %>
</body>