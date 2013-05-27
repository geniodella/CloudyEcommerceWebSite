package com.template.form;

public class DeliveryStrategyForm {
	
	
	private long deliveryStrategyId;
	
	private String deliveryStrategyName;
	
	public long getDeliveryStrategyId() {
		return deliveryStrategyId;
	}

	public long getMinimumDeliveryRange() {
		return minimumDeliveryRange;
	}

	public void setMinimumDeliveryRange(long minimumDeliveryRange) {
		this.minimumDeliveryRange = minimumDeliveryRange;
	}

	public long getMaximumDeliveryRange() {
		return maximumDeliveryRange;
	}

	public void setMaximumDeliveryRange(long maximumDeliveryRange) {
		this.maximumDeliveryRange = maximumDeliveryRange;
	}

	public void setDeliveryStrategyId(long deliveryStrategyId) {
		this.deliveryStrategyId = deliveryStrategyId;
	}

	

	public String getDeliveryStrategyName() {
		return deliveryStrategyName;
	}

	public void setDeliveryStrategyName(String deliveryStrategyName) {
		this.deliveryStrategyName = deliveryStrategyName;
	}

	public String getDeliveryCompanyName() {
		return deliveryCompanyName;
	}

	public void setDeliveryCompanyName(String deliveryCompanyName) {
		this.deliveryCompanyName = deliveryCompanyName;
	}

	

	private String deliveryCompanyName;
	
	private long minimumDeliveryRange;
	
	private long maximumDeliveryRange;

}
