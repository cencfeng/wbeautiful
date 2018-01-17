package com.cen.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.cen.entity.Dormitory;
import com.cen.entity.UserDetail;

public interface DormitoryMapper {

	List<Dormitory> getDormitory();
	List<Dormitory> getAllRoom(String strDormitory);
	List<Dormitory> getLeftRoom(String strDormitory);
	List<UserDetail> getDormitoryliveinfo(@Param("strDormitorynumber")String strDormitorynumber,@Param("strRoomnumber")String strRoomnumber);
	void applyDormitory(@Param("username")String username,@Param("name")String name,@Param("dormitory")String dormitory,@Param("roomNumber")String roomNumber);
}
