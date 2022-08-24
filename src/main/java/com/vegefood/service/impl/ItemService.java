package com.vegefood.service.impl;

import com.vegefood.dao.IItemDAO;
import com.vegefood.model.ItemModel;
import com.vegefood.service.IItemService;
import java.util.List;
import javax.inject.Inject;

public class ItemService implements IItemService {
    
    @Inject
    private IItemDAO itemDao;
    
    @Override
    public List<ItemModel> findItemByCartId(Long cartId) {
        return itemDao.findItemByCartId(cartId);
    }

    @Override
    public void deleteItembyProductId(Long pid) {
        itemDao.deleteItembyProductId(pid);
    }
}
