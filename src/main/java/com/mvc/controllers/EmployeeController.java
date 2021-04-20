package com.mvc.controllers;

import com.mvc.model.Employee;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mvc.service.EmployeeService;


@Controller
public class EmployeeController {

	private static final Logger logger = Logger.getLogger(EmployeeController.class);
	@Autowired
	private EmployeeService employeeService;

	@RequestMapping(value = "/employee", method = RequestMethod.GET)
	public String listemployees(Model model) {
		logger.info("This is info message");
		model.addAttribute("employee", new Employee());
		model.addAttribute("employeeList", employeeService.listEmployees());
		return "employee";
	}


	@RequestMapping(value = "/employee/add", method = RequestMethod.POST)
	public String addemployee(@ModelAttribute("employee") Employee employee) {

		if (employee.getEmployeeId()==null || employee.getEmployeeId() == 0) {

			employeeService.addEmployee(employee);
		} else {

			employeeService.updateEmployee(employee);
		}

		return "redirect:/employee";

	}

	@RequestMapping("/employee/remove/{id}")
	public String removeemployee(@PathVariable("id") int id) {

		employeeService.removeEmployee(id);
		return "redirect:/employee";
	}

	@RequestMapping("/employee/edit/{id}")
	public String editemployee(@PathVariable("id") int id, Model model) {
		model.addAttribute("employee", employeeService.getEmployeeById(id));
		model.addAttribute("employeeList", employeeService.listEmployees());
		return "employee";
	}
}
