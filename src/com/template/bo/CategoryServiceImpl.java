package com.template.bo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.template.dao.CategoryDao;
import com.template.form.CategoryForm;
import com.template.form.SubCategoryForm;
import com.template.vo.CategoryVo;
import com.template.vo.SubCategoryVO;

public class CategoryServiceImpl implements CategoryService {
	
	CategoryDao categoryDao;
	


	/**
	 * findCategoryById
	 * 
	 * @param id
	 *            int
	 * @return CategoryVo
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public CategoryVo findCategoryById(final int id) {
		return categoryDao.findCategoryById(id);
	}

	/**
	 * getAllCategoryVos
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public List getAllCategoryVos(int size, int page) {
		return categoryDao.getAllCategoryVos(size,page);
	}
	
	
	/**
	 * getAllCategoryVos
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public List<CategoryForm> getAllCategoryForms() {
		
		List<CategoryVo> categories =  categoryDao.getAllCategoryVos();
		
		List<CategoryForm> categoriesForm = new ArrayList<CategoryForm>();
		
		
		for (CategoryVo categoryVo : categories) {
			List<SubCategoryVO> subCategories =categoryVo.getSubCategories();
			CategoryForm catForm = new CategoryForm();
			catForm.setId(categoryVo.getCategoryId());
			catForm.setName(categoryVo.getName());
			
			
			for (SubCategoryVO subCategoryVO : subCategories) {
				SubCategoryForm subCatForm = new SubCategoryForm();
				subCatForm.setSubCategoryId(subCategoryVO.getSubCategoryId());
				subCatForm.setSubCategoryName(subCategoryVO.getSubCategoryName());
				catForm.getSubCategories().add(subCatForm);
				
			}
		
			
			categoriesForm.add(catForm);
			
		}
		
		return categoriesForm;
	}
	
	
	/**
	 * getAllCategoryVos
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public List getAllCategoryVos() {
		return categoryDao.getAllCategoryVos();
	}

	/**
	 * insertCategoryVo
	 * 
	 * @param categoryVo
	 *            CategoryVo
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void insertCategoryVo(final CategoryVo categoryVo) {
		categoryDao.insertCategoryVo(categoryVo);
	}

	/**
	 * removeCategoryVo
	 * 
	 * @param categoryVo
	 *            CategoryVo
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void removeCategoryVo(final CategoryVo categoryVo) {
		categoryDao.removeCategoryVo(categoryVo);
	}

	/**
	 * updateCategoryVo
	 * 
	 * @param categoryVo
	 *            CategoryVo
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void updateCategoryVo(final CategoryVo categoryVo) {
		categoryDao.updateCategoryVo(categoryVo);
	}

	public void setCategoryDao(final CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
	
	
	
}
