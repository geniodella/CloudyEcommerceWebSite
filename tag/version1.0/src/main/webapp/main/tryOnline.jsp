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
							<p><a href="<s:url action="main/tryOnlineRedirect"><s:param name="secondAccess" value="true"/></s:url>">BOTTONE ACCESSO ONLINE</a></p>						
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
				<a href="https://www.paypal.com/it/mrb/pal=9GUSU3SCTGKWU" target="_blank"><img src="<s:property value="#imagePath"/>/bnr_paypal_mrb_banner_468wx60h.gif" alt="%{getText('it.ecomweb.global.paypal.subscription')}" border="0"></a>
			</div>
		</div>
		<%@ include file="/include/footerLayout.jsp" %>
	</div>
</body>