package com.vegefood.mapper;

import com.vegefood.model.CartModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartMapper implements RowMapper<CartModel> {

    @Override
    public CartModel mapRow(ResultSet resultSet) {
        try {
            CartModel cart = new CartModel();
            cart.setId(resultSet.getLong("id"));
            cart.setUserId(resultSet.getLong("userid"));
            return cart;
        } catch (SQLException e) {
            return null;
        }
    }
}
