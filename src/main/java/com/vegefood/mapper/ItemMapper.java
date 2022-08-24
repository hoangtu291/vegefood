
package com.vegefood.mapper;

import com.vegefood.model.ItemModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ItemMapper implements RowMapper<ItemModel> {

    @Override
    public ItemModel mapRow(ResultSet resultSet) {
        try {
            ItemModel item = new ItemModel();
            item.setId(resultSet.getLong("id"));
            item.setProductId(resultSet.getLong("productid"));
            item.setCartId(resultSet.getLong("cartid"));
            item.setQuantity(resultSet.getLong("quantity"));
            item.setPrice(resultSet.getDouble("price"));
            return item;
        } catch (SQLException e) {
            return null;
        }
    }
    
}
