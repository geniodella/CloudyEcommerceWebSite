package com.template.form;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CategoryForm {
	
	public CategoryForm(){
		subCategories = new ArrayList<SubCategoryForm>();
		subCategoriesMap = new HashMap<Long, SubCategoryForm>();
	}
	
	
	private String name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}





	public HashMap<Long, SubCategoryForm> getSubCategoriesMap() {
		return subCategoriesMap;
	}

	public void setSubCategoriesMap(HashMap<Long, SubCategoryForm> subCategoriesMap) {
		this.subCategoriesMap = subCategoriesMap;
	}


	private long id;
	
	private List<SubCategoryForm> subCategories;
	
	private HashMap<Long,SubCategoryForm> subCategoriesMap;

	public List<SubCategoryForm> getSubCategories() {
		return subCategories;
	}

	public void setSubCategories(List<SubCategoryForm> subCategories) {
		this.subCategories = subCategories;
	}

}
