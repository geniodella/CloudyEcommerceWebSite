package com.template.bo.invoice;

import java.util.List;

import com.template.form.ProductDetails;
import com.template.form.ShippingForm;
import com.template.vo.CustomerVO;

public interface InvoiceService {
	
	public void createInvoice(List<ProductDetails> prodDetails,long transactionId,List<ShippingForm> shippings,CustomerVO customerVO);

}
