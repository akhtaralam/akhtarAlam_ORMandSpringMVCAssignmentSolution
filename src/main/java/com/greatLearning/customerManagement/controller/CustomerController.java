package com.greatLearning.customerManagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatLearning.customerManagement.entity.Customer;
import com.greatLearning.customerManagement.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	CustomerService customerService;

	@RequestMapping("/list")
	public String listCustomers(Model theModel) {
		List<Customer> theCustomers = customerService.getCustomers();
		theModel.addAttribute("customers", theCustomers);
		return "list-customers";
	}

	@RequestMapping("/showFormForAdd")
	public String addCustomer(Model theModel) {
		Customer theCustomer = new Customer();
		theModel.addAttribute("customer", theCustomer);
		return "customer-form";
	}

	@RequestMapping("/showFormForUpdate")
	public String updateCustomer(@RequestParam("id") int id, Model theModel) {

		// get the customer from the service
		Customer theCustomer = customerService.getCustomer(id);

		// set Customer as a model attribute to pre-populate the form
		theModel.addAttribute("customer", theCustomer);

		// send over to our form
		return "customer-form";
	}

	@RequestMapping("/delete")
	public String deleteCustomer(@RequestParam("id") int theId) {

		// delete the customer
		customerService.deleteCustomer(theId);

		// redirect to /customer/list
		return "redirect:/customer/list";
	}

	@PostMapping("/saveCustomer")
	public String saveCustomer(@RequestParam("id") int id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("email") String email) {

		Customer customer;
		if (id != 0) {
			customer = customerService.getCustomer(id);
			customer.setFirstName(firstName);
			customer.setLastName(lastName);
			customer.setEmail(email);
		} else {
			customer = new Customer();
		}
		customer.setFirstName(firstName);
		customer.setLastName(lastName);
		customer.setEmail(email);

		// save the customer
		customerService.saveCustomer(customer);

		// use a redirect to prevent duplicate submissions
		return "redirect:/customer/list";
	}

}
