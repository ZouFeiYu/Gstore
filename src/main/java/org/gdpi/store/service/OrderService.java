package org.gdpi.store.service;

import java.util.List;

import org.gdpi.store.bean.Order;
import org.gdpi.store.bean.OrderForm;

public interface OrderService {
	public  List<OrderForm> selectGoodToOrder(List<OrderForm> ofs);
	public boolean addOrder(String orderId,int userId,int addrId,int status,List<OrderForm> ofs);
	public List<Order> selectByUserId(int userId);
	public boolean updateOrderStatus(String orderId,int status);
}
