package com.ecommerce.service;

import com.ecommerce.model.Product;

import java.util.List;

public interface ProductService  {

    List<Product> getProductList();

    Product getProductById(int id);

    void addProduct(Product product);

    void editProduct(Product product);

    void deleteProduct(Product product);

    List<Product> getProductByName(String productName);
}
