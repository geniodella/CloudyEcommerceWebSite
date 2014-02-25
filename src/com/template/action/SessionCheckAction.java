package com.template.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.customer.CustomerService;
import com.template.vo.CustomerVO;

public class SessionCheckAction extends ActionSupport{
	
	public CustomerService getCustomerServiceBean() {
		return customerServiceBean;
	}



	public void setCustomerServiceBean(CustomerService customerServiceBean) {
		this.customerServiceBean = customerServiceBean;
	}



	CustomerService customerServiceBean;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	boolean success;
	
	
	
	public boolean isSuccess() {
		return success;
	}



	public void setSuccess(boolean success) {
		this.success = success;
	}



	public String execute(){
		
		
		
		
		HttpSession session = ServletActionContext.getRequest().getSession(false);
	
		
		
		if(null!=session){
			Integer customerId = (Integer)session.getAttribute("customerVO");
		
		CustomerVO customerVO = customerServiceBean.findCustomerById(customerId);
		
		if(customerVO.isAnonymous()){
			success = false;	
		}else
			success = true;
		}
		else
			success = false;
		
		return "success";
	}

}
