
package com.vegefood.service;

import com.vegefood.model.ItemModel;
import java.util.List;

public interface IItemService {
    List<ItemModel> findItemByCartId(Long cartId);
    void deleteItembyProductId(Long pid);
}
