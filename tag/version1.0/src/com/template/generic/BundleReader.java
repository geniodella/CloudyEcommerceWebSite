package com.template.generic;

import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class BundleReader {
	
	
	
	public ResourceBundle getBundle(){
		
HttpServletRequest request = ServletActionContext.getRequest();
		
		URL url = null;
		try {
			url = new URL(request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+Const.BUNDLE_FOLDER);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		URL[] urls = {url};
		
		URLClassLoader urlClassLoader = new URLClassLoader(urls);
		
		ResourceBundle rb = ResourceBundle.getBundle("Application",ServletActionContext.getRequest().getLocale(),urlClassLoader);
		
		
		return rb;
	}

}
