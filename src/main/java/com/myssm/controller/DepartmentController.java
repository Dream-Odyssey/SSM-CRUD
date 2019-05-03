package com.myssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myssm.bean.Department;
import com.myssm.bean.Msg;
import com.myssm.service.DepartmentService;
/**
 * 处理和部门有关的请求
 * @author Echo
 *
 */
@Controller
public class DepartmentController {
		@Autowired
		private DepartmentService departmentService;
	@RequestMapping("/depts")
	@ResponseBody	
	public Msg getDepts() {
		List<Department> list= departmentService.getDepts();
		return Msg.sucess().add("depts", list);
	}
}
