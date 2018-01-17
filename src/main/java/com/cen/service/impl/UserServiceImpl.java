package com.cen.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cen.entity.User;
import com.cen.entity.UserDetail;
import com.cen.mapper.UserMapper;
import com.cen.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	
	public User getUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.getUser(user);
	}
	@Override
	public List<User> getUsertest() {
		// TODO Auto-generated method stub
		
		return userMapper.getUsertest();
	}
	@Override
	public UserDetail exitUser(String username,String name) {
		// TODO Auto-generated method stub
		UserDetail userDetail=userMapper.exitUser(username,name);
		return userDetail;
				
	}
	@Override
	public void applyAccount(UserDetail userDetail) {
		// TODO Auto-generated method stub
		userMapper.applyAccount(userDetail);
	}

}
