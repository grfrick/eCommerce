package com.ecommerce.dao;

import com.ecommerce.model.Customer;

import java.util.List;

public interface CustomerDao {
    void addCustomer(Customer customer);

    Customer getCustumerById(int custumerId);

    List<Customer> getAllCustumers();

    Customer getCustomerByUserName(String username);
}
