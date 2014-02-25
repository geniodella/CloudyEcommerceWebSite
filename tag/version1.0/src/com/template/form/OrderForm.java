package com.template.form;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.template.vo.CustomerVO;
import com.template.vo.ShippingVO;



public class OrderForm{
	
	
	public OrderForm(){
		products = new ArrayList<ProductDetails>();
	}

	private long orderId;
	private long paypalTransactionId;
	public List<ProductDetails> getProducts() {
		return products;
	}
	public void setProducts(List<ProductDetails> products) {
		this.products = products;
	}
	private Date productCreation;
	private BigDecimal totalPrice;
	private BigDecimal totalPriceWithTaxes;
	private CustomerVO customerVO;
	private List<ShippingVO> shippings;
	private boolean active;
	private String nameCustomer;
	private String lastNameCustomer;
	private List<ProductDetails> products;
	
	private Date minimumDeliveryDate;
	private Date maximumDeliveryDate;
	
	public Date getMinimumDeliveryDate() {
		return minimumDeliveryDate;
	}
	public void setMinimumDeliveryDate(Date minimumDeliveryDate) {
		this.minimumDeliveryDate = minimumDeliveryDate;
	}
	public Date getMaximumDeliveryDate() {
		return maximumDeliveryDate;
	}
	public void setMaximumDeliveryDate(Date maximumDeliveryDate) {
		this.maximumDeliveryDate = maximumDeliveryDate;
	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public long getPaypalTransactionId() {
		return paypalTransactionId;
	}
	public void setPaypalTransactionId(long paypalTransactionId) {
		this.paypalTransactionId = paypalTransactionId;
	}
	public Date getProductCreation() {
		return productCreation;
	}
	public void setProductCreation(Date productCreation) {
		this.productCreation = productCreation;
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
	public CustomerVO getCustomerVO() {
		return customerVO;
	}
	public void setCustomerVO(CustomerVO customerVO) {
		this.customerVO = customerVO;
	}
	public List<ShippingVO> getShippings() {
		return shippings;
	}
	public void setShippings(List<ShippingVO> shippings) {
		this.shippings = shippings;
	}
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public String getNameCustomer() {
		return nameCustomer;
	}
	public void setNameCustomer(String nameCustomer) {
		this.nameCustomer = nameCustomer;
	}
	public String getLastNameCustomer() {
		return lastNameCustomer;
	}
	public void setLastNameCustomer(String lastNameCustomer) {
		this.lastNameCustomer = lastNameCustomer;
	}
	
	
	

}