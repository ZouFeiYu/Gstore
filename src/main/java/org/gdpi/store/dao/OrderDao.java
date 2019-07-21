package org.gdpi.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.store.bean.Order;
import org.gdpi.store.bean.OrderForm;

public interface OrderDao {
	public List<OrderForm> selectGoodInfoToOrder(List<String> ids);

	public void addOrder(@Param("orderId") String orderId, @Param("userId") int userId, @Param("addrId") int addrId,
			@Param("status") int status, @Param("ofs") List<OrderForm> ofs);

	/**
	 * 根据用户ID查询订单
	 * 
	 * @param userId
	 * @return
	 */
	public List<Order> selectByUserId(@Param("userId") int userId);

	public void updateOrderStatus(@Param("orderId") String orderId, @Param("status") int status);
}
