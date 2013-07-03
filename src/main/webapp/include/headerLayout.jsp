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
<div id="header">
	<div id="header-logo">
  		<a href="<s:property value="#pagePath" />/main/index.action"><h1><img height="80" width="198" src="<s:property value="#imagePath" />/logo.jpg"></h1></a>
  	</div>
  	
    <div id="header-menu">
	    <div id="header-menu-box"><a href="<s:property value="#pagePath" />/main/index.action"><s:text name="it.ecomweb.page.menu.index"/><br><img height="50" width="50" style="margin-top:5px" class="rollover" src="<s:property value="#imagePath"/>/home_off.png"></a></div>
	    <div id="header-menu-box"><a href="<s:property value="#pagePath" />/main/company.action"><s:text name="it.ecomweb.page.menu.company"/><br><br><img height="50" width="50" style="margin-top:5px" class="rollover" src="<s:property value="#imagePath"/>/company_off.png"></a></div>
    <!--    <div id="header-menu-box"><a href="<s:property value="#pagePath" />/main/download.action"><s:text name="it.ecomweb.page.menu.download"/><br><br><img height="50" width="50" class="rollover" src="<s:property value="#imagePath"/>/download_off.png"></a></div>  -->
	  <div id="header-menu-box"><a href="<s:property value="#pagePath" />/main/buy.action"><s:text name="it.ecomweb.page.menu.buy"/><br><br><img height="50" width="50" style="margin-top:5px" class="rollover" src="<s:property value="#imagePath"/>/buy_off.png"></a></div>
		<div id="header-menu-box"><a href="<s:property value="#pagePath" />/main/support.action"><s:text name="it.ecomweb.page.menu.support"/><br><br><img height="50" width="50" style="margin-top:5px" class="rollover" src="<s:property value="#imagePath"/>/support_off.png"></a></div>
	    <div id="header-menu-box"><a href="<s:property value="#pagePath" />/main/docs.action"><s:text name="it.ecomweb.page.menu.docs"/><br><br><img height="50" width="50" style="margin-top:5px" class="rollover" src="<s:property value="#imagePath"/>/docs_off.png"></a></div>
		<div id="contact-form"><s:text name="it.ecomweb.page.menu.tryOnline"/><br><img height="50" width="50" style="margin-top:5px" class="rollover" src="<s:property value="#imagePath"/>/try_off.png"></div>
  	</div>
</div>