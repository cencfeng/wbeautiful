package com.cen.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cen.entity.Menu;
import com.cen.mapper.MenuMapper;

import com.cen.service.MenuService;
@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuMapper menuMapper;
	
	@Override
	public List<Menu> getMenu() {
		// TODO Auto-generated method stub
		
		
		List<Menu>	list = menuMapper.getMenu();
		
		
		return list;
	}
	@Override
	public List<Menu> getSubMenu(int mid) {
		// TODO Auto-generated method stub
		
	
		List<Menu>	list = menuMapper.getSubMenu(mid);
			
		return list;
	}
	@Override
	public void insertMenu(String m_name, String m_url, String m_order,String parentid,String m_level) {
		// TODO Auto-generated method stub
		menuMapper.insertMenu(m_name,m_url,m_order,parentid,m_level);
	}
	@Override
	public void delMenu(int mid) {
		// TODO Auto-generated method stub
		menuMapper.delMenu(mid);
	}

}
