package com.template.form;

import java.util.List;

public class ProdDetailsList {
	
	 private List<ProductDetails> prodDetails;
	 
	 private List<Manufacturer> manufacturers;
	 
	 private int lowerPrice;
	 
	 public List<ProductDetails> getProdDetails() {
		return prodDetails;
	}

	public void setProdDetails(List<ProductDetails> prodDetails) {
		this.prodDetails = prodDetails;
	}

	public List<Manufacturer> getManufacturers() {
		return manufacturers;
	}

	public void setManufacturers(List<Manufacturer> manufacturers) {
		this.manufacturers = manufacturers;
	}

	public int getLowerPrice() {
		return lowerPrice;
	}

	public void setLowerPrice(int lowerPrice) {
		this.lowerPrice = lowerPrice;
	}

	public int getUpperPrice() {
		return upperPrice;
	}

	public void setUpperPrice(int upperPrice) {
		this.upperPrice = upperPrice;
	}

	private int upperPrice;
	 

}
