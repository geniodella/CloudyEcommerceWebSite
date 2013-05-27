package com.template.form;

import java.util.List;

public class CheckAvailabilitesForm {
	
	
	public boolean isEmptyProducts() {
		return emptyProducts;
	}

	public void setEmptyProducts(boolean emptyProducts) {
		this.emptyProducts = emptyProducts;
	}

	public List<ProductDetails> getProductDetails() {
		return productDetails;
	}

	public void setProductDetails(List<ProductDetails> productDetails) {
		this.productDetails = productDetails;
	}

	boolean emptyProducts;
	
	List<ProductDetails> productDetails;

}
