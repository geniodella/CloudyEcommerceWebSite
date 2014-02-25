package com.template.bo.deliveryCompany;

import java.util.HashMap;
import java.util.List;

import com.template.form.DeliveryStrategyCompanyForm;
import com.template.form.DeliveryStrategyForm;
import com.template.form.ShippingForm;
import com.template.vo.DeliveryCompanyVO;
import com.template.vo.PriceRangeVO;
import com.template.vo.VirtualCartProductRelationVO;

public interface DeliveryCompanyService {
	
	public HashMap<String,DeliveryStrategyCompanyForm> getAllDeliveryCompanyVOs();
	
	public DeliveryCompanyVO findDeliveryCompanyVOById(final long id);
	
	public List<ShippingForm> checkSplitShipping(List<VirtualCartProductRelationVO> products);
	
	void insertDeliveryCompanyVO(final DeliveryCompanyVO deliveryCompanyVO, String[] fromRange,
			String[] toRange,String[] price);
	
	
	void updateDeliveryCompanyVO(DeliveryCompanyVO deliveryCompanyVO);
	
	public DeliveryStrategyForm findDeliveryCompanyFormById(final long id);
	
	
	
	
	
	List<DeliveryCompanyVO> getAllDeliveryCompanyVOs(final int pageSize, final int pageNumber);
	
	void removeDeliveryCompanyVO(DeliveryCompanyVO deliveryCompanyVO);
	
	int getNumberDeliveryCompanies();
	
	public List<PriceRangeVO> getPriceRangesByDeliveryCompany(long deliveryCompanyId);

	public void updatePriceRanges(final DeliveryCompanyVO deliveryCompanyVO, 
			String[] fromRange, String[] toRange,String[] price,String[] priceRangeId);
	
	
	public List<ShippingForm> splitShipping(List<VirtualCartProductRelationVO> products, int splittingDecision);
	
}
