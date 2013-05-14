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
		<br>
		<div id="content">
			<div id="content-header">
				<h1><s:text name="it.ecomweb.page.title.download"/></h1>
			</div>
			
			<div id="content-body">
					<div class="subcolumn1-2" id="content-text" style="height:390px;">
						<h2><s:text name="it.ecomweb.page.download.text1"/></h2>
						<p><s:text name="it.ecomweb.page.download.text2"/></p>
						<p><s:text name="it.ecomweb.page.download.text3"/></p>
						<p><s:text name="it.ecomweb.page.download.text4"/></p>
						<br><br>
						<h2><s:text name="it.ecomweb.page.download.text8"/></h2>
						<p><s:text name="it.ecomweb.page.download.text9"/></p>
						<p><s:text name="it.ecomweb.page.download.text10"/></p>
						<p><s:text name="it.ecomweb.page.download.text11"/></p>
					</div>
				
					<div class="subcolumn2-2" id="content-text" style="height:390px;">
					
						<s:if test="%{secondAccess}">
							<h2><s:text name="it.ecomweb.page.download.text13"/></h2>
							<p><s:text name="it.ecomweb.page.download.text14"/></p>							
							<p><s:text name="it.ecomweb.page.download.text15"/></p>
						</s:if>
						<s:else>
							<h2><s:text name="it.ecomweb.page.download.text6"/></h2>
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
							<s:form name="freeDownloadForm" action="main/freeDownloadRequest" method="post" enctype="multipart/form-data">
								<s:textfield key="it.ecomweb.page.download.form.firstName.label" name="trace.firstName" size="39" />
								<s:textfield key="it.ecomweb.page.download.form.lastName.label" name="trace.lastName" size="39" />
								<s:textfield key="it.ecomweb.page.download.form.email.label" name="trace.mail" size="39" />
								<s:select key="it.ecomweb.page.download.form.product.label" name="productId" list="productList" headerValue="%{getText('it.ecomweb.select.default.label')}" headerKey="default" listValue="label" listKey="productId"/>
								
								<s:textfield key="it.ecomweb.page.download.form.capcha.label" name="answer" size="39" />
								<s:submit type="submit" key="it.ecomweb.button.download.label"/>
								<s:hidden name="secondAccess" value="true"/>
								<tr><td height="10"></td></tr>
								<tr><td class="tdLabel" colspan="2"><s:text name="it.ecomweb.page.download.form.capchaCode.label"/></td></tr>
								<tr><td class="tdLabel" colspan="2"><img src="/EComWeb/stickyImg"/></td></tr>
							</s:form>
						</s:else>
					</div>
					
					<div class="subcolumn1-1" id="content-text">
						<a name="compareProduct"></a>
						<h2><s:text name="it.ecomweb.page.download.text7"/></h2><br>
						<p><img src="<s:property value="#imagePath"/>/Under-construction.png"></p>
					</div>
				</div>
			</div>
			<div id="content-footer">
				<a href="https://www.paypal.com/it/mrb/pal=9GUSU3SCTGKWU" target="_blank"><img src="<s:property value="#imagePath"/>/bnr_paypal_mrb_banner_468wx60h.gif" alt="%{getText('it.ecomweb.global.paypal.subscription')}" border="0"></a>
			</div>
		</div>
		<%@ include file="/include/footerLayout.jsp" %>
	</div>
</body>