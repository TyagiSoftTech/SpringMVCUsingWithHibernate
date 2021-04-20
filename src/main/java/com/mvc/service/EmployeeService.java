package com.mvc.service;

import java.util.List;

import com.mvc.model.Employee;
import org.springframework.stereotype.Service;

@Service
public interface EmployeeService {
	
	void addEmployee(Employee employee);
	
	void updateEmployee(Employee employee);
	
	Object getEmployeeById(int id);
	
	void removeEmployee(int id);
	
	List<Employee> listEmployees();



}
