package com.template.form;

import com.template.vo.CustomerVO;
import com.template.vo.VirtualCartVO;

public class LoginFormVO {
	
	
	private CustomerVO customerVO;
	
	public CustomerVO getCustomerVO() {
		return customerVO;
	}

	public void setCustomerVO(CustomerVO customerVO) {
		this.customerVO = customerVO;
	}

	public VirtualCartVO getVirtualCartVO() {
		return virtualCartVO;
	}

	public void setVirtualCartVO(VirtualCartVO virtualCartVO) {
		this.virtualCartVO = virtualCartVO;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	private VirtualCartVO virtualCartVO;
	
	private int result;

}
