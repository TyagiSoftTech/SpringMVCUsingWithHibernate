package com.mvc.dao;

import com.mvc.model.Employee;

import java.util.List;

public interface EmployeeDAO {
	
	 void addEmployee(Employee employee);
	
	 void updateEmployee(Employee employee);
	
	  Employee getEmployeeById(int id);
	
	  void removeEmployee(int id);
	
	  List<Employee> listEmployees();

}
