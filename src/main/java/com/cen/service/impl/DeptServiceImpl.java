package com.cen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.cen.entity.Dept;
import com.cen.mapper.DeptMapper;
import com.cen.service.DeptService;
@Service
public class DeptServiceImpl implements DeptService {


	@Autowired
	DeptMapper deptMapper;

	@Override
	public List<Dept> getDept() {
		// TODO Auto-generated method stub
		return deptMapper.getDept();
	}

}
