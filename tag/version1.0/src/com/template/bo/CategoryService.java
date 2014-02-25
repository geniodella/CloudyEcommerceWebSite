package com.template.bo;

import java.util.List;

import com.template.form.CategoryForm;
import com.template.form.CharacteristicForm;
import com.template.vo.CategoryVo;

public interface CategoryService {
	
	CategoryVo findCategoryById(int id);

	void insertCategoryVo(CategoryVo categoryVo);

	void updateCategoryVo(CategoryVo categoryVo);

	List getAllCategoryVos(int size, int page);
	
	
	List getAllCategoryVos();

	void removeCategoryVo(CategoryVo categoryVo);
	
	List<CategoryForm> getAllCategoryForms();
	

}
