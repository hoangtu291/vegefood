
package com.vegefood.dao;

import com.vegefood.model.ItemModel;
import java.util.List;

public interface IItemDAO {
    List<ItemModel> findItemByCartId(Long cartId);

    void deleteItembyProductId(Long pid);
}
