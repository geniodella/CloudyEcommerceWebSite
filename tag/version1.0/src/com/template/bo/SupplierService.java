package com.template.bo;

import java.util.List;

import com.template.vo.SupplierVO;

public interface SupplierService {
	
	SupplierVO findSupplierById(int id);
	
	void insertSupplierVO(SupplierVO supplierVO);
	
	void updateSupplierVO(SupplierVO supplierVO);
	
	List getAllSupplierVOs(int size, int page);
	
	void removeSupplierVO(SupplierVO supplierVO);

}
