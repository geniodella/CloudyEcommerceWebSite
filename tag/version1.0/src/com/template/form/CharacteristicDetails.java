package com.template.form;

import java.util.ArrayList;
import java.util.List;

public class CharacteristicDetails {
	
	
	public CharacteristicDetails(){
		charList = new ArrayList<CharacteristicDataForm>();
	}
	
	
	String name;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	String value;
	
	int id;
	
	private List<CharacteristicDataForm> charList;



	public List<CharacteristicDataForm> getCharList() {
		return charList;
	}

	public void setCharList(List<CharacteristicDataForm> charList) {
		this.charList = charList;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
