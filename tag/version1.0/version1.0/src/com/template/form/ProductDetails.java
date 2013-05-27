package com.template.form;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

public class ProductDetails  implements Serializable,Comparator{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ProductDetails (){
		
		characteristicDetails = new ArrayList<CharacteristicDetails>();
	}
	


	
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}





	String name;
	
	int count;
	
	private BigDecimal price;
	private double weight;
	public int getQuantitySold() {
		return quantitySold;
	}





	public void setQuantitySold(int quantitySold) {
		this.quantitySold = quantitySold;
	}


	private int discountPercentage;
	



	public int getDiscountPercentage() {
		return discountPercentage;
	}

	public void setDiscountPercentage(int discountPercentage) {
		this.discountPercentage = discountPercentage;
	}





	public int getProductId() {
		return productId;
	}





	public void setProductId(int productId) {
		this.productId = productId;
	}





	private String description;
	private BigDecimal vat;
	private String availability;
	private int availabilityTime;
	private long  quantity;
	private int productId;
	private Date lastUpdate;
	private String producer;
	private int outOfStockQuantity;
	private int quantitySold;
	private int subCategoryId;
	
	public int getSubCategoryId() {
		return subCategoryId;
	}





	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}





	public int getOutOfStockQuantity() {
		return outOfStockQuantity;
	}

	public void setOutOfStockQuantity(int outOfStockQuantity) {
		this.outOfStockQuantity = outOfStockQuantity;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getVat() {
		return vat;
	}

	public void setVat(BigDecimal vat) {
		this.vat = vat;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public long getQuantity() {
		return quantity;
	}

	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}

	public int getAvailabilityTime() {
		return availabilityTime;
	}

	public void setAvailabilityTime(int availabilityTime) {
		this.availabilityTime = availabilityTime;
	}

	

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	public String getImagePath() {
		return imagePath;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	
	public int compare(Object obj1, Object obj2) {
		ProductDetails o1 = (ProductDetails) obj1;
		
		ProductDetails o2 = (ProductDetails) obj2;
	    if (o1.equals(o2.name)) { // achieving uniqueness
	        return 0;
	    } else {
	        if (o1.quantitySold < o2.quantitySold) {
	            return -1;
	        } else if (o1.quantitySold > o2.quantitySold) {
	            return 1;
	        } else {
	            // this makes `name` the second ordering option.
	            // names don't equal here
	            return -1;
	        }
	    }
	}

	int id;
	
	String imagePath;
	
	List<CharacteristicDetails> characteristicDetails;

	public List<CharacteristicDetails> getCharacteristicDetails() {
		return characteristicDetails;
	}

	public void setCharacteristicDetails(
			List<CharacteristicDetails> characteristicDetails) {
		this.characteristicDetails = characteristicDetails;
	}
	
	private BigDecimal unitaryPrice;

	public BigDecimal getUnitaryPrice() {
		return unitaryPrice;
	}

	public void setUnitaryPrice(BigDecimal unitaryPrice) {
		this.unitaryPrice = unitaryPrice;
	}
	
	

}
