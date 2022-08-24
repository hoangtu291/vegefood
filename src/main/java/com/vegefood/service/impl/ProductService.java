/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.service.impl;

import com.vegefood.dao.IProductDAO;
import com.vegefood.model.ProductModel;
import com.vegefood.service.IItemService;
import com.vegefood.service.IProductService;
import java.util.List;
import javax.inject.Inject;

public class ProductService implements IProductService {
    
    @Inject
    private IProductDAO productDao;
    
    @Inject
    private IItemService itemService;

    @Override
    public List<ProductModel> findAll() {
        return productDao.findAll();
    }

    @Override
    public List<ProductModel> findProductByCateId(String cid) {
        return productDao.findProductByCateId(cid);
    }

    @Override
    public Long getNumberProductsByCateId(String cid) {
        return productDao.getNumberProductsByCateId(cid);
    }

    @Override
    public int getNumberPageByCateId(String cid, int numberOfProductInPage) {
        return productDao.getNumberPageByCateId(cid, numberOfProductInPage);
    }

    @Override
    public ProductModel findProductById(String id) {
        return productDao.findProductById(id);
    }

    @Override
    public ProductModel save(ProductModel productModel) {
        Long pid = productDao.save(productModel);
        return findProductById(pid+"");
    }

    @Override
    public ProductModel update(ProductModel productModel) {
        productDao.update(productModel);
        return findProductById(productModel.getId()+"");
    }

    @Override
    public void delete(Long[] pids) {
        for (Long pid : pids) {
            itemService.deleteItembyProductId(pid);
            productDao.delete(pid);
        }
    }
}
