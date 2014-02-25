package com.template.bo.subCategory;

import java.util.List;

import com.template.form.CharacteristicForm;
import com.template.vo.CharacteristicVO;
import com.template.vo.SubCategoryVO;

/**
 * @author FrankDragon
 *
 */
public interface SubCategoryService {
	
	
	/**
	 * @param id
	 * @return
	 */
	SubCategoryVO findSubCategoryById(int id);

	/**
	 * @param subCategoryVO
	 */
	void insertSubCategoryVO(SubCategoryVO subCategoryVO);

	/**
	 * @param subCategoryVO
	 */
	void updateSubCategoryVO(SubCategoryVO subCategoryVO);

	/**
	 * @return
	 */
	List<SubCategoryVO> getAllSubCategoryVOs();
	
	List<CharacteristicVO> getAllCharacteristicVOs();

	/**
	 * @param subCategoryVO
	 */
	void removeSubCategoryVO(SubCategoryVO subCategoryVO);
	
	

}
