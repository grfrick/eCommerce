package com.ecommerce.dao;


import com.ecommerce.model.Cart;

import java.io.IOException;

public interface CartDao {

	Cart getCartById(int cartId);

	void update(Cart cart);

	Cart validate(int cartId) throws IOException;
}
