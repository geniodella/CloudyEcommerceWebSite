package com.template.bo.jms;

import com.template.vo.OrderVO;

public interface JmsOrderService {
	
	public void sendOrder(final OrderVO orderVO);

}
