package com.cen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cen.entity.Position;
import com.cen.mapper.PositionMapper;
import com.cen.service.PositionService;
@Service
public class PositionServiceImpl implements PositionService {


	@Autowired
	 PositionMapper  positionMapper;
	@Override
	public List<Position> getPosition() {
		// TODO Auto-generated method stub
		return  positionMapper.getPosition();
	}

}
