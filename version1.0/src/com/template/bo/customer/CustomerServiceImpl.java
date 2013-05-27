package com.template.bo.customer;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.template.bo.jms.JmsSubscriptionService;
import com.template.bo.virtualCart.VirtualCartService;
import com.template.dao.credentials.CredentialsDao;
import com.template.dao.customer.CustomerDao;
import com.template.form.LoginFormVO;
import com.template.generic.EmailSender;
import com.template.vo.CredentialsVO;
import com.template.vo.CustomerVO;
import com.template.vo.VirtualCartVO;

public class CustomerServiceImpl implements CustomerService {
	
	CustomerDao customerDao;
	
	CredentialsDao credentialsDao;
	
	VirtualCartService virtualCartServiceBean;





	


    JmsSubscriptionService jmsSubscriptionServiceBean;

	


	public JmsSubscriptionService getJmsSubscriptionServiceBean() {
		return jmsSubscriptionServiceBean;
	}

	public void setJmsSubscriptionServiceBean(
			JmsSubscriptionService jmsSubscriptionServiceBean) {
		this.jmsSubscriptionServiceBean = jmsSubscriptionServiceBean;
	}

	public VirtualCartService getVirtualCartServiceBean() {
		return virtualCartServiceBean;
	}

	public void setVirtualCartServiceBean(VirtualCartService virtualCartServiceBean) {
		this.virtualCartServiceBean = virtualCartServiceBean;
	}

	public CredentialsDao getCredentialsDao() {
		return credentialsDao;
	}

	public void setCredentialsDao(CredentialsDao credentialsDao) {
		this.credentialsDao = credentialsDao;
	}

	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	/**
	 * findCustomerById
	 * 
	 * @param id
	 *            int
	 * @return CustomerVO
	 * @todo Implement this org.annotationmvc.service.CustomerService method
	 */
	public CustomerVO findCustomerById(final int id) {
		return customerDao.findCustomerById(id);
	}

	/**
	 * getAllCustomerVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.CustomerService method
	 */
	public List<CustomerVO> getAllCustomerVOs(int size, int page) {
		return customerDao.getAllCustomerVOs(size,page);
	}
	
	
	/**
	 * getAllCustomerVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.CustomerService method
	 */
	public List<CustomerVO> getAllCustomerVOs() {
		return customerDao.getAllCustomerVOs();
	}

	/**
	 * insertCustomerVO
	 * 
	 * @param customerVO
	 *            CustomerVO
	 * @todo Implement this org.annotationmvc.service.CustomerService method
	 */
	public String insertCustomerVO(final CustomerVO customerVO, String username,String password) {
		
	MessageDigest messageDigest;
		
		byte[] hashedPassword = null;
		
		byte[] hashedActivationCode;
		try {
			messageDigest = MessageDigest.getInstance("SHA-256");
			
			hashedPassword = password.getBytes("UTF-8");
			
			
			hashedPassword =messageDigest.digest(hashedPassword);
			
			hashedActivationCode = messageDigest.digest(String.valueOf(Math.random()).getBytes());
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		
		BigInteger bigInt = new BigInteger(1,hashedPassword);
		String hashtext = bigInt.toString(16);
		
		BigInteger bigIntActivation = new BigInteger(1,hashedPassword);
		String hashtextActivation = bigIntActivation.toString(16);
		
		CredentialsVO credentialsVO = new CredentialsVO();
		
		credentialsVO.setUsername(username);
		
		credentialsVO.setPassword(hashtext);
		
		
		credentialsDao.insertCredentialsVO(credentialsVO);
		
	
		
		
		
		customerVO.setCredentials(credentialsVO);
		
		customerVO.setActivation(false);
		
		customerVO.setActivationCode(hashtextActivation);
		
		VirtualCartVO virtualCartVO = new VirtualCartVO();
		
		virtualCartServiceBean.insertVirtualCartVO(virtualCartVO);
		
		customerVO.setVirtualCartVO(virtualCartVO);
		
		// check if the customer was already created as anonymous
		if (customerVO.getCustomerId() ==0)
		customerDao.insertCustomerVO(customerVO);
		else{
		
			customerDao.updateCustomerVO(customerVO);
		}
	
		
		jmsSubscriptionServiceBean.sendSubscriptionEmail(hashtextActivation, customerVO.getMail());
		

		
	
		
		return hashtextActivation;
		
		
	}
	
	
	public CustomerVO insertAnonymousCustomer(){
		
		
		CustomerVO customerVO = new CustomerVO();
		
		customerVO.setActivation(false);
		
		customerVO.setAnonymous(true);
		
	
		
		VirtualCartVO virtualCartVO = new VirtualCartVO();
		
		virtualCartServiceBean.insertVirtualCartVO(virtualCartVO);
		
		customerVO.setVirtualCartVO(virtualCartVO);
		
		customerDao.insertCustomerVO(customerVO);
		
		
		
		return customerVO;
		
	}

	/**
	 * removeCustomerVO
	 * 
	 * @param customerVO
	 *            CustomerVO
	 * @todo Implement this org.annotationmvc.service.CustomerService method
	 */
	public void removeCustomerVO(final CustomerVO customerVO) {
		customerDao.removeCustomerVO(customerVO);
	}
	
	
	public CustomerVO findCustomerVObyEmail(String mail){
		return customerDao.findCustomerVObyEmail(mail);
	}

	/**
	 * updateCustomerVO
	 * 
	 * @param customerVO
	 *            CustomerVO
	 * @todo Implement this org.annotationmvc.service.CustomerService method
	 */
	public void updateCustomerVO(final CustomerVO customerVO) {
		customerDao.updateCustomerVO(customerVO);
	}

	public void setCustomerDao(final CustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	
	
	
	/**
	 * Method that checks if
	 * the username is present and the password
	 * is correct, then it retrieves the customer data
	 * and the virtual cart plus the result code
	 * @param username
	 * @param password
	 * @return
	 */
	public LoginFormVO makeLogin(String username, String password){
		
		LoginFormVO loginFormVO = new LoginFormVO();
		
		CustomerVO customerVO = customerDao.findCustomerByCredentials(username);
		MessageDigest messageDigest;
		
		byte[] hashedPassword = null;
		try {
			messageDigest = MessageDigest.getInstance("SHA-256");
			
			hashedPassword = password.getBytes("UTF-8");
			
			hashedPassword =messageDigest.digest(hashedPassword);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		BigInteger bigInt = new BigInteger(1,hashedPassword);
		String hashtext = bigInt.toString(16);
		
		
		
		if(null == customerVO){
			loginFormVO.setResult(1);
			return loginFormVO;
		}else {
			loginFormVO.setCustomerVO(customerVO);
		}
		
		CredentialsVO credentialsVO = customerVO.getCredentials();
		
		if(!hashtext.equals(credentialsVO.getPassword())){
			loginFormVO.setResult(2);
			return loginFormVO;
		}
			
		
		
		
	
		loginFormVO.setVirtualCartVO(customerVO.getVirtualCartVO());
	
		loginFormVO.setResult(0);
		
		return loginFormVO;
		
	}
	
	
	public void activateCustomer(String activationCode){
		
		CustomerVO customerVO  = customerDao.getCustomerByActivationCode(activationCode);
		
		if(null!= customerVO);
		
		customerVO.setActivation(true);
		
		customerDao.updateCustomerVO(customerVO);
		
	}
	
	
	
	
	public void refreshCustomerVO(CustomerVO customerVO){
		customerDao.refreshCustomerVO(customerVO);
	}
	
	
	
}
