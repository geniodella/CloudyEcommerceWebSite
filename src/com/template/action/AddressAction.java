package com.template.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.LocationService;
import com.template.bo.address.AddressService;
import com.template.bo.customer.CustomerService;
import com.template.bo.virtualCart.VirtualCartService;
import com.template.form.AddressForm;
import com.template.vo.AddressVO;
import com.template.vo.CityVO;
import com.template.vo.CustomerVO;
import com.template.vo.OrderVO;
import com.template.vo.RegionVO;
import com.template.vo.StateVO;
import com.template.vo.VirtualCartVO;


public class AddressAction extends ActionSupport{
	
	AddressService addressServiceBean;
	LocationService locationServiceBean;
	VirtualCartService virtualCartServiceBean;
	
	private String message;
	
	private Integer addressId;
	
	
	



	public Integer getAddressId() {
		return addressId;
	}



	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}



	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public VirtualCartService getVirtualCartServiceBean() {
		return virtualCartServiceBean;
	}



	public void setVirtualCartServiceBean(VirtualCartService virtualCartServiceBean) {
		this.virtualCartServiceBean = virtualCartServiceBean;
	}



	public LocationService getLocationServiceBean() {
		return locationServiceBean;
	}



	public void setLocationServiceBean(LocationService locationServiceBean) {
		this.locationServiceBean = locationServiceBean;
	}



	public CustomerService getCustomerServiceBean() {
		return customerServiceBean;
	}



	public void setCustomerServiceBean(CustomerService customerServiceBean) {
		this.customerServiceBean = customerServiceBean;
	}



	CustomerService customerServiceBean;
	
	private List<AddressForm> addressList;
	
	
	
	




	public List<AddressForm> getAddressList() {
		return addressList;
	}



	public void setAddressList(List<AddressForm> addressList) {
		this.addressList = addressList;
	}



	public AddressService getAddressServiceBean() {
		return addressServiceBean;
	}



	public void setAddressServiceBean(AddressService addressServiceBean) {
		this.addressServiceBean = addressServiceBean;
	}



	public int getStateId() {
		return stateId;
	}



	public void setStateId(int stateId) {
		this.stateId = stateId;
	}



	private int stateId;
	






	public int getRegionId() {
		return regionId;
	}



	public void setRegionId(int regionId) {
		this.regionId = regionId;
	}



	public int getCityId() {
		return cityId;
	}



	public void setCityId(int cityId) {
		this.cityId = cityId;
	}



	public String getStreet() {
		return street;
	}



	public void setStreet(String street) {
		this.street = street;
	}



	public String getPhoneNumber() {
		return phoneNumber;
	}



	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}



	public String getFullname() {
		return fullname;
	}



	public void setFullname(String fullname) {
		this.fullname = fullname;
	}



	public String getPoBox() {
		return poBox;
	}



	public void setPoBox(String poBox) {
		this.poBox = poBox;
	}

	
	public boolean isSuccess() {
		return success;
	}



	public void setSuccess(boolean success) {
		this.success = success;
	}



	private boolean success;


	private int regionId; 
	private int cityId; 
	
	private String street;
	
	private String phoneNumber;
	
	private String fullname;
	
	private String poBox;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public String  retrieveByCustomer(){
		
		
		HttpSession  session = ServletActionContext.getRequest().getSession(false);

		Integer customerId = (Integer)session.getAttribute("customerVO");
		
		VirtualCartVO virtualCartVO = (VirtualCartVO) session.getAttribute("virtualCartVO");
		
		CustomerVO customerVO = customerServiceBean.findCustomerById(customerId);
		
		addressList = addressServiceBean.retrieveAddressesByCustomer(customerVO);
		
		virtualCartServiceBean.refreshVirtualCart(virtualCartVO);
		
		OrderVO orderVO = virtualCartServiceBean.lockProductQuantities(customerVO, virtualCartVO);
		
		session.setAttribute("orderVO",orderVO);
		
		success = true;
		
		return "retrieveByCustomer";
	}
	
	
	
	public String execute() {
		
		HttpSession  session = ServletActionContext.getRequest().getSession(false);

		Integer customerId = (Integer)session.getAttribute("customerVO");
		
	
		
		CustomerVO customerVO = customerServiceBean.findCustomerById(customerId);
		
	
		
		AddressVO addressVO = new AddressVO();
		
		StateVO stateVO=locationServiceBean.findStateById(stateId);
		RegionVO regionVO=locationServiceBean.findRegionById(regionId);
		CityVO cityVO=locationServiceBean.findCityById(cityId);
		
		
		addressVO.setStateVO(stateVO);
		addressVO.setRegionVO(regionVO);
		addressVO.setCityVO(cityVO);
		
		
		addressVO.setPoBox(poBox);
		
		addressVO.setCustomerVO(customerVO);
		
		addressVO.setFullname(fullname);
		
		addressVO.setPhoneNumber(phoneNumber);
		
		addressVO.setStreet(street);
		
		 addressId= addressServiceBean.insertAddressVO(addressVO,customerVO);
		
		if (customerVO.isAnonymous()){
			message = "true";
			session.setAttribute("addressVO",addressId);
		}

		success = true;
	
			return "success";
		
	}
	
	public String remove(){
				
		
						
		addressServiceBean.removeAddressVO(addressId);
		
		return "remove";
	}

}
