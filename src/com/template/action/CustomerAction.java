package com.template.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import nl.captcha.Captcha;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.customer.CustomerService;
import com.template.bo.order.OrderService;
import com.template.form.LoginFormVO;
import com.template.form.OrderForm;
import com.template.form.ShippingForm;
import com.template.vo.CustomerVO;
import com.template.vo.OrderStatus;
import com.template.vo.UtenteVO;
import com.template.vo.VirtualCartVO;

public class CustomerAction extends ActionSupport {

	VirtualCartVO virtualCartVO;

	OrderService orderServiceBean;

	CustomerVO customerVO;
	
	

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	Integer customerId;

	private Boolean captchaCheck;

	public Boolean getCaptchaCheck() {
		return captchaCheck;
	}

	public void setCaptchaCheck(Boolean captchaCheck) {
		this.captchaCheck = captchaCheck;
	}

	int msg;

	private String captchaValue;

	public String getCaptchaValue() {
		return captchaValue;
	}

	public void setCaptchaValue(String captchaValue) {
		this.captchaValue = captchaValue;
	}

	public int getMsg() {
		return msg;
	}

	public void setMsg(int msg) {
		this.msg = msg;
	}

	public String getActivationCode() {
		return activationCode;
	}

	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}

	public VirtualCartVO getVirtualCartVO() {
		return virtualCartVO;
	}

	public void setVirtualCartVO(VirtualCartVO virtualCartVO) {
		this.virtualCartVO = virtualCartVO;
	}

	public CustomerVO getCustomerVO() {
		return customerVO;
	}

	public void setCustomerVO(CustomerVO customerVO) {
		this.customerVO = customerVO;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;

	private String activationCode;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUtenteId() {
		return utenteId;
	}

	public void setUtenteId(int utenteId) {
		this.utenteId = utenteId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getInsDate() {
		return insDate;
	}

	public void setInsDate(Date insDate) {
		this.insDate = insDate;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	private int utenteId;

	private String username;
	private String firstName;
	private String lastName;
	private Date insDate;
	private String mail;
	private String phoneNumber;
	private long orderId;


	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public String getUsername() {
		return username;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setUsername(String username) {
		this.username = username;
	}



	private String password;
	private boolean success;
	CustomerService customerServiceBean;

	public CustomerService getCustomerServiceBean() {
		return customerServiceBean;
	}

	public void setCustomerServiceBean(CustomerService customerServiceBean) {
		this.customerServiceBean = customerServiceBean;
	}

	List<OrderForm> listaOrdini;

	List<ShippingForm> listaShippings;

	public List<OrderForm> getListaOrdini() {
		return listaOrdini;
	}

	public void setListaOrdini(List<OrderForm> listaOrdini) {
		this.listaOrdini = listaOrdini;
	}


	public List<ShippingForm> getListaShippings() {
		return listaShippings;
	}

	public void setListaShippings(List<ShippingForm> listaShippings) {
		this.listaShippings = listaShippings;
	}

	public OrderService getOrderServiceBean() {
		return orderServiceBean;
	}

	public void setOrderServiceBean(OrderService orderServiceBean) {
		this.orderServiceBean = orderServiceBean;
	}



	private OrderStatus shippingStatus;


	

	public OrderStatus getShippingStatus() {
		return shippingStatus;
	}

	public void setShippingStatus(OrderStatus shippingStatus) {
		this.shippingStatus = shippingStatus;
	}

	public String execute() {

		CustomerVO customerVO = null;

		HttpSession session = ServletActionContext.getRequest().getSession(false);

		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
		
		if(!captcha.isCorrect(captchaValue)){
			msg=1;
			success = false;
			return "success";
		}


		customerVO = new CustomerVO();

		customerVO.setInsDate(new Date());
		customerVO.setMail(mail);

		if(checkCustomerExistence(mail) == 1){
			success = false;
			return "success";

		}else{

			customerServiceBean.insertCustomerVO(mail, username, password);
			success = true;
			return "success";
		}

	}


	public String activate(){


		customerServiceBean.activateCustomer(activationCode);

		success = true;

		return "activate";
	}


	/**
	 * @return
	 */
	public String makeLogin() {

		LoginFormVO loginFormVO = customerServiceBean.makeLogin(username,
				password);

		//if the result is zero it means that the login name is existing and the password is
		// correct
		if(loginFormVO.getResult() == 0){

			HttpSession session = ServletActionContext.getRequest().getSession();

			session.setAttribute("customerVO", loginFormVO.getCustomerVO().getCustomerId());

			session.setAttribute("virtualCartVO", loginFormVO.getVirtualCartVO());

			customerVO = loginFormVO.getCustomerVO();

			virtualCartVO = loginFormVO.getVirtualCartVO();

			success = true;

		}

		else {

			msg = loginFormVO.getResult();

			success = false;
		}
		return "makeLogin";
	}


	public String checkInSession(){

		HttpSession  session = ServletActionContext.getRequest().getSession(true);

		VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");


		// manage the case of anonymous user
		// in this case it is created an anonymous customer
		if (virtualCartVO == null){
			customerVO = customerServiceBean.insertAnonymousCustomer();
			session.setAttribute("customerVO", customerVO.getCustomerId());
			session.setAttribute("virtualCartVO", customerVO.getVirtualCartVO());



		}

		return "checkInSession";
	}

	private int checkCustomerExistence(String email) {
		UtenteVO utenteVO = customerServiceBean.findUtenteVObyEmail(email);
 
		if(null!= utenteVO) 
			return 1;
		else
			return 0;
	}

	public String showOrdInfo(){

		HttpSession  session = ServletActionContext.getRequest().getSession(false);		
		Integer customerId = (Integer)session.getAttribute("customerVO");

		listaOrdini=orderServiceBean.getAllOrderByCustomer(customerId); 
		success = true;
		return "showOrdInfo";
	}

	public String shippingOrd(){

		listaShippings=orderServiceBean.getAllShippingsByOrder(orderId); 
		success = true;
		return "shippingOrd";
	}

	public String filterByDate(){
		HttpSession  session = ServletActionContext.getRequest().getSession(false);		
		Integer customerId = (Integer)session.getAttribute("customerVO");

		listaOrdini=orderServiceBean.getOrderByDate(insDate,customerId);
		success = true;
		return "filterByDate";
	}
	public String filterByShipping(){
		HttpSession  session = ServletActionContext.getRequest().getSession(false);		
		Integer customerId = (Integer)session.getAttribute("customerVO");

		listaOrdini=orderServiceBean.getOrderByShipping(shippingStatus,customerId);
		success = true;
		return "filterByShipping";
	}

	public String retrieveId(){
		HttpSession  session = ServletActionContext.getRequest().getSession(false);	
		customerId = (Integer)session.getAttribute("customerVO");

		return "retrieveId";	
	}

	public String checkCaptcha(){
		HttpSession  session = ServletActionContext.getRequest().getSession(false);	
		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
		success = true;
		captchaCheck = captcha.isCorrect(captchaValue);
		return "checkCaptcha";
	}

}
