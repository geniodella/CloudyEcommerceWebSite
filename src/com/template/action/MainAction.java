package com.template.action;

import org.apache.log4j.Logger;

public class MainAction extends BaseActionSupport {
	private static final long serialVersionUID = 3989526300723557410L;

	private static Logger logger = Logger.getLogger(MainAction.class);


	
	// Page resources
	private boolean secondAccess;
	private String answer;
	private int productId;
	
	private String tryOnlineUrl;
	


	// Select

	// ACTIONS
	public String index() throws Exception {
		if (logger.isInfoEnabled())logger.info("index()");
		return SUCCESS;
	}

	public String company() throws Exception {
		if (logger.isInfoEnabled())logger.info("company()");
		return SUCCESS;
	}

	public String buy() throws Exception {
		if (logger.isInfoEnabled())logger.info("buy()");
		return SUCCESS;
	}

	



	public String product() throws Exception {
		if (logger.isInfoEnabled())logger.info("product()");
		return SUCCESS;
	}

	public String tryOnline() throws Exception {
		if (logger.isInfoEnabled()) logger.info("tryOnline()");
		return SUCCESS;
	}
	

	

	
	public String support() throws Exception {
		if (logger.isInfoEnabled())logger.info("support()");
		return SUCCESS;
	}

	public String docs() throws Exception {
		if (logger.isInfoEnabled())logger.info("docs()");
		return SUCCESS;
	}



	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnswer() {
		return answer;
	}

	public boolean isSecondAccess() {
		return secondAccess;
	}

	public void setSecondAccess(boolean secondAccess) {
		this.secondAccess = secondAccess;
	}

	

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductId() {
		return productId;
	}

	public void setTryOnlineUrl(String tryOnlineUrl) {
		this.tryOnlineUrl = tryOnlineUrl;
	}

	public String getTryOnlineUrl() {
		return tryOnlineUrl;
	}

}