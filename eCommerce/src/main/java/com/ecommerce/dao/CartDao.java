package com.ecommerce.dao;


import com.ecommerce.model.Cart;

public interface CartDao {

	Cart getCartById(int cartId);

	void update(Cart cart);
}
