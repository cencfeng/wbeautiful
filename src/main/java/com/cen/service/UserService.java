package com.cen.service;

import java.util.List;

import com.cen.entity.User;
import com.cen.entity.UserDetail;

public interface UserService {

	User getUser(User user);
	
	List<User> getUsertest();
	
	UserDetail exitUser(String username,String name);
	
	void applyAccount(UserDetail userDetail);
}
