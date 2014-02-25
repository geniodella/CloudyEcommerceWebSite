package com.template.form;

import java.io.Serializable;

public class AddressForm implements Serializable{
	
	
	
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public String getPoBox() {
		return poBox;
	}

	public void setPoBox(String poBox) {
		this.poBox = poBox;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getRegionName() {
		return regionName;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

private String poBox;
	
	private String phoneNumber;
	
	private String fullname;
	
	private int addressId;
	
	
	private String street;
	
	private String cityName;
	
	private String regionName;
	
	private String stateName;

}
