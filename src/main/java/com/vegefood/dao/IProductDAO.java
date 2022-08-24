/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.dao;

import com.vegefood.model.ProductModel;
import java.util.List;


public interface IProductDAO {
    
    List<ProductModel> findAll();
    List<ProductModel> findProductByCateId(String cid);
    ProductModel findProductById(String id);
    Long getNumberProductsByCateId(String cid);
    int getNumberPageByCateId(String cid, int numberOfProductInPage);
    Long save(ProductModel productModel);
    void update(ProductModel productModel);
    void delete(Long pid);
    
}
