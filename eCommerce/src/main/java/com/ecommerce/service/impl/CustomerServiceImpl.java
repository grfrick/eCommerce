package com.ecommerce.service.impl;

import com.ecommerce.dao.CustomerDao;
import com.ecommerce.model.Customer;
import com.ecommerce.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService{

    @Autowired
    private CustomerDao customerDao;

    public void addCustomer(Customer customer) {
        customerDao.addCustomer(customer);
    }

    public Customer getCustumerById(int custumerId) {
        return customerDao.getCustumerById(custumerId);
    }

    public List<Customer> getAllCustumers() {
        return customerDao.getAllCustumers();
    }

    public Customer getCustomerByUserName(String username) {
        return customerDao.getCustomerByUserName(username);
    }
}
