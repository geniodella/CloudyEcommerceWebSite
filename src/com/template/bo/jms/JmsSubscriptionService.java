package com.template.bo.jms;


public interface JmsSubscriptionService {
	
	public void sendSubscriptionEmail(String code, String emailAddress);

}
