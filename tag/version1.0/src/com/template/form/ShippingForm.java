package com.template.form;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ShippingForm implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private BigDecimal shippingPrice;
	
	public BigDecimal getShippingPrice() {
		return shippingPrice;
	}


	public void setShippingPrice(BigDecimal shippingPrice) {
		this.shippingPrice = shippingPrice;
	}

	private String shippingName;
	
	private Date beginDeliveryTime;
	
	public Date getBeginDeliveryTime() {
		return beginDeliveryTime;
	}


	public void setBeginDeliveryTime(Date beginDeliveryTime) {
		this.beginDeliveryTime = beginDeliveryTime;
	}

	private Date endDeliveryTime;
	
	public Date getEndDeliveryTime() {
		return endDeliveryTime;
	}


	public void setEndDeliveryTime(Date endDeliveryTime) {
		this.endDeliveryTime = endDeliveryTime;
	}


	public String getShippingName() {
		return shippingName;
	}


	public void setShippingName(String shippingName) {
		this.shippingName = shippingName;
	}


	public ShippingForm(){
		
		products = new ArrayList<ProductDetails>();
	}


	

	public List<ProductDetails> getProducts() {
		return products;
	}

	public void setProducts(List<ProductDetails> products) {
		this.products = products;
	}

	private List<ProductDetails> products;
	
	private String firstNameCustomer;
	private String lastNameCustomer;
	private String street;
	private String nameCity;
	private String nameRegion;
	private String nameState;
	private String nameDelivery;
	private String deliveryCompanyName;
	private String deliveryStrategyName;
	private BigDecimal totalPrice;	
	private BigDecimal totalPriceWithTaxes;
	private String beginDateFormatted; 
	private String endDateFormatted;
	
	public String getFirstNameCustomer() {
		return firstNameCustomer;
	}


	public void setFirstNameCustomer(String firstNameCustomer) {
		this.firstNameCustomer = firstNameCustomer;
	}


	public String getLastNameCustomer() {
		return lastNameCustomer;
	}


	public void setLastNameCustomer(String lastNameCustomer) {
		this.lastNameCustomer = lastNameCustomer;
	}


	public String getStreet() {
		return street;
	}


	public void setStreet(String street) {
		this.street = street;
	}


	public String getNameCity() {
		return nameCity;
	}


	public void setNameCity(String nameCity) {
		this.nameCity = nameCity;
	}


	public String getNameRegion() {
		return nameRegion;
	}


	public void setNameRegion(String nameRegion) {
		this.nameRegion = nameRegion;
	}


	public String getNameState() {
		return nameState;
	}


	public void setNameState(String nameState) {
		this.nameState = nameState;
	}


	public String getNameDelivery() {
		return nameDelivery;
	}


	public void setNameDelivery(String nameDelivery) {
		this.nameDelivery = nameDelivery;
	}


	public String getDeliveryCompanyName() {
		return deliveryCompanyName;
	}


	public void setDeliveryCompanyName(String deliveryCompanyName) {
		this.deliveryCompanyName = deliveryCompanyName;
	}


	public String getDeliveryStrategyName() {
		return deliveryStrategyName;
	}
	public void setDeliveryStrategyName(String deliveryStrategyName) {
		this.deliveryStrategyName = deliveryStrategyName;
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


	public String getBeginDateFormatted() {
		return beginDateFormatted;
	}


	public void setBeginDateFormatted(String beginDateFormatted) {
		this.beginDateFormatted = beginDateFormatted;
	}


	public String getEndDateFormatted() {
		return endDateFormatted;
	}


	public void setEndDateFormatted(String endDateFormatted) {
		this.endDateFormatted = endDateFormatted;
	}

	
	
}
