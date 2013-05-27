package com.template.bo.address;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.template.dao.address.AddressDao;
import com.template.dao.customer.CustomerDao;
import com.template.form.AddressForm;
import com.template.vo.AddressVO;
import com.template.vo.CustomerVO;

public class AddressServiceImpl implements AddressService {
	
	AddressDao addressDao;
	
	CustomerDao customerDao;
	


	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	public AddressDao getAddressDao() {
		return addressDao;
	}

	/**
	 * findAddressById
	 * 
	 * @param id
	 *            int
	 * @return AddressVO
	 * @todo Implement this org.annotationmvc.service.AddressService method
	 */
	public AddressVO findAddressById(final int id) {
		return addressDao.findAddressById(id);
	}

	/**
	 * getAllAddressVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.AddressService method
	 */
	public List getAllAddressVOs(int size, int page) {
		return addressDao.getAllAddressVOs(size,page);
	}
	
	
	/**
	 * getAllAddressVOs
	 * 
	 * @return List
	 * @todo Implement this org.annotationmvc.service.AddressService method
	 */
	public List getAllAddressVOs() {
		return addressDao.getAllAddressVOs();
	}

	/**
	 * insertAddressVO
	 * 
	 * @param addressVO
	 *            AddressVO
	 * @todo Implement this org.annotationmvc.service.AddressService method
	 */
	public Integer insertAddressVO( AddressVO addressVO, CustomerVO customerVO) {
		
		customerVO = customerDao.mergeCustomer(customerVO);
		
		Integer addressId = addressDao.insertAddressVO(addressVO);
		
		customerVO.getAddresses().add(addressVO);
		
		customerDao.updateCustomerVO(customerVO);
		
		return addressId;
	}

	/**
	 * removeAddressVO
	 * 
	 * @param addressVO
	 *            AddressVO
	 * @todo Implement this org.annotationmvc.service.AddressService method
	 */
	public void removeAddressVO(final int addressId) {
		AddressVO addressVO = addressDao.findAddressById(addressId);
		addressDao.removeAddressVO(addressVO);
	}
	
	

	public List<AddressForm> retrieveAddressesByCustomer(CustomerVO customerVO){
		Set<AddressVO> addresses = customerVO.getAddresses();
		List<AddressForm> formAddresses = new ArrayList<AddressForm>();
		
		for (AddressVO addressVO : addresses) {
			AddressForm addressForm = new AddressForm();
			addressForm.setCityName(addressVO.getCityVO().getNameCity());
			addressForm.setRegionName(addressVO.getRegionVO().getNameRegion());
			addressForm.setStateName(addressVO.getStateVO().getNameState());
			addressForm.setFullname(addressVO.getFullname());
			addressForm.setStreet(addressVO.getStreet());
			addressForm.setPoBox(addressVO.getPoBox());
			addressForm.setPhoneNumber(addressVO.getPhoneNumber());
			addressForm.setAddressId(addressVO.getAddressId());
			
			formAddresses.add(addressForm);
			
			
		}
		
		return formAddresses;
		
		
	}

	/**
	 * updateAddressVO
	 * 
	 * @param addressVO
	 *            AddressVO
	 * @todo Implement this org.annotationmvc.service.AddressService method
	 */
	public void updateAddressVO(final AddressVO addressVO) {
		addressDao.updateAddressVO(addressVO);
	}

	public void setAddressDao(final AddressDao addressDao) {
		this.addressDao = addressDao;
	}
	
	
	
}
