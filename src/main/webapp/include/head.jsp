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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@page import="com.opensymphony.xwork2.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Enterprise Commerce</title>
	<%
		String pageRoot = request.getContextPath();
		String locale = request.getLocale().toString();
		pageContext.setAttribute("pageRoot", pageRoot);
		ActionContext.getContext().put("pageRoot", pageRoot);
		pageContext.setAttribute("locale", locale);
		ActionContext.getContext().put("locale", locale);
	%>
	<s:set name="pagePath" value="%{#pageRoot}" />
	<s:set name="imagePath" value="%{#pageRoot + '/res_img'}" />
	<s:set name="buttonImagePath" value="%{#pageRoot + '/res_img/' + #locale}" />

	<s:set name="uploadPath" value="%{#pageRoot + '/res_upload'}" />
	<s:set name="downloadPath" value="%{#pageRoot + '/res_download'}" />

	<s:set name="profileUploadPath" value="%{#pageRoot + '/res_upload/profile/images'}" />

	<s:set name="imagesNewsLetterUploadPath" value="%{#pageRoot + '/res_upload/newsletter/images'}" />

	<s:set name="imagesMediaUploadPath" value="%{#pageRoot + '/res_upload/multimedia/images'}" />
	<s:set name="videoMediaUploadPath" value="%{#pageRoot + '/res_upload/multimedia/videos'}" />
	<s:set name="miscellaneusMediaUploadPath" value="%{#pageRoot + '/res_upload/multimedia/miscellaneus'}" />

	<s:set name="imagesEcomUploadPath" value="%{#pageRoot + '/res_upload/ecommerce/images'}" />
	<s:set name="videoEcomUploadPath" value="%{#pageRoot + '/res_upload/ecommerce/videos'}" />
	<s:set name="miscellaneusEcomUploadPath" value="%{#pageRoot + '/res_upload/ecommerce/miscellaneus'}" />

	<s:set name="cssPath" value="%{#pageRoot + '/res_css'}" />
	<s:set name="jsPath" value="%{#pageRoot + '/res_js'}" />


	<script type="text/javascript" src="<s:property value="#jsPath"/>/jquery/jquery-1.3.1.min.js"></script>
	<script type="text/javascript" src="<s:property value="#jsPath"/>/jquery/jquery.ui.all.js"></script>
	<script type="text/javascript" src="<s:property value="#jsPath"/>/jquery/jquery.tooltip.js"></script>
	<script type="text/javascript" src="<s:property value="#jsPath"/>/jquery/jquery.autocomplete.js"></script>
	<script type="text/javascript" src="<s:property value="#jsPath"/>/ecommerce/global/windowOnload.js"></script>
	
	<script type="text/javascript" src="<s:property value="#jsPath"/>/ecommerce/jquery/admin.jquery.js"></script>


</head>