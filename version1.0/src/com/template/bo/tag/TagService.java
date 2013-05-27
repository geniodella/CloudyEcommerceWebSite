package com.template.bo.tag;

import java.util.List;

import com.template.form.TagForm;
import com.template.vo.TagVO;

public interface TagService {
	
	TagVO findTagById(long id);

	void insertTagVO(TagVO TagVO);

	void updateTagVO(TagVO TagVO);

	List getAllTagVOs(int size, int page);
	
	
	List getAllTagVOs();

	void removeTagVO(TagVO TagVO);
	
	List<TagForm> getAllTagForms();
	

}
