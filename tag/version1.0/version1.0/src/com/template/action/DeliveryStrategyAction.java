package com.template.action;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.deliveryCompany.DeliveryCompanyService;
import com.template.form.DeliveryStrategyCompanyForm;
import com.template.form.ShippingForm;
import com.template.vo.VirtualCartVO;

public class DeliveryStrategyAction extends ActionSupport{
	
	
private boolean success = true;
	
	
	public boolean isSuccess() {
		return success;
	}


	public void setSuccess(boolean success) {
		this.success = success;
	}
	
	public int getDeliveryStrategyId() {
		return deliveryStrategyId;
	}


	public void setDeliveryStrategyId(int deliveryStrategyId) {
		this.deliveryStrategyId = deliveryStrategyId;
	}


	private int deliveryStrategyId;
	
	private int splittingDecision;



	public int getSplittingDecision() {
		return splittingDecision;
	}


	public void setSplittingDecision(int splittingDecision) {
		this.splittingDecision = splittingDecision;
	}


	HashMap<String,DeliveryStrategyCompanyForm> deliveryStrategyCompanies;
	
	
	public HashMap<String, DeliveryStrategyCompanyForm> getDeliveryStrategyCompanies() {
		return deliveryStrategyCompanies;
	}


	public void setDeliveryStrategyCompanies(
			HashMap<String, DeliveryStrategyCompanyForm> deliveryStrategyCompanies) {
		this.deliveryStrategyCompanies = deliveryStrategyCompanies;
	}


	public DeliveryCompanyService getDeliveryCompanyServiceBean() {
		return deliveryCompanyServiceBean;
	}


	public void setDeliveryCompanyServiceBean(
			DeliveryCompanyService deliveryCompanyServiceBean) {
		this.deliveryCompanyServiceBean = deliveryCompanyServiceBean;
	}

	
	public int getAddressId() {
		return addressId;
	}


	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	
	List<ShippingForm> shippings;

	public List<ShippingForm> getShippings() {
		return shippings;
	}


	public void setShippings(List<ShippingForm> shippings) {
		this.shippings = shippings;
	}


	private int addressId;

	DeliveryCompanyService deliveryCompanyServiceBean;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public String execute(){
		
		HttpSession  session = ServletActionContext.getRequest().getSession(false);
		
		VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
		
		session.setAttribute("address", new Integer(addressId));
		
		deliveryStrategyCompanies = deliveryCompanyServiceBean.getAllDeliveryCompanyVOs();
	
		
		return "success";
	}
	
	public String add(){
		
		HttpSession  session = ServletActionContext.getRequest().getSession(false);
		
		VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
		
		shippings = deliveryCompanyServiceBean.splitShipping(virtualCartVO.getVirtualCartProductRelations(),splittingDecision);
		
		session.setAttribute("deliveryStrategyId", new Integer(deliveryStrategyId));
		
		
		session.setAttribute("shippings", shippings);
		
		return "add";
	}
	
	public String checkSplit(){
		
	HttpSession  session = ServletActionContext.getRequest().getSession(false);
		
		VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
		
	
		
		shippings = deliveryCompanyServiceBean.checkSplitShipping(virtualCartVO.getVirtualCartProductRelations());
		
		session.setAttribute("shippings", shippings);
		
		
		
		return "checkSplit";
	}

}
