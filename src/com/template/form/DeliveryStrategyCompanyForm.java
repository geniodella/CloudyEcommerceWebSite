package com.template.form;

import java.util.HashMap;

public class DeliveryStrategyCompanyForm {
	
	HashMap<Long,DeliveryStrategyForm> deliveryStrategies;
	
	public HashMap<Long, DeliveryStrategyForm> getDeliveryStrategies() {
		return deliveryStrategies;
	}

	public void setDeliveryStrategies(
			HashMap<Long, DeliveryStrategyForm> deliveryStrategies) {
		this.deliveryStrategies = deliveryStrategies;
	}


	private String deliveryCompanyName;

	public String getDeliveryCompanyName() {
		return deliveryCompanyName;
	}

	public void setDeliveryCompanyName(String deliveryCompanyName) {
		this.deliveryCompanyName = deliveryCompanyName;
	}
	
	
	public DeliveryStrategyCompanyForm(){
		deliveryStrategies = new HashMap<Long, DeliveryStrategyForm>();
	}
	
	

}
