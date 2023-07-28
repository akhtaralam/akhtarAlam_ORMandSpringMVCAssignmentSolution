package com.greatLearning.customerManagement.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.greatLearning.customerManagement.entity.Customer;

@Repository
public class CustomerServiceImpl implements CustomerService {

	private SessionFactory sessionFactory;

	// create session
	private Session session;

	@Autowired
	CustomerServiceImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();

		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
	}

	@Transactional
	public List<Customer> getCustomers() {
		Transaction tx = session.beginTransaction();

		// find all the records from the database table
		List<Customer> customers = session.createQuery("from Customer").list();
		tx.commit();
		return customers;
	}

	@Transactional
	public Customer getCustomer(int id) {
		Customer customer = new Customer();
		Transaction tx = session.beginTransaction();

		// find record with id from the database table
		customer = session.get(Customer.class, id);
		tx.commit();
		return customer;
	}

	@Transactional
	public void saveCustomer(Customer theCustomer) {
		Transaction tx = session.beginTransaction();

		// save transaction
		session.saveOrUpdate(theCustomer);
		tx.commit();
	}

	@Transactional
	public Customer deleteCustomer(int id) {
		Transaction tx = session.beginTransaction();

		// get transaction
		Customer customer = session.get(Customer.class, id);

		// delete record
		session.delete(customer);
		tx.commit();
		return customer; // added explicitly as it was throwing error

	}

}
