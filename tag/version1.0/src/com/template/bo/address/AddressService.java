package com.template.bo.address;

import java.util.List;

import com.template.form.AddressForm;
import com.template.vo.AddressVO;
import com.template.vo.CustomerVO;

/**
 * @author francesco.dibartolo
 *
 */
public interface AddressService {
	
	AddressVO findAddressById(int id);

	Integer insertAddressVO(AddressVO addressVO,CustomerVO customerVO);

	void updateAddressVO(AddressVO addressVO);

	List<AddressVO> getAllAddressVOs(int size, int page);
	
	
	List<AddressVO> getAllAddressVOs();

	void removeAddressVO(int addressId);
	
	
	public List<AddressForm> retrieveAddressesByCustomer(CustomerVO customerVO);
	

}
