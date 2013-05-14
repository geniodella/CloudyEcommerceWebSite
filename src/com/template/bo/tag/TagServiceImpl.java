package com.template.bo.tag;

import java.util.ArrayList;
import java.util.List;

import com.template.dao.tag.TagDao;
import com.template.form.TagForm;
import com.template.vo.TagVO;

public class TagServiceImpl implements TagService {
	
	TagDao tagDao;
	


	public TagDao getTagDao() {
		return tagDao;
	}

	public void setTagDao(TagDao tagDao) {
		this.tagDao = tagDao;
	}

	/**
	 * findCategoryById
	 * 
	 * @param id
	 *            int
	 * @return TagVO
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public TagVO findTagById(final long id) {
		return tagDao.findTagById(id);
	}

	/**
	 * getAllTagVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public List getAllTagVOs(int size, int page) {
		return tagDao.getAllTagVOs(size,page);
	}
	
	
	/**
	 * getAllTagVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public List<TagForm> getAllTagForms() {
		
		List<TagVO> tags =  tagDao.getAllTagVOs();
		
		List<TagForm> tagsForm = new ArrayList<TagForm>();
		
		
		for (TagVO TagVO : tags) {
			
			TagForm tagForm = new TagForm();
			tagForm.setTagId(TagVO.getId());
			tagForm.setName(TagVO.getName());
			
			
			
			
			tagsForm.add(tagForm);
			
		}
		
		return tagsForm;
	}
	
	
	/**
	 * getAllTagVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public List getAllTagVOs() {
		return tagDao.getAllTagVOs();
	}

	/**
	 * insertTagVO
	 * 
	 * @param TagVO
	 *            TagVO
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void insertTagVO(final TagVO TagVO) {
		tagDao.insertTagVO(TagVO);
	}

	/**
	 * removeTagVO
	 * 
	 * @param TagVO
	 *            TagVO
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void removeTagVO(final TagVO TagVO) {
		tagDao.removeTagVO(TagVO);
	}

	/**
	 * updateTagVO
	 * 
	 * @param TagVO
	 *            TagVO
	 * @todo Implement this org.annotationmvc.service.CategoryService method
	 */
	public void updateTagVO(final TagVO TagVO) {
		tagDao.updateTagVO(TagVO);
	}

	
	
	
}
