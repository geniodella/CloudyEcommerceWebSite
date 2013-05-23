/**
 * Title: NextControlPanel
 * Description: NextControlPanel
 * Copyright: Copyright (c) 2008
 * Company: Xaltia s.p.a.
 * 
 * @author Enrico Cesaretti
 * @version 1.0
 */
package com.template.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class BaseActionSupport extends ActionSupport {
	
	private static final long serialVersionUID = 3738175828140911393L;
	
	private static Logger logger = Logger.getLogger(BaseActionSupport.class);
	
	
	protected final String SUCCESS = "success";
	
	// VARIABILI PER REPORTISTICA
	protected Map<String,String> xlsParamMap = new HashMap<String,String>();
	protected Map<String,List<List<Object>>> xlsValueListMap = new HashMap<String,List<List<Object>>>();
	protected List<List<Object>> xlsDynamicRecord = new ArrayList<List<Object>>();
	protected String xlsFileName;
	

	private String topTitle;
	private String sendParam;
	

	protected HttpServletRequest request;
	protected HttpServletResponse response;
	
	protected Locale locale;
	
	public Locale getLocale() {
		return locale;
	}

	public void setLocale(Locale locale) {
		this.locale = locale;
	}

	
	public void prepare() throws Exception {
		if(logger.isInfoEnabled())logger.info("prepare()");
		/*
		user = (User)ServletActionContext.getRequest().getSession().getAttribute(LoginInterceptor.USER_HANDLE);
		if(logger.isDebugEnabled())logger.debug("User action for: "+user);
		
		if (user == null) throw new LoginException();
		
		if(user!=null) 
		{
			Set<Role> roles = user.getRoles();
			if(logger.isDebugEnabled())logger.debug("Role verification: "+roles);
			
			for(Role role : roles) {
				if(userRole!=null) {
					if(role.getPriority()<userRole.getPriority()) {
						if(logger.isDebugEnabled())logger.debug("priority: "+role.getPriority());
						userRole = role;
					}else {
						if(logger.isDebugEnabled())logger.debug("nessuna sostituzione");
					}
				}else {
					if(logger.isDebugEnabled())logger.debug("priority: "+role.getPriority());
					userRole = role;
				}
			}
			if(logger.isDebugEnabled())logger.debug("User "+user.getUsername()+" is member of "+userRole.getRole());
			
			ServletActionContext.getRequest().getSession().setAttribute("USER_ROLE", userRole);
		}/**/
			
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();

		Locale.setDefault(new Locale("it","IT"));
		locale = request.getLocale();
	
	}
	
	/*
	protected void traceAction(UserAction action, String params){
		UsersLogAction logAction = new UsersLogAction(((Users)ServletActionContext.getRequest().getSession().getAttribute(LoginInterceptor.USER_HANDLE)).getId(), null, new Date(), action.name(), params);
		UsersLogActionManager.insert(logAction);
		if (logger.isInfoEnabled()) logger.info("log azione: "+logAction);
	}/**/


	
	//ACCESSORI
	
	

	public String getTopTitle() {
		return topTitle;
	}

	
	


	public void setTopTitle(String topTitle) {
		this.topTitle = topTitle;
	}

	public String getSendParam() {
		return sendParam;
	}

	public void setSendParam(String sendParam) {
		this.sendParam = sendParam;
	}

	public String getXlsFileName() {
		return xlsFileName;
	}

	public void setXlsFileName(String xlsFileName) {
		this.xlsFileName = xlsFileName;
	}

	public Map<String, String> getXlsParamMap() {
		return xlsParamMap;
	}

	public void setXlsParamMap(Map<String, String> xlsParamMap) {
		this.xlsParamMap = xlsParamMap;
	}

	public Map<String, List<List<Object>>> getXlsValueListMap() {
		return xlsValueListMap;
	}

	public void setXlsValueListMap(Map<String, List<List<Object>>> xlsValueListMap) {
		this.xlsValueListMap = xlsValueListMap;
	}

	public List<List<Object>> getXlsDynamicRecord() {
		return xlsDynamicRecord;
	}

	public void setXlsDynamicRecord(List<List<Object>> xlsDynamicRecord) {
		this.xlsDynamicRecord = xlsDynamicRecord;
	}



	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	
	
	
}
