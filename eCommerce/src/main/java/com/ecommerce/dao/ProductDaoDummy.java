package com.ecommerce.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.ecommerce.model.Product;

public class ProductDaoDummy {
	private List<Product> productList;
	
	public List<Product> getProductList(){
		Product product1 = new Product();
		product1.setProductId(3);
		product1.setProductName("iphone");
		product1.setProductCategory("smartphone");
		product1.setProductDescription("Sensacional");
		product1.setProductPrice(1200);
		product1.setProductCondition("novo");
		product1.setProductStatus("Ativo");
		product1.setUnitInStock(11);
		product1.setProductManufacturer("Apple");
		
		Product product2 = new Product();
		product2.setProductId(2);
		product2.setProductName("MacBook");
		product2.setProductCategory("notebook");
		product2.setProductDescription("Que maquina");
		product2.setProductPrice(2500);
		product2.setProductCondition("novo");
		product2.setProductStatus("Ativo");
		product2.setUnitInStock(50);
		product2.setProductManufacturer("Apple");
		
		Product product3 = new Product();
		product3.setProductId(1);
		product3.setProductName("Ipad");
		product3.setProductCategory("tablet");
		product3.setProductDescription("aquele portatil joiaa");
		product3.setProductPrice(355);
		product3.setProductCondition("novo");
		product3.setProductStatus("Ativo");
		product3.setUnitInStock(9);
		product3.setProductManufacturer("Apple");
		
		productList = new ArrayList<Product>();
		productList.add(product1);
		productList.add(product2);
		productList.add(product3);
		return productList;
	}

	public Product getProductByID(int productId) throws IOException {
		for (Product product : getProductList()) {
			if (product.getProductId() == productId) {
				return product;
			}
		}
		throw new IOException("Nenhum Produto Encontrado");
	}
}
