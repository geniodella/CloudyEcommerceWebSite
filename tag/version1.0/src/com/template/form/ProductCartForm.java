package com.template.form;

public class ProductCartForm {
	
	
	public ProductCartForm (){
		
		productDetails = new ProductDetails();
		
	}
	
	
	public long getQuantity() {
		return quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}

	private long quantity;

	
	private ProductDetails productDetails;

	public ProductDetails getProductDetails() {
		return productDetails;
	}

	public void setProductDetails(ProductDetails productDetails) {
		this.productDetails = productDetails;
	}
	
	

}
