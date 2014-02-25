package com.template.action;

import com.opensymphony.xwork2.ActionSupport;
import com.template.bo.tag.TagService;

public class TagAction extends ActionSupport{
	
	TagService tagServiceBean ;

	public TagService getTagServiceBean() {
		return tagServiceBean;
	}

	public void setTagServiceBean(TagService tagServiceBean) {
		this.tagServiceBean = tagServiceBean;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}
