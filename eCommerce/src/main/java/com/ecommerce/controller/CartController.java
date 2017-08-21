package com.ecommerce.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.ecommerce.dao.CartDao;
import com.ecommerce.dao.ProductDao;
import com.ecommerce.model.Cart;
import com.ecommerce.model.CartItem;
import com.ecommerce.model.Product;

@Controller
@RequestMapping("/rest/cart")
public class CartController {
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private ProductDao productDao;

	@RequestMapping(value="/{cartID}", method=RequestMethod.GET)
	public @ResponseBody Cart read (@PathVariable(value="cartID") String cartID) {
		return cartDao.read(cartID);
	}

	@RequestMapping(value="/{cartID}", method=RequestMethod.PUT)
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void update(@PathVariable(value = "cartID") String cartID, @RequestBody Cart cart) {
		cartDao.update(cartID, cart);
	}
	
	@RequestMapping(value="/{cartID}", method=RequestMethod.DELETE)
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void delete(@PathVariable(value = "cartID") String cartID) {
		cartDao.delete(cartID);
	}
	
	@RequestMapping(value="/add/{productID}", method=RequestMethod.PUT)
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void addItem(@PathVariable(value = "productID") String productID, HttpServletRequest req) {
		String sessionId = req.getSession(true).getId();
		Cart cart = cartDao.read(sessionId);

		if (null == cart) {
			cart = cartDao.create(new Cart(sessionId));
		}

		Product product = productDao.getProductByID(productID);
		if (null == product) {
			throw new IllegalArgumentException(new Exception());
		}
		cart.addCartItem(new CartItem(product));
		cartDao.update(sessionId, cart);
	}
	
	@RequestMapping(value="/remove/{productID}", method=RequestMethod.PUT)
	@ResponseStatus(value=HttpStatus.NO_CONTENT)
	public void removeItem(@PathVariable String productID, HttpServletRequest req) {
		String sessionId = req.getSession(true).getId();
		Cart cart = cartDao.read(sessionId);

		if (null == cart) {
			cart = cartDao.create(new Cart(sessionId));
		}

		Product product = productDao.getProductByID(productID);
		if (null == product) {
			throw new IllegalArgumentException(new Exception());
		}

		cart.removeCartItem(new CartItem(product));
		cartDao.update(sessionId, cart);
	}
	
	@ExceptionHandler(IllegalArgumentException.class)
	@ResponseStatus(value=HttpStatus.BAD_REQUEST, reason="Illegal request. Please verify your payload")
	public void handleClientError(Exception e) {}
	
	@ExceptionHandler(Exception.class)
	@ResponseStatus(value=HttpStatus.INTERNAL_SERVER_ERROR, reason="Internal Server Error: Http 500 Error")
	public void handleServerError(Exception e) {}
}
