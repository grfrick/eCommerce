package com.ecommerce.service;

import com.ecommerce.model.Customer;

import java.util.List;

public interface CustomerService {

    void addCustomer(Customer customer);

    Customer getCustumerById(int custumerId);

    List<Customer> getAllCustumers();

    Customer getCustomerByUserName(String username);
}
