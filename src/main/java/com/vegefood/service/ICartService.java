package com.vegefood.service;

import com.vegefood.model.CartModel;
import com.vegefood.model.ProductModel;
import java.util.List;

public interface ICartService {
    List<CartModel> findCartByUserId(Long userId);
    Long addToCart(ProductModel product, Long userId, Long quantity);
    void updateQuantityProductToCart(Long itemId, Long quantity);
    Long createCart();
}
