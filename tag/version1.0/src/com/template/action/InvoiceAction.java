package com.template.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.invoice.InvoiceService;
import com.template.bo.virtualCart.VirtualCartService;
import com.template.form.ProductDetails;
import com.template.form.ShippingForm;


public class InvoiceAction extends ActionSupport{
	
	InvoiceService invoiceServiceBean;
	
	public InvoiceService getInvoiceServiceBean() {
		return invoiceServiceBean;
	}


	public void setInvoiceServiceBean(InvoiceService invoiceServiceBean) {
		this.invoiceServiceBean = invoiceServiceBean;
	}


	public VirtualCartService getVirtualCartServiceBean() {
		return virtualCartServiceBean;
	}


	public void setVirtualCartServiceBean(VirtualCartService virtualCartServiceBean) {
		this.virtualCartServiceBean = virtualCartServiceBean;
	}




	public List<ProductDetails> getProdDetails() {
		return prodDetails;
	}


	public void setProdDetails(List<ProductDetails> prodDetails) {
		this.prodDetails = prodDetails;
	}




	VirtualCartService virtualCartServiceBean;
	
	private List<ProductDetails> prodDetails;
	
	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}


	String user;
	
	public Map getLatest() {
		return latest;
	}


	public void setLatest(Map latest) {
		this.latest = latest;
	}


	Map latest;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	List<ShippingForm> shippings;
	
	
	public List<ShippingForm> getShippings() {
		return shippings;
	}


	public void setShippings(List<ShippingForm> shippings) {
		this.shippings = shippings;
	}


	public String execute(){
	
	        	
	    /*		HttpSession  session = ServletActionContext.getRequest().getSession();
	    		
	    	VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
	    		
	    	virtualCartServiceBean.refreshVirtualCart(virtualCartVO);
	    		
	    		prodDetails = virtualCartServiceBean.retrieveProducts(virtualCartVO);
	    		
	    		shippings = (List<ShippingForm>)session.getAttribute("shippings");
	        	
	    		invoiceServiceBean.createInvoice(prodDetails,1,shippings);
			
				
				System.out.println("ddd");
			
		*/
	
	
	
		
		
		return "success";
	}

}
