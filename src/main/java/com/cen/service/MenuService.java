package com.cen.service;

import java.util.List;

import com.cen.entity.Menu;

public interface MenuService {

	List<Menu> getMenu();
	List<Menu> getSubMenu(int mid);
	void insertMenu(String m_name,String m_url,String m_order,String parentid,String m_level);
	void delMenu(int mid);
}
