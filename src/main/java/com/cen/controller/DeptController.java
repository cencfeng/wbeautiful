package com.cen.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cen.entity.Dept;
import com.cen.service.DeptService;

@Controller
@RequestMapping("/dept")
public class DeptController {

	@Autowired
	DeptService deptService;
	@RequestMapping("/getdept")
	@ResponseBody
	public List<Dept> getdept(){
		List<Dept> list = deptService.getDept();
			return list;
		
	}
	
}
