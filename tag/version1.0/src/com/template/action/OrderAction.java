package com.template.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.customer.CustomerService;
import com.template.bo.deliveryCompany.DeliveryCompanyService;
import com.template.bo.order.OrderService;
import com.template.form.AddressForm;
import com.template.form.DeliveryStrategyForm;
import com.template.form.ReviewPriceForm;
import com.template.form.ShippingForm;
import com.template.vo.AddressVO;
import com.template.vo.CustomerVO;
import com.template.vo.OrderVO;
import com.template.vo.VirtualCartVO;

public class OrderAction extends ActionSupport{
	
	


	


	DeliveryStrategyForm deliveryCompanyForm;
	
	CustomerService customerServiceBean;
	
	
	
	public CustomerService getCustomerServiceBean() {
		return customerServiceBean;
	}


	public void setCustomerServiceBean(CustomerService customerServiceBean) {
		this.customerServiceBean = customerServiceBean;
	}


	List<ShippingForm> shippings;
	
	List<ReviewPriceForm> summaryOrderList;
	
	private BigDecimal totalAmount;
	

	
	public BigDecimal getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}


	public List<ReviewPriceForm> getSummaryOrderList() {
		return summaryOrderList;
	}


	public void setSummaryOrderList(List<ReviewPriceForm> summaryOrderList) {
		this.summaryOrderList = summaryOrderList;
	}


	public List<ShippingForm> getShippings() {
		return shippings;
	}


	public void setShippings(List<ShippingForm> shippings) {
		this.shippings = shippings;
	}

 


	public long getOrderId() {
		return orderId;
	}


	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}


	private long orderId;
	
	private boolean success = true;
	
	
	public boolean isSuccess() {
		return success;
	}


	public void setSuccess(boolean success) {
		this.success = success;
	}


	public List<DeliveryStrategyForm> getDeliveryStrategyList() {
		return deliveryStrategyList;
	}


	public void setDeliveryStrategyList(
			List<DeliveryStrategyForm> deliveryStrategyList) {
		this.deliveryStrategyList = deliveryStrategyList;
	}


	List<DeliveryStrategyForm> deliveryStrategyList;
	
	public DeliveryStrategyForm getDeliveryCompanyForm() {
		return deliveryCompanyForm;
	}


	public void setDeliveryCompanyForm(DeliveryStrategyForm deliveryCompanyForm) {
		this.deliveryCompanyForm = deliveryCompanyForm;
	}


	public DeliveryCompanyService getDeliveryCompanyServiceBean() {
		return deliveryCompanyServiceBean;
	}


	public void setDeliveryCompanyServiceBean(
			DeliveryCompanyService deliveryCompanyServiceBean) {
		this.deliveryCompanyServiceBean = deliveryCompanyServiceBean;
	}


	DeliveryCompanyService deliveryCompanyServiceBean;
	
	
	
	
	public List<AddressForm> getAddressList() {
		return addressList;
	}
	public void setAddressList(List<AddressForm> addressList) {
		this.addressList = addressList;
	}


	private AddressForm addressForm;
	
	private List<AddressForm> addressList;
	
	public AddressForm getAddressForm() {
		return addressForm;
	}
	public void setAddressForm(AddressForm addressForm) {
		this.addressForm = addressForm;
	}


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	OrderService orderServiceBean;
	public OrderService getOrderServiceBean() {
		return orderServiceBean;
	}
	public void setOrderServiceBean(OrderService orderServiceBean) {
		this.orderServiceBean = orderServiceBean;
	}
	
	
	
	public String prepareReview(){
		
		summaryOrderList = new ArrayList<ReviewPriceForm>();
		
		HttpSession  session = ServletActionContext.getRequest().getSession(false);
		
		shippings = (List<ShippingForm>)session.getAttribute("shippings");
		
		Integer deliveryStrategyId = (Integer)session.getAttribute("deliveryStrategyId");
		
		VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
		
		ReviewPriceForm review = orderServiceBean.prepareOrderReview(shippings, deliveryStrategyId, virtualCartVO.getVirtualCartProductRelations());
		
		session.setAttribute("orderReview", review);
		
		summaryOrderList.add(review);
		
		return "prepareReview";
	}
	
	
	public String create(){
		
		
		
		HttpSession  session = ServletActionContext.getRequest().getSession(false);
		
		Integer customerId = (Integer)session.getAttribute("customerVO");
		
		OrderVO orderVO = (OrderVO)session.getAttribute("orderVO");
		
		Integer deliveryStrategyId = (Integer)	session.getAttribute("deliveryStrategyId");
		
		Integer addressId = (Integer)session.getAttribute("address");
		
		shippings = (List<ShippingForm>)session.getAttribute("shippings");
		
		ReviewPriceForm review = (ReviewPriceForm)session.getAttribute("orderReview");
		
		totalAmount = review.getTotalPrice();
		
		orderVO = orderServiceBean.insertOrder(review,shippings,addressId,deliveryStrategyId, customerId, orderVO);
		
		orderId = orderVO.getOrderId();
		
		return "create";
	}
	
	
	public String cancel(){
		
	  orderServiceBean.cancelOrder(orderId);
		
		
		return "cancel";
	}
	
	
	public String addAddr(){
		
		addressForm = new AddressForm();
		
		addressList = new ArrayList<AddressForm>();		
		HttpSession  session = ServletActionContext.getRequest().getSession(false);
		
		Integer customerId = (Integer)session.getAttribute("customerVO");
		
		CustomerVO  customerVO = customerServiceBean.findCustomerById(customerId);
		
		Integer addressId = (Integer)session.getAttribute("address");
		
		Set<AddressVO> addresses = customerVO.getAddresses();
		
		for (AddressVO addressVO : addresses) {
			
			if (addressVO.getAddressId() == addressId){
				addressForm.setAddressId(addressVO.getAddressId());
				addressForm.setCityName(addressVO.getCityVO().getNameCity());
				addressForm.setFullname(addressVO.getFullname());
				addressForm.setPhoneNumber(addressVO.getPhoneNumber());
				addressForm.setPoBox(addressVO.getPoBox());
				addressForm.setRegionName(addressVO.getRegionVO().getNameRegion());
				addressForm.setStateName(addressVO.getStateVO().getNameState());
				addressForm.setStreet(addressVO.getStreet());
			}
			
		}
		
		addressList.add(addressForm);
		
		
		return "addAddr";
	}
	
	
	public String addShipping(){
		
	HttpSession  session = ServletActionContext.getRequest().getSession(false);
		
		Integer deliveryStrategyId = (Integer)session.getAttribute("deliveryStrategyId");
		
		
		deliveryStrategyList = new ArrayList<DeliveryStrategyForm>();
		
		deliveryCompanyForm = deliveryCompanyServiceBean.findDeliveryCompanyFormById(deliveryStrategyId);
		
		
		deliveryStrategyList.add(deliveryCompanyForm);
		
		return "addShipping";
	}
	
	
	
	

	

}
