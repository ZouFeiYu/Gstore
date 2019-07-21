package org.gdpi.store.dao;

import org.apache.ibatis.annotations.Param;
import org.gdpi.store.bean.User;

public interface UserDao {
	public void insertUser(@Param("user")User user);
	public User selectUserByName(String userName);
	public User selectUserByNameAndId(@Param("name")String userName,@Param("id")int id);
	public User selectUserByEmail(String email);
	public User selectUserByEmailAndId(@Param("email")String email,@Param("id")int id);
	public User selectUserByPhone(String phone);
	public User selectUserByPhoneAndId(@Param("phone")String phone,@Param("id")int id);
	public void updateUser(@Param("user")User user);
	public User selectUserById(int id);
	public void updataPassword(@Param("id")int id,@Param("password")String password);
}
