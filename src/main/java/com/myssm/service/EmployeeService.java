package com.myssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myssm.bean.Employee;
import com.myssm.bean.EmployeeExample;
import com.myssm.bean.EmployeeExample.Criteria;
import com.myssm.dao.EmployeeMapper;
@Service
public class EmployeeService {
	@Autowired
	EmployeeMapper employeeMapper;
	
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		return employeeMapper.selectByExampleWithDept(null);
	}
	/**
	 * 员工保存方法
	 * @param employee
	 */
	public void saveAll(Employee employee) {
		employeeMapper.insertSelective(employee);
		// TODO Auto-generated method stub
		
	}
	/**
	 * 检查用户名是否存在
	 * @param empName
	 * @return
	 */
	public boolean checkUser(String empName) {
		EmployeeExample example= new EmployeeExample();
		Criteria criteria=example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count=employeeMapper.countByExample(example);
		return count==0;
	}
	/**
	 * 新的方法
	 * @return
	 */
	public Employee getEmp(Integer id) {
		// TODO Auto-generated method stub
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}
	public void updateEmp(Employee employee) {
		employeeMapper.updateByPrimaryKeySelective(employee);
		// TODO Auto-generated method stub
		
	}
	public void deleteEmp(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
		// TODO Auto-generated method stub
		
	}
	public void deleteBatch(List<Integer> del_ids) {
		// TODO Auto-generated method stub
		EmployeeExample example=new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(del_ids);
		employeeMapper.deleteByExample(example);
	}

}
