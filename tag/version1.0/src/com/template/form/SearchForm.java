package com.template.form;

import java.util.HashMap;
import java.util.List;

public class SearchForm {


	List<ProductDetails> products;
	
	HashMap<Integer,CharacteristicForm> characteristics;
	
	HashMap<Long,CategoryForm> categories;
	
	private List<PriceRangeForm> priceRanges;
	
	

	public List<PriceRangeForm> getPriceRanges() {
		return priceRanges;
	}

	public void setPriceRanges(List<PriceRangeForm> priceRanges) {
		this.priceRanges = priceRanges;
	}

	public HashMap<Long, CategoryForm> getCategories() {
		return categories;
	}

	public void setCategories(HashMap<Long, CategoryForm> categories) {
		this.categories = categories;
	}

	HashMap<String,Manufacturer> manufacturers;

	public HashMap<String, Manufacturer> getManufacturers() {
		return manufacturers;
	}

	public void setManufacturers(HashMap<String, Manufacturer> manufacturers) {
		this.manufacturers = manufacturers;
	}

	public List<ProductDetails> getProducts() {
		return products;
	}

	public void setProducts(List<ProductDetails> products) {
		this.products = products;
	}

	public HashMap<Integer, CharacteristicForm> getCharacteristics() {
		return characteristics;
	}

	public void setCharacteristics(
			HashMap<Integer, CharacteristicForm> characteristics) {
		this.characteristics = characteristics;
	}

	

}
