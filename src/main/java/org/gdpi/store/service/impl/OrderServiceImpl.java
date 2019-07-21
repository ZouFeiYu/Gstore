package org.gdpi.store.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.gdpi.store.bean.Order;
import org.gdpi.store.bean.OrderForm;
import org.gdpi.store.dao.OrderDao;
import org.gdpi.store.service.OrderService;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {
	@Resource
	OrderDao orderDao;

	@Override
	public List<OrderForm> selectGoodToOrder(List<OrderForm> ofs) {
		List<String> ids = new ArrayList<>();
		for (OrderForm of : ofs) {
			ids.add(of.getId());
		}
		List<OrderForm> dbOfs = orderDao.selectGoodInfoToOrder(ids);
		for (OrderForm of : ofs) {
			for (OrderForm dbOf : dbOfs) {
				if (of.getId().equals(dbOf.getId())) {
					dbOf.setCount(of.getCount());
				}
			}
		}
		return dbOfs;
	}

	@Override
	public boolean addOrder(String orderId, int userId, int addrId, int status, List<OrderForm> ofs) {
		try {
			orderDao.addOrder(orderId, userId, addrId, status, ofs);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public List<Order> selectByUserId(int userId) {
		return orderDao.selectByUserId(userId);
	}

	@Override
	public boolean updateOrderStatus(String orderId, int status) {
		try {
			orderDao.updateOrderStatus(orderId, status);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

}
