package com.cen.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cen.entity.*;
import com.cen.service.PositionService;

@Controller
@RequestMapping("/position")
public class PositionController {

	@Autowired
	PositionService positionService;
	@RequestMapping("/getposition")
	@ResponseBody
	public List<Position> getPosition(){
		List<Position> list = positionService.getPosition();
			return list;
		
	}
	
}
