package org.gdpi.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.gdpi.store.bean.Address;

public interface AddressDao {
	public List<Address> selectAllAddressByUserId(@Param("id") int userId);

	public void insertAddress(@Param("address") Address address);

	public Address selectAddressById(@Param("id") int id);

	public void updateAddress(Address address);
	
	public void updateState(@Param("state") int state, @Param("id") int id);
	
	public void setAddrDefault(@Param("addrId")int addrId,@Param("userId")int userId);
}
