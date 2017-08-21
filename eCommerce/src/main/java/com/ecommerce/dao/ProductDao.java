package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.model.Product;

public interface ProductDao {
	
	void addProduct(Product product);
	void editProduct(Product product);
	Product getProductByID(String productID);
	List<Product> getAllProducts();
	void deleteProduct(String id);
}
