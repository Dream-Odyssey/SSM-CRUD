package com.myssm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myssm.bean.Employee;
import com.myssm.bean.Msg;
import com.myssm.service.EmployeeService;
@Controller
public class EmployeeController {	
		@Autowired
		EmployeeService employeeService;
		
		@ResponseBody
		@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
		public Msg deleteEmp(@PathVariable("ids")String ids) {
			if(ids.contains("-")) {
				List<Integer> del_ids=new ArrayList<Integer>();
				String[] str_ids=ids.split("-");
				for (String string : str_ids) {
					del_ids.add(Integer.parseInt(string));
				}
				employeeService.deleteBatch(del_ids);
				return Msg.sucess();
			}else {
				Integer id=Integer.parseInt(ids);
				employeeService.deleteEmp(id);
				return Msg.sucess();
			}
			
		}
		
		/**
		 * 员工信息更新
		 * @param employee
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="/emps/{empId}",method=RequestMethod.PUT)
		public Msg saveEmp(Employee employee) {
			employeeService.updateEmp(employee);
			return Msg.sucess();
		}
		/**
		 * 获得员工信息
		 * @param id
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
		public Msg getEmp(@PathVariable("id")Integer id) {
		Employee employee=employeeService.getEmp(id);
			return Msg.sucess().add("emp", employee);
		}
		/**
		 * 校验用户名是否存在
		 * @return
		 */
		@ResponseBody
		@RequestMapping("/checkUser")
		public Msg checkUser(@RequestParam("empName")String empName) {
			//校验用户名是否符合规范
			String regex="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
			if(!empName.matches(regex)) {
				return Msg.fail().add("va_msg", "用户名必须是2-5位中文或6-16位英文和数字的组合");
			};
			boolean b=employeeService.checkUser(empName);
			if(b) {
				return Msg.sucess();
			}else {
				return Msg.fail().add("va_msg", "用户名重复");
			}
		}
		/**
		 * 保存表单提交的员工信息
		 */
		@RequestMapping(value="/emp",method=RequestMethod.POST)
		@ResponseBody
		public Msg saveEmp(@Valid Employee employee,BindingResult result) {
			if(result.hasErrors()) {
				//校验失败，在模态框中显示校验失败的错误信息
				Map<Object, Object> map=new HashMap<Object, Object>();
				List<FieldError> fieldErrors = result.getFieldErrors();
				for (FieldError fieldError : fieldErrors) {
					System.out.println("错误字段："+fieldError.getField());
					System.out.println("错误信息："+fieldError.getDefaultMessage());
					map.put(fieldError.getField(),fieldError.getDefaultMessage());
				}
				return Msg.fail().add("errorFields", map);
			}else {
				employeeService.saveAll(employee);
				return Msg.sucess();
			}
			
		}	
		
		/**
		 * 查询员工数据、分页查询（需要调用service层）
		 * @return
		 */
		@RequestMapping("/emps")
		@ResponseBody
		public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1") Integer pn) {
			//在查询前使用pageHelper;传入页码以及每页查询几条记录
			PageHelper.startPage(pn, 5);			
		List<Employee> emps=employeeService.getAll();
		//查完以后使用pageInfo包装数据记录;可以传入连续显示的页数
		PageInfo page=new PageInfo(emps,5);
		return Msg.sucess().add("pageInfo", page);
		}
		
		
		//@RequestMapping("/emps")
//		public String getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model) {
//			
//			//在查询前使用pageHelper;传入页码以及每页查询几条记录
//			PageHelper.startPage(pn, 5);
//		List<Employee> emps=employeeService.getAll();
//		//查完以后使用pageInfo包装数据记录;可以传入连续显示的页数
//		PageInfo page=new PageInfo(emps,5);
//		model.addAttribute("pageInfo",page);		
//		
//			return "list";
//		}
}
