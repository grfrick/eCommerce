package com.ecommerce.service;

import com.ecommerce.model.Cart;

public interface CartService {

    Cart getCartById(int cartId);

    void update(Cart cart);
}
