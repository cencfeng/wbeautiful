package com.cen.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cen.entity.Dormitory;
import com.cen.entity.UserDetail;
import com.cen.mapper.DormitoryMapper;
import com.cen.service.DormitoryService;

@Service
public class DormitoryServiceImpl implements DormitoryService {

	@Autowired
	DormitoryMapper dormitoryMapper;

	@Override
	public List<Dormitory> getDormitory() {
		// TODO Auto-generated method stub
		return dormitoryMapper.getDormitory();
	}

	@Override
	public List<Dormitory> getAllRoom(String strDormitory) {
		// TODO Auto-generated method stub
		return dormitoryMapper.getAllRoom(strDormitory);
	}

	@Override
	public List<UserDetail> getDormitoryliveinfo(String strDormitorynumber, String strRoomnumber) {
		// TODO Auto-generated method stub
		List<UserDetail> list =  dormitoryMapper.getDormitoryliveinfo(strDormitorynumber, strRoomnumber);
		return list;
	}

	@Override
	public List<Dormitory> getLeftRoom(String strDormitory) {
		// TODO Auto-generated method stub
		return dormitoryMapper.getLeftRoom(strDormitory);
	}

	@Override
	@Transactional
	public void applyDormitory(String username, String name, String dormitory, String roomNumber) {
		// TODO Auto-generated method stub
		dormitoryMapper.applyDormitory(username, name, dormitory, roomNumber);
	}
	
	

}
