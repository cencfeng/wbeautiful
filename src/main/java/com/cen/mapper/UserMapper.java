package com.cen.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cen.entity.User;
import com.cen.entity.UserDetail;

public interface UserMapper {

	User getUser(User user);

	List<User> getUsertest();

	UserDetail exitUser(@Param("username")String username, @Param("name")String name);

	void applyAccount(UserDetail userDetail);
}
