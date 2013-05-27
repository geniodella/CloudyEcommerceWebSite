package com.template.bo;

import java.util.List;

import com.template.dao.SupplierDao;
import com.template.vo.SupplierVO;

public class SupplierServiceImpl implements SupplierService{
	
	SupplierDao supplierDao;
		
	
	public SupplierVO findSupplierById(final int id){
		return supplierDao.findSupplierById(id);
	}
	
	public List getAllSupplierVOs(int size, int page){
		return supplierDao.getAllSupplierVOs(size,page);
	}
	
	public void insertSupplierVO(final SupplierVO supplierVO){
		supplierDao.insertSupplierVO(supplierVO);
	}
	
	public void removeSupplierVO(final SupplierVO supplierVO){
		supplierDao.removeSupplierVO(supplierVO);
	}
	
	public void updateSupplierVO(final SupplierVO supplierVO){
		supplierDao.updateSupplierVO(supplierVO);
	}
	public void setSupplierDao(final SupplierDao supplierDao){
		this.supplierDao=supplierDao;
	}

}
