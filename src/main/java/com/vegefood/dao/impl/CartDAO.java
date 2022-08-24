package com.vegefood.dao.impl;

import com.vegefood.dao.ICartDAO;
import com.vegefood.mapper.CartMapper;
import com.vegefood.model.CartModel;
import com.vegefood.model.ProductModel;
import java.util.List;

public class CartDAO extends AbstractDAO<CartModel> implements ICartDAO {

    @Override
    public Long addToCart(ProductModel product, Long cartId, Long quantity) {
        String sql = "INSERT INTO item(productid, cartid, quantity, price) VALUES(?, ?, ?, ?)";
        return insert(sql, product.getId(), cartId, quantity, product.getPriceleft());
    }

    @Override
    public List<CartModel> findCartByUserId(Long userId) {
        String sql = "SELECT * FROM cart WHERE userid = ?";
        return query(sql, new CartMapper(), userId);
    }

    @Override
    public void updateQuantityProductToCart(Long itemId, Long quantity) {
        String sql = "UPDATE item SET quantity = ? WHERE id = ?";
        update(sql, quantity, itemId);
    }

    @Override
    public Long createCart() {
        String sql = "INSERT INTO cart() VALUES()";
        return insert(sql);
    }
    
    
}
