package com.template.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.template.bo.subCategory.SubCategoryService;
import com.template.form.CharacteristicForm;
import com.template.vo.SubCategoryVO;

public class SubCategoryAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	

	


	SubCategoryService subCategoryServiceBean;

	SubCategoryVO subCategoryVO=new SubCategoryVO();

	public SubCategoryService getSubCategoryServiceBean() {
		return subCategoryServiceBean;
	}
	public void setSubCategoryServiceBean(SubCategoryService subCategoryServiceBean) {
		this.subCategoryServiceBean = subCategoryServiceBean;
	}


	private int categoryId;
	private String nameCategory;
	private String subCategoryName;
	private String subCategoryDescription;
	
	public String getSubCategoryName() {
		return subCategoryName;
	}
	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getSubCategoryDescription() {
		return subCategoryDescription;
	}
	public void setSubCategoryDescription(String subCategoryDescription) {
		this.subCategoryDescription = subCategoryDescription;
	}
	public String getNameCategory() {
		return nameCategory;
	}
	public void setNameCategory(String nameCategory) {
		this.nameCategory = nameCategory;
	}
	

	private List<SubCategoryVO> lista;

	public List<SubCategoryVO> getLista() {
		return lista;
	}
	public void setLista(List<SubCategoryVO> lista) {
		this.lista = lista;
	}

	public String populate(){				

		lista=subCategoryServiceBean.getAllSubCategoryVOs();		

		return "populate";
	}	

	@Override
	public String execute() {

		subCategoryVO.setSubCategoryName(subCategoryName);
		subCategoryVO.setSubCategoryDescription(subCategoryDescription);
		
				
		subCategoryServiceBean.insertSubCategoryVO(subCategoryVO);
		
	
		
	
	


		return SUCCESS;
	}
	
	
	
	
}
