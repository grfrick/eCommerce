package com.ecommerce.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ecommerce.dao.CartDao;
import com.ecommerce.model.Cart;

@Repository
public class CartDaoImpl implements CartDao{

	private Map<String, Cart> listOfCarts;

	public CartDaoImpl() {
		listOfCarts = new HashMap<String, Cart>();
	}
	
	public Cart create(Cart cart) {
		if(listOfCarts.keySet().contains(cart.getCartId())) {
			throw new IllegalArgumentException(
					String.format("Nao foi possivel criar um carrinho. O carrinho com o id(%) ja existe.", cart.getCartId()));
		}

		listOfCarts.put(cart.getCartId(), cart);
		return cart;
	}

	public Cart read(String cartId) {
		return listOfCarts.get(cartId);
	}

	public void update(String cartId, Cart cart) {
		if(!listOfCarts.keySet().contains(cartId)) {
			throw new IllegalArgumentException(
					String.format("Nap foi possivel atualizar o carrinho. O carrinho com o id(%) nao existe.", cart.getCartId()));
		}

		listOfCarts.put(cartId, cart);
	}

	public void delete(String cartId) {
		if(!listOfCarts.keySet().contains(cartId)) {
			throw new IllegalArgumentException(
					String.format("Nao foi possivel deletar o carrinho. O carrinho com o  id(%) nao existe.", cartId));
		}

		listOfCarts.remove(cartId);
	}
}