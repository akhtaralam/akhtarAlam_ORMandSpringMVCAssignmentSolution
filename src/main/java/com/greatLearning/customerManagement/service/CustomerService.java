package com.greatLearning.customerManagement.service;

import java.util.List;

import com.greatLearning.customerManagement.entity.Customer;

public interface CustomerService {

	public List<Customer> getCustomers();

	public void saveCustomer(Customer theCustomer);

	public Customer getCustomer(int theId);

	public Customer deleteCustomer(int theId);
}
