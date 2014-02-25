package com.template.form;

import java.util.HashMap;




public class CharacteristicForm {
	
	public CharacteristicForm(int CharacteristicId, String name){
		
		this.CharacteristicId = CharacteristicId;
		
		this.name = name;
		
		charDatas = new HashMap<Integer,CharacteristicDataForm>();
	}
	
	
	private HashMap<Integer,CharacteristicDataForm> charDatas;
	

	public HashMap<Integer, CharacteristicDataForm> getCharDatas() {
		return charDatas;
	}

	public void setCharDatas(HashMap<Integer, CharacteristicDataForm> charDatas) {
		this.charDatas = charDatas;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private int CharacteristicId;
	
	private String name;
	
	

	public int getCharacteristicId() {
		return CharacteristicId;
	}

	public void setCharacteristicId(int characteristicId) {
		CharacteristicId = characteristicId;
	}

	

}
