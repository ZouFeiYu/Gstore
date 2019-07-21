package org.gdpi.store.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.gdpi.store.bean.Address;
import org.gdpi.store.dao.AddressDao;
import org.gdpi.store.service.AddressService;
import org.gdpi.store.service.ex.DBInteractionException;
import org.springframework.stereotype.Service;

@Service
public class AddressServiceImpl implements AddressService {
	@Resource
	AddressDao addressDao;

	@Override
	public List<Address> selectAddress(int userId) {
		try {
			return addressDao.selectAllAddressByUserId(userId);
		} catch (Exception e) {
			throw new DBInteractionException(e.getMessage());
		}
	}
	@Override
	public boolean insertAddress(Address address) {
		try {
			addressDao.insertAddress(address);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public Address selectAddressById(int userId) {
		try {
			return addressDao.selectAddressById(userId);
		} catch (Exception e) {
			throw new DBInteractionException(e.getMessage());
		}
	}
	@Override
	public boolean updateAddress(Address address) {
		try {
			addressDao.updateAddress(address);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public boolean updateState(int state,int id) {
		try {
			addressDao.updateState(state,id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	public boolean setAddrDefault(int addrId, int userId) {
		try {
			addressDao.setAddrDefault(addrId, userId);
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}
}
