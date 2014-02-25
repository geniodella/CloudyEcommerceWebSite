package com.template.bo.subCategory;

import java.util.List;

import com.template.dao.CategoryDao;
import com.template.dao.CharacteristicDao;
import com.template.dao.subCategory.SubCategoryDao;
import com.template.form.CharacteristicForm;
import com.template.vo.CategoryVo;
import com.template.vo.CharacteristicVO;
import com.template.vo.SubCategoryVO;

public class SubCategoryServiceImpl implements SubCategoryService{
	
	
	SubCategoryDao subCategoryDao;
	
	CharacteristicDao characteristicDao;

	public void setCharacteristicDao(CharacteristicDao characteristicDao) {
		this.characteristicDao = characteristicDao;
	}

	/**
	 * findCategoryById
	 * 
	 * @param id
	 *            int
	 * @return CategoryVo
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public SubCategoryVO findSubCategoryById(final int id) {
		return subCategoryDao.findSubCategoryById(id);
	}

	/**
	 * getAllCategoryVos
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public List<SubCategoryVO> getAllSubCategoryVOs() {
		return subCategoryDao.getAllSubCategoryVOs();
	}
	
	
	public List<CharacteristicVO> getAllCharacteristicVOs(){
		return characteristicDao.getAllCharacteristicVOs();
	}

	/**
	 * insertCategoryVo
	 * 
	 * @param categoryVo
	 *            CategoryVo
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void insertSubCategoryVO(final SubCategoryVO subCategoryVo) {
		subCategoryDao.insertSubCategoryVO(subCategoryVo);
	}

	/**
	 * removeCategoryVo
	 * 
	 * @param categoryVo
	 *            CategoryVo
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void removeSubCategoryVO(final SubCategoryVO subCategoryVo) {
		subCategoryDao.removeSubCategoryVO(subCategoryVo);
	}

	/**
	 * updateCategoryVo
	 * 
	 * @param categoryVo
	 *            CategoryVo
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void updateSubCategoryVO(final SubCategoryVO subCategoryVo) {
		subCategoryDao.updateSubCategoryVO(subCategoryVo);
	}

	public void setSubCategoryDao(final SubCategoryDao subCategoryDao) {
		this.subCategoryDao = subCategoryDao;
	}
	
	


}
