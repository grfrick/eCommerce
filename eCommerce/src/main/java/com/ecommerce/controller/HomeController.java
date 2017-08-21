package com.ecommerce.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Product;


@Controller
public class HomeController {

	@Autowired
	private ProductDao productDao;

	@RequestMapping("/")
	public String home() {   
		return "home";   
	}

	@RequestMapping("/productList")
	public String getProducts(Model model) {
		List<Product> products = productDao.getAllProducts();
		model.addAttribute("products", products); //attaching products to model
		return "productList";   //the name of jsp page
	}

	@RequestMapping("/productList/viewProduct/{productID}")
	public String viewProduct(@PathVariable String productID, Model model) throws IOException{
		Product product = productDao.getProductByID(productID);
		model.addAttribute(product);
		return "viewProduct";
	}
}