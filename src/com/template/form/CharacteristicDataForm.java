package com.template.form;

public class CharacteristicDataForm {
	
public CharacteristicDataForm (){
		
	
	}
	

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}


private String name;
	
	public CharacteristicDataForm (int id, String data){
		
		this.charDataId = id;
		
		this.data = data;
	}
	
	int count;
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCharDataId() {
		return charDataId;
	}

	public void setCharDataId(int charDataId) {
		this.charDataId = charDataId;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	int charDataId;
	
	String data;

}
