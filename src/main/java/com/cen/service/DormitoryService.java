package com.cen.service;

import java.util.List;

import com.cen.entity.Dormitory;
import com.cen.entity.UserDetail;


public interface DormitoryService {

	List<Dormitory> getDormitory();
	List<Dormitory> getAllRoom(String strDormitory);
	List<Dormitory> getLeftRoom(String strDormitory);
	List<UserDetail> getDormitoryliveinfo(String strDormitorynumber,String strRoomnumber);
	void applyDormitory(String username,String name,String dormitory,String roomNumber);
}
