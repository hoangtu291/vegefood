package com.vegefood.service.impl;

import com.vegefood.dao.ICartDAO;
import com.vegefood.model.CartModel;
import com.vegefood.model.ProductModel;
import com.vegefood.service.ICartService;
import java.util.List;
import javax.inject.Inject;

public class CartService implements ICartService{
    
    @Inject
    private ICartDAO cartDao;

    @Override
    public List<CartModel> findCartByUserId(Long userId) {
        return cartDao.findCartByUserId(userId);
    }

    @Override
    public Long addToCart(ProductModel product, Long userId, Long quantity) {
        return cartDao.addToCart(product, userId, quantity);
    }

    @Override
    public void updateQuantityProductToCart(Long itemId, Long quantity) {
        cartDao.updateQuantityProductToCart(itemId, quantity);
    }

    @Override
    public Long createCart() {
        return cartDao.createCart();
    }

}
