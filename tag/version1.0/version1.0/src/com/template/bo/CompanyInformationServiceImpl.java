package com.template.bo;

import java.util.List;

import com.template.dao.CompanyInformationDao;
import com.template.vo.CompanyInformationVO;

public class CompanyInformationServiceImpl implements CompanyInformationService{

	CompanyInformationDao companyInformationDao;
	
	
	public CompanyInformationVO findCompanyInformationById(int id) {		
		return companyInformationDao.findCompanyInformationById(id);
	}

	public void insertCompanyInformationVO(CompanyInformationVO companyInformationVO) {
		companyInformationDao.insertCompanyInformationVO(companyInformationVO);		
	}

	public void updateCompanyInformation(CompanyInformationVO companyInformationVO) {
		companyInformationDao.removeCompanyInformationVO(companyInformationVO);
	}

	public void removeCompanyInformationVO(CompanyInformationVO companyInformationVO) {
		companyInformationDao.removeCompanyInformationVO(companyInformationVO);		
	}

	public List<CompanyInformationVO> getAllCompanyInformationVOs() {		
		return companyInformationDao.getAllCompanyInformationVOs();
	}

	public CompanyInformationDao getCompanyInformationDao() {
		return companyInformationDao;
	}

	public void setCompanyInformationDao(CompanyInformationDao companyInformationDao) {
		this.companyInformationDao = companyInformationDao;
	}
	
	
}
