package com.template.form;

import java.io.Serializable;
import java.math.BigDecimal;

public class ReviewPriceForm implements Serializable{
	
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	

	public BigDecimal getShippingPrice() {
		return shippingPrice;
	}

	public void setShippingPrice(BigDecimal shippingPrice) {
		this.shippingPrice = shippingPrice;
	}

	public BigDecimal getPartialPrice() {
		return partialPrice;
	}

	public void setPartialPrice(BigDecimal partialPrice) {
		this.partialPrice = partialPrice;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public BigDecimal getTotalPriceWithTaxes() {
		return totalPriceWithTaxes;
	}

	public void setTotalPriceWithTaxes(BigDecimal totalPriceWithTaxes) {
		this.totalPriceWithTaxes = totalPriceWithTaxes;
	}

	public BigDecimal getShippingCosts() {
		return shippingCosts;
	}

	public void setShippingCosts(BigDecimal shippingCosts) {
		this.shippingCosts = shippingCosts;
	}

	private BigDecimal shippingPrice;
	
	private BigDecimal partialPrice;
	
	private BigDecimal totalPrice;
	
	private BigDecimal totalPriceWithTaxes;
	
	private BigDecimal shippingCosts;
	
	
	

}
