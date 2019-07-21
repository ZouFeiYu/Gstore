package org.gdpi.store.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.store.bean.Address;

public interface AddressService {
public List<Address> selectAddress(int userId);
public boolean insertAddress(Address address);
public Address selectAddressById(int userId);
public boolean updateAddress(Address address);
@Deprecated
public boolean updateState(int state,int id);
public boolean setAddrDefault(int addrId,int userId);
}
