package com.template.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.address.AddressService;
import com.template.bo.customer.CustomerService;
import com.template.bo.invoice.InvoiceService;
import com.template.bo.order.OrderService;
import com.template.bo.virtualCart.VirtualCartService;
import com.template.form.AddressForm;
import com.template.form.ProductDetails;
import com.template.form.ShippingForm;

public class StampaAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	InvoiceService invoiceServiceBean;
	



	public InvoiceService getInvoiceServiceBean() {
		return invoiceServiceBean;
	}


	public void setInvoiceServiceBean(InvoiceService invoiceServiceBean) {
		this.invoiceServiceBean = invoiceServiceBean;
	}
	VirtualCartService virtualCartServiceBean;
	

	public VirtualCartService getVirtualCartServiceBean() {
		return virtualCartServiceBean;
	}


	public void setVirtualCartServiceBean(VirtualCartService virtualCartServiceBean) {
		this.virtualCartServiceBean = virtualCartServiceBean;
	}
	private List<ProductDetails> prodDetails;
	

	public List<ProductDetails> getProdDetails() {
		return prodDetails;
	}


	public void setProdDetails(List<ProductDetails> prodDetails) {
		this.prodDetails = prodDetails;
	}

	private List<AddressForm> addressList;
	

	public List<AddressForm> getAddressList() {
		return addressList;
	}


	public void setAddressList(List<AddressForm> addressList) {
		this.addressList = addressList;
	}
	
	AddressService addressServiceBean;
	

	public AddressService getAddressServiceBean() {
		return addressServiceBean;
	}


	public void setAddressServiceBean(AddressService addressServiceBean) {
		this.addressServiceBean = addressServiceBean;
	}
	
	CustomerService customerServiceBean;
	


	public CustomerService getCustomerServiceBean() {
		return customerServiceBean;
	}


	public void setCustomerServiceBean(CustomerService customerServiceBean) {
		this.customerServiceBean = customerServiceBean;
	}
	
	OrderService orderServiceBean;
	


	public OrderService getOrderServiceBean() {
		return orderServiceBean;
	}


	public void setOrderServiceBean(OrderService orderServiceBean) {
		this.orderServiceBean = orderServiceBean;
	}
	List<ShippingForm> listaShippings;
	


	public List<ShippingForm> getListaShippings() {
		return listaShippings;
	}


	public void setListaShippings(List<ShippingForm> listaShippings) {
		this.listaShippings = listaShippings;
	}
	private long orderId;
	

	public long getOrderId() {
		return orderId;
	}


	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}


	public String execute(){

	/*	HttpSession  session = ServletActionContext.getRequest().getSession();
		
    	VirtualCartVO virtualCartVO = (VirtualCartVO)session.getAttribute("virtualCartVO");
    		
    	virtualCartServiceBean.refreshVirtualCart(virtualCartVO);
    	
		/*Integer customerId = (Integer)session.getAttribute("customerVO");
		CustomerVO customerVO = customerServiceBean.findCustomerById(customerId);
		addressList = addressServiceBean.retrieveAddressesByCustomer(customerVO);
		*/
    	
    /*	AddressVO addressVO=(AddressVO)session.getAttribute("addressVO");
    	
		listaShippings=orderServiceBean.getAllShippingsByOrder(orderId);
    		
    	prodDetails = virtualCartServiceBean.retrieveProducts(virtualCartVO);
    		
		ByteArrayOutputStream baos = invoiceServiceBean.createInvoice(prodDetails,1,listaShippings);

		HttpServletResponse response = ServletActionContext.getResponse();

		ServletOutputStream outputStream;

		try {
			outputStream = response.getOutputStream();
			baos.writeTo(outputStream); 
			// response.setHeader("Content-Disposition", "attachment; filename=\"stuReport.pdf\""); 
			response.setContentType("application/pdf"); 
			outputStream.flush(); 
			outputStream.close(); 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} */
		return "success";
	}


}