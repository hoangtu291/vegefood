/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.service;

import com.vegefood.model.ProductModel;
import java.util.List;


public interface IProductService {
    List<ProductModel> findAll();
    List<ProductModel> findProductByCateId(String cid);
    ProductModel findProductById(String id);
    Long getNumberProductsByCateId(String cid);
    int getNumberPageByCateId(String cid, int numberOfProductInPage);
    ProductModel save(ProductModel productModel);
    ProductModel update(ProductModel productModel);
    void delete(Long[] pids);
}
