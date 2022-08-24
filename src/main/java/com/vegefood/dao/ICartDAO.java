package com.vegefood.dao;

import com.vegefood.model.CartModel;
import com.vegefood.model.ProductModel;
import java.util.List;

public interface ICartDAO {
    Long addToCart(ProductModel product, Long userId, Long quantity);
    List<CartModel> findCartByUserId(Long userId);
    void updateQuantityProductToCart(Long itemId, Long quantity);
    Long createCart();
}
