package com.template.bo;

import java.util.List;

import com.template.vo.CompanyInformationVO;

public interface CompanyInformationService {
	
	CompanyInformationVO findCompanyInformationById(int id);
	
	void insertCompanyInformationVO(CompanyInformationVO companyInformationVO);
	
	void updateCompanyInformation(CompanyInformationVO companyInformationVO);
	
	void removeCompanyInformationVO(CompanyInformationVO companyInformationVO);
	
	List<CompanyInformationVO> getAllCompanyInformationVOs();

}
