package com.template.form;

import java.io.Serializable;

public class SubscriptionForm implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	String activationCode;
	
	String emailAddress;

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

}
