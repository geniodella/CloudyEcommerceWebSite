package com.template.bo.virtualCart;

import java.util.List;

import com.template.form.CheckAvailabilitesForm;
import com.template.form.OrderForm;
import com.template.form.ProductDetails;
import com.template.vo.CustomerVO;
import com.template.vo.OrderVO;
import com.template.vo.ProductVO;
import com.template.vo.VirtualCartVO;

public interface VirtualCartService {
	
	VirtualCartVO findVirtualCartById(int id);

	void insertVirtualCartVO(VirtualCartVO virtualCartVO);

	void updateVirtualCartVO(VirtualCartVO virtualCartVO);

	List<VirtualCartVO> getAllVirtualCartVOs(int size, int page);
	
	public  CheckAvailabilitesForm checkProductAvailabilities(VirtualCartVO virtualCartVO );
	
	public void removeProductIntoCart(int productId, VirtualCartVO virtualCartVO);
	
	
	List<VirtualCartVO> getAllVirtualCartVOs();

	void removeVirtualCartVO(VirtualCartVO virtualCartVO);
	
	  void refreshVirtualCart(VirtualCartVO virtualCartVO);
	
	
	 VirtualCartVO findVirtualCartVOByCustomer(int customerId);
	 
	 
	   public ProductVO insertProductIntoCart(int productId, VirtualCartVO virtualCartVO, long productQuantity);
	   
	   public List<ProductDetails> retrieveProducts(VirtualCartVO virtualCartVO);
	   
	   public double calculatePartialPrice(List<ProductDetails> prodDetails);
	   
	   public OrderVO lockProductQuantities(CustomerVO customerVO, VirtualCartVO virtualCartVO );
	   
	   public int changeQuantity(int productId, long productQuantity, VirtualCartVO virtualCartVO);
	
	   public OrderForm retrievePrice(VirtualCartVO virtualCartVO);

}
