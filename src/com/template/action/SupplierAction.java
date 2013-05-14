package com.template.action;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.SupplierService;
import com.template.vo.SupplierVO;

public class SupplierAction extends ActionSupport{

	
	public SupplierService getSupplierServiceBean() {
		return supplierServiceBean;
	}
	public void setSupplierServiceBean(SupplierService supplierServiceBean) {
		this.supplierServiceBean = supplierServiceBean;
	}
	public Integer getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getFiscalCode() {
		return fiscalCode;
	}
	public void setFiscalCode(String fiscalCode) {
		this.fiscalCode = fiscalCode;
	}
	public String getPiva() {
		return piva;
	}
	public void setPiva(String piva) {
		this.piva = piva;
	}
	public String getInsDate() {
		return insDate;
	}
	public void setInsDate(String insDate) {
		this.insDate = insDate;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getIban() {
		return iban;
	}
	public void setIban(String iban) {
		this.iban = iban;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	
	
	private static final long serialVersionUID = 1L;
	
	SupplierVO supplierVO=new SupplierVO();
	
	SupplierService supplierServiceBean;
	
	private int supplierId; 
 	private String name; 
 	private String firstName; 
 	private String lastName; 
 	private String address; 
 	private String country; 
 	private String state; 
 	private String city; 
 	private String postalCode; 
 	private String username;  	
 	private String fiscalCode; 
 	private String piva; 
 	private String insDate;
 	private String mail; 
 	private String iban; 
 	private String param; 
 	
 	
 	public String execute() {
 		
 		supplierVO.setAddress(address);
 		supplierVO.setFirstName(firstName);
 		supplierVO.setFiscalCode(fiscalCode);
 		supplierVO.setIban(iban);
 		supplierVO.setLastName(lastName);
 		supplierVO.setMail(mail);
 		supplierVO.setName(firstName);
 		supplierVO.setPiva(piva);
 		supplierVO.setPostalCode(postalCode); 	
 		supplierVO.setSupplierId(supplierId);
 		
 		supplierServiceBean.insertSupplierVO(supplierVO);
 		
 		return SUCCESS;
 	}
 	 	

}
