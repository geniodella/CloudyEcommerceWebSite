package com.template.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.subCategory.SubCategoryService;
import com.template.form.CharacteristicForm;
import com.template.vo.CharacteristicVO;
import com.template.vo.SubCategoryVO;

public class CharacteristicAction extends ActionSupport{
	
	
private static final long serialVersionUID = 1L;


	




	SubCategoryService subCategoryServiceBean;

	SubCategoryVO subCategoryVO=new SubCategoryVO();

	public SubCategoryService getSubCategoryServiceBean() {
		return subCategoryServiceBean;
	}
	public void setSubCategoryServiceBean(SubCategoryService subCategoryServiceBean) {
		this.subCategoryServiceBean = subCategoryServiceBean;
	}



	
	

	private List<CharacteristicVO> lista;

	

	public List<CharacteristicVO> getLista() {
		return lista;
	}
	public void setLista(List<CharacteristicVO> lista) {
		this.lista = lista;
	}
	

	@Override
	public String execute() {

	
		
		
	
		
		subCategoryServiceBean.getAllCharacteristicVOs();
	


		return SUCCESS;
	}
	
	

}
