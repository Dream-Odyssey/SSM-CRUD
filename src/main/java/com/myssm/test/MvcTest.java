package com.myssm.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.myssm.bean.Employee;

/**
 * 使用spring测试模块提供的测试请求功能
 * @author Echo
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MvcTest {
		@Autowired
		WebApplicationContext context;
		//虚拟Mvc请求，获取到处理结果
		MockMvc mockMvc;
		@Before
		public void initMokcMvc() {
			mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
			
		}
		@Test
		public void testPage() throws Exception {
			
			//模拟一个请求并且拿到返回值
		MvcResult result= mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5")).andReturn();
		//请求成功后，请求域中会有pageInfo;取出pageInfo进行验证
		MockHttpServletRequest httpServletRequest= result.getRequest();
		PageInfo pi= (PageInfo) httpServletRequest.getAttribute("PageInfo");
		System.out.println("当前页码："+pi.getPageNum());
		System.out.println("总页码："+pi.getPages());
		System.out.println("总记录数："+pi.getTotal());
		//获取员工数据
		List<Employee> list=pi.getList();
		for (Employee employee : list) {
			System.out.println("ID:"+employee.getEmpId()+"==>name:"+employee.getEmpName());
		}
		}
		
}
