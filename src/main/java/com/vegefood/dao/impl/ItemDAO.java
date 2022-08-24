
package com.vegefood.dao.impl;

import com.vegefood.dao.IItemDAO;
import com.vegefood.mapper.ItemMapper;
import com.vegefood.model.ItemModel;
import java.util.List;

public class ItemDAO extends AbstractDAO<ItemModel> implements IItemDAO {

    @Override
    public List<ItemModel> findItemByCartId(Long cartId) {
        String sql = "SELECT * FROM item WHERE cartid = ?";
        return query(sql, new ItemMapper(), cartId);
    }

    @Override
    public void deleteItembyProductId(Long pid) {
        String sql = "DELETE FROM item WHERE productid = ?";
        update(sql, pid);
    }
    
}
