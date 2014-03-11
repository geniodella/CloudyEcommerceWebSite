package com.template.bo.customer;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Date;
import java.util.List;
import java.util.Random;

import com.template.bo.jms.JmsSubscriptionService;
import com.template.bo.virtualCart.VirtualCartService;
import com.template.dao.UtenteDao;
import com.template.dao.credentials.CredentialsDao;
import com.template.dao.customer.CustomerDao;
import com.template.form.LoginFormVO;
import com.template.vo.CityVO;
import com.template.vo.CredentialsVO;
import com.template.vo.CustomerVO;
import com.template.vo.RegionVO;
import com.template.vo.RolesVO;
import com.template.vo.StateVO;
import com.template.vo.UtenteVO;
import com.template.vo.VirtualCartVO;

public class CustomerServiceImpl implements CustomerService {
	
	CustomerDao customerDao;
	
	



	public UtenteDao getUtenteDao() {
		return utenteDao;
	}

	public void setUtenteDao(UtenteDao utenteDao) {
		this.utenteDao = utenteDao;
	}




	UtenteDao utenteDao;
	
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
	public void insertCustomerVO(final String mail, String username,String password) {
		
		   int PASSWORD_LENGTH = 8;
		 
		  Random RANDOM = new SecureRandom();
		  
		  MessageDigest messageDigest = null;
		  
		  byte[] hashedPassword =null;
		
		 // Pick from some letters that won't be easily mistaken for each
	      // other. So, for example, omit o O and 0, 1 l and L.
	      String letters = "abcdefghjkmnpqrstuvwxyzABCDEFGHJKMNPQRSTUVWXYZ23456789";

	      String pw = "";
	      for (int i=0; i<PASSWORD_LENGTH; i++)
	      {
	          int index = (int)(RANDOM.nextDouble()*letters.length());
	          pw += letters.substring(index, index+1);
	      }
	      
	      
	      try {
				messageDigest = MessageDigest.getInstance("SHA-256");
				
				hashedPassword = pw.getBytes("UTF-8");
				
				
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
		
		UtenteVO utenteVO = new UtenteVO();
		
		utenteVO.setAddress("xxxxxxxxxxxxxxxxxxx");
		utenteVO.setFirstName("xxx");
		utenteVO.setLastName("xxx");
		utenteVO.setInsDate(new Date());
		utenteVO.setPhoneNumber("xxx");
		utenteVO.setMail(mail);
		
		StateVO stateVO=new StateVO();
		RegionVO regionVO=new RegionVO();
		CityVO cityVO=new CityVO();
		
		
		stateVO.setStateId(9);
 		regionVO.setRegionId(39);
 		cityVO.setCityId(1855);
 		
 		utenteVO.setStateVO(stateVO);
 		utenteVO.setRegionVO(regionVO);
 		utenteVO.setCityVO(cityVO);
 		

		
	
		
		RolesVO roleVO = new RolesVO();
		
		roleVO.setAuthority("ROLE_USER");
		
	CredentialsVO credentialsVO = new CredentialsVO();
		
		credentialsVO.setUsername(username);
		
		credentialsVO.setPassword(hashtext);
		
		
		credentialsVO.setEnabled(true);
		
		credentialsDao.insertCredentialsVO(credentialsVO);
		
		utenteDao.insertUtenteVO(utenteVO);
		
	
		
		roleVO.setCredentialsVO(credentialsVO);
		
		credentialsDao.insertRoleVO(roleVO);
		
		
		
			
		
		jmsSubscriptionServiceBean.sendSubscriptionEmail(pw, mail,username);
		

		
	
		
		
		
		
	}
	
	public CustomerVO findCustomerVOCredentials(String username){
		return customerDao.findCustomerByCredentials(username);
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
	
	
	public UtenteVO findUtenteVObyEmail(String mail){
		return utenteDao.findUtenteVObyEmail(mail);
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
