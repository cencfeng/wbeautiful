package com.cen.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cen.entity.Dormitory;
import com.cen.entity.UserDetail;
import com.cen.service.DormitoryService;

@Controller
@RequestMapping("/dormitory")
public class DormitoryController {

	@Autowired
	DormitoryService dormitoryService;
	@RequestMapping("/getDormitory")
	@ResponseBody
	public List<Dormitory> getMenu(){
		List<Dormitory> list = dormitoryService.getDormitory();
		return list;
	}
	@RequestMapping("/getAllRoom")
	@ResponseBody
	public List<Dormitory> getAllRoom(String strDormitory){
		List<Dormitory> list = dormitoryService.getAllRoom(strDormitory);
		return list;
	}
	@RequestMapping("/getLeftRoom")
	@ResponseBody
	public List<Dormitory> getLeftRoom(String strDormitory){
		List<Dormitory> list = dormitoryService.getLeftRoom(strDormitory);
		return list;
	}
	@RequestMapping("/getDormitoryliveinfo")
	@ResponseBody
	public List<UserDetail> getDormitoryliveinfo(String strDormitorynumber,String strRoomnumber){   
	    List<UserDetail> list = dormitoryService.getDormitoryliveinfo(strDormitorynumber, strRoomnumber);	
	    return list;
	}
	@RequestMapping("/applyDormitory")
	@ResponseBody
	public void applyDormitory(String username,String name,String dormitory,String roomNumber) {
		dormitoryService.applyDormitory(username,name,dormitory,roomNumber);
	}
}
