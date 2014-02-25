package com.template.bo.customer;

import java.util.List;

import com.template.form.LoginFormVO;
import com.template.vo.CustomerVO;
import com.template.vo.UtenteVO;

public interface CustomerService {
	
	CustomerVO findCustomerById(int id);

	public void insertCustomerVO(final String mail, String username,String password);

	void updateCustomerVO(CustomerVO customerVO);

	List<CustomerVO> getAllCustomerVOs(int size, int page);
	
	public CustomerVO insertAnonymousCustomer();
	
	
	List<CustomerVO> getAllCustomerVOs();

	void removeCustomerVO(CustomerVO customerVO);
	
	public LoginFormVO makeLogin(String username, String password);
	
	
	public void refreshCustomerVO(CustomerVO customerVO);
	
	public void activateCustomer(String activationCode);
	
	public UtenteVO findUtenteVObyEmail(String mail); 
}
