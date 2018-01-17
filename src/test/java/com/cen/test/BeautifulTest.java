package com.cen.test;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cen.entity.Menu;
import com.cen.mapper.MenuMapper;

public class BeautifulTest {

	private SqlSessionFactory sqlSessionFactory;
	private SqlSession sqlSession; 
	@Before
	public void before() {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"classpath:spring/applicationContext.xml",
				"classpath:mybatis-config.xml","classpath:spring/springMVC.xml"});
		sqlSessionFactory = (SqlSessionFactory)context.getBean("sqlSession");
		sqlSession = sqlSessionFactory.openSession();			
	}
	@Test
	public void getMenuTest() throws Exception{
		MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);
		List<Menu> list = menuMapper.getMenu();
		for (Menu menu : list) {
			System.out.println(menu.getM_name());
		}
	}
}
