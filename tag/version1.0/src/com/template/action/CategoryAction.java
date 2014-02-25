package com.template.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.CategoryService;
import com.template.form.CategoryForm;
import com.template.vo.CategoryVo;



/**
 * @author FrankDragon
 *
 */
public class CategoryAction extends ActionSupport {


	private static final long serialVersionUID = 1L;
	

	CategoryService categoryServiceBean;

	CategoryVo categoryVo=new CategoryVo();

	public CategoryService getCategoryServiceBean() {
		return categoryServiceBean;
	}
	public void setCategoryServiceBean(CategoryService categoryServiceBean) {
		this.categoryServiceBean = categoryServiceBean;
	}


	private int categoryId;
	private String nameCategory;
	private String subCategory;
	private String description;
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getNameCategory() {
		return nameCategory;
	}
	public void setNameCategory(String nameCategory) {
		this.nameCategory = nameCategory;
	}
	public String getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}
	

	private List<CategoryForm> lista;

	public List<CategoryForm> getLista() {
		return lista;
	}
	public void setLista(List<CategoryForm> lista) {
		this.lista = lista;
	}

	public String populate(){				
		
		

		lista=categoryServiceBean.getAllCategoryForms();		

		return "populate";
	}	

	@Override
	public String execute() {

	
		
		categoryVo.setName(nameCategory);

		categoryVo.setDescription(description);
				
		categoryServiceBean.insertCategoryVo(categoryVo);

		return SUCCESS;
	}
	
	
}
