package com.ecommerce.controller;

import com.ecommerce.model.BillingAddress;
import com.ecommerce.model.Customer;
import com.ecommerce.model.ShippingAddress;
import com.ecommerce.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.List;

@Controller
public class RegistrerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/register")
    public String registerCustomer(Model model) {
        Customer customer = new Customer();
        BillingAddress billingAddress = new BillingAddress();
        ShippingAddress shippingAddress = new ShippingAddress();
        customer.setBillingAddress(billingAddress);
        customer.setShippingAddress(shippingAddress);

        model.addAttribute("customer", customer);

        return "registerCustomer";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerCustomerPost(@Valid @ModelAttribute("customer") Customer customer, BindingResult bidingResult, Model model) {

        if (bidingResult.hasErrors()) {
            return "registerCustomer";
        }

        List<Customer> customerList = customerService.getAllCustumers();

        Customer result = customerList.stream()
                .filter(x -> customer.getCustomerEmail().equals(x.getCustomerEmail()))
                .findAny()
                .orElse(null);

        if (null != result) {
            model.addAttribute("emailMsg", "E-mail ja cadastrado");
            return "registerCustomer";
        }

        result = customerList.stream()
                .filter(x -> customer.getUsername().equals(x.getUsername()))
                .findAny()
                .orElse(null);

        if (null != result) {
            model.addAttribute("usernameMsg", "Usuario ja cadastrado");
            return "registerCustomer";
        }


        customer.setEnabled(true);
        customerService.addCustomer(customer);

        return "registerCustomerSuccess";
    }
}
