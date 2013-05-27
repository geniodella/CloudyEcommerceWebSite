package com.template.action;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.customer.CustomerService;
import com.template.bo.virtualCart.VirtualCartService;
import com.template.form.CheckAvailabilitesForm;
import com.template.form.OrderForm;
import com.template.form.ProductDetails;
import com.template.vo.CustomerVO;
import com.template.vo.VirtualCartVO;

public class VirtualCartAction extends ActionSupport{
	
	private List<ProductDetails> productDetails;
	
	private double partialPrice;
	
	private boolean checkAvailability;
	
	private boolean emptyProducts;
	
	public boolean isEmptyProducts() {
		return emptyProducts;
	}



	public void setEmptyProducts(boolean emptyProducts) {
		this.emptyProducts = emptyProducts;
	}



	public boolean isCustomerLoggedCheck() {
		return isCustomerLoggedCheck;
	}



	public void setCustomerLoggedCheck(boolean isCustomerLoggedCheck) {
		this.isCustomerLoggedCheck = isCustomerLoggedCheck;
	}



	private int quantityCheck;
	
	private boolean isCustomerLoggedCheck ;

	public int getQuantityCheck() {
		return quantityCheck;
	}



	public void setQuantityCheck(int quantityCheck) {
		this.quantityCheck = quantityCheck;
	}



	public boolean isCheckAvailability() {
		return checkAvailability;
	}



	public void setCheckAvailability(boolean checkAvailability) {
		this.checkAvailability = checkAvailability;
	}



	public double getPartialPrice() {
		return partialPrice;
	}



	public void setPartialPrice(double partialPrice) {
		this.partialPrice = partialPrice;
	}



	public List<ProductDetails> getProductDetails() {
		return productDetails;
	}



	public void setProductDetails(List<ProductDetails> productDetails) {
		this.productDetails = productDetails;
	}



	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	VirtualCartService virtualCartServiceBean;
	
	CustomerService customerServiceBean;
	
	
	public CustomerService getCustomerServiceBean() {
		return customerServiceBean;
	}



	public void setCustomerServiceBean(CustomerService customerServiceBean) {
		this.customerServiceBean = customerServiceBean;
	}



	public VirtualCartService getVirtualCartServiceBean() {
		return virtualCartServiceBean;
	}



	public void setVirtualCartServiceBean(VirtualCartService virtualCartServiceBean) {
		this.virtualCartServiceBean = virtualCartServiceBean;
	}



	public int getProductId() {
		return productId;
	}



	public void setProductId(int productId) {
		this.productId = productId;
	}



	int productId;
	
	long productQuantity;
	
	
	
	public long getProductQuantity() {
		return productQuantity;
	}



	public void setProductQuantity(long productQuantity) {
		this.productQuantity = productQuantity;
	}
	
	OrderForm priceReview;
	
	
	


	public OrderForm getPriceReview() {
		return priceReview;
	}



	public void setPriceReview(OrderForm priceReview) {
		this.priceReview = priceReview;
	}



	public String retrieveProducts(){
		
		CustomerVO customerVO = null;
		
		HttpSession  session = ServletActionContext.getRequest().getSession(true);
		
		VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
		
		// manage the case of anonymous user
		// in this case it is created an anonymous customer
		if (virtualCartVO == null){
			customerVO = customerServiceBean.insertAnonymousCustomer();
			session.setAttribute("customerVO", customerVO.getCustomerId());
			session.setAttribute("virtualCartVO", customerVO.getVirtualCartVO());
			
			productDetails = virtualCartServiceBean.retrieveProducts( customerVO.getVirtualCartVO());
				
			}else {
				
				virtualCartServiceBean.refreshVirtualCart(virtualCartVO);
				
				productDetails = virtualCartServiceBean.retrieveProducts(virtualCartVO);
				
				
			}
		
		
		partialPrice = virtualCartServiceBean.calculatePartialPrice(productDetails);
		
		
		
		return "retrieveProducts";
	}



	public String addProd(){
		
		CustomerVO customerVO = null;
		
		HttpSession  session = ServletActionContext.getRequest().getSession(true);
		
		VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
		
		
		// manage the case of anonymous user
		// in this case it is created an anonymous customer
		if (virtualCartVO == null){
		customerVO = customerServiceBean.insertAnonymousCustomer();
		session.setAttribute("customerVO", customerVO.getCustomerId());
		session.setAttribute("virtualCartVO", customerVO.getVirtualCartVO());
		
		virtualCartServiceBean.insertProductIntoCart(productId,  customerVO.getVirtualCartVO(),productQuantity);
			
		}else 
		
		{
		virtualCartServiceBean.insertProductIntoCart(productId, virtualCartVO,productQuantity);
		}
		
		
		
		
		return "addProd";
	}
	
	
	public String removeProd(){
		
		HttpSession  session = ServletActionContext.getRequest().getSession(false);
		
		VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
		
		virtualCartServiceBean.removeProductIntoCart(productId,virtualCartVO);
		
		 virtualCartVO =  virtualCartServiceBean.findVirtualCartById((int)virtualCartVO.getVirtualCartId());
		
		session.setAttribute("virtualCartVO",virtualCartVO);
		
		return "removeProd";
	}
	
	public String checkAvailability(){
		
	HttpSession  session = ServletActionContext.getRequest().getSession(false);
	
	Integer customerId = (Integer)session.getAttribute("customerVO");
	
	CustomerVO customerVO = customerServiceBean.findCustomerById(customerId);
	
	
	// check if the customer is logged to see
	// where to redirect the customer is diretly to the addresses
	// or ask for him to login
	if (customerVO.isAnonymous() == true){
		isCustomerLoggedCheck = false;
	}else
		isCustomerLoggedCheck = true;
		
		VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
		
		CheckAvailabilitesForm form = virtualCartServiceBean.checkProductAvailabilities(virtualCartVO);
		
		productDetails = form.getProductDetails();
		
		emptyProducts = form.isEmptyProducts();
		
		return "checkAvailability";
	}
	
	public String changeQuantity(){
		
		
	HttpSession  session = ServletActionContext.getRequest().getSession(false);
		
		VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
		
		quantityCheck = virtualCartServiceBean.changeQuantity(productId, productQuantity, virtualCartVO);
		
	    session.setAttribute("virtualCartVO", virtualCartVO);
		
		return "changeQuantity";
	}
	
	public String priceResume(){
		
		HttpSession  session = ServletActionContext.getRequest().getSession(false);
		VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
		
		Integer customerId = (Integer)session.getAttribute("customerVO");		
		CustomerVO customerVO = customerServiceBean.findCustomerById(customerId);
				
		if (customerVO.isAnonymous() == true){
			
			session.setAttribute("customerVO", customerVO.getCustomerId());
			session.setAttribute("virtualCartVO", customerVO.getVirtualCartVO());
			
			priceReview=virtualCartServiceBean.retrievePrice(customerVO.getVirtualCartVO());
				
			}else{
				priceReview=virtualCartServiceBean.retrievePrice(virtualCartVO);
			}
		
		return "priceResume";
	}
}
