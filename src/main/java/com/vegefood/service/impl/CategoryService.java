/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.service.impl;

import com.vegefood.dao.ICategoryDAO;
import com.vegefood.model.CategoryModel;
import com.vegefood.service.ICategoryService;
import java.util.List;
import javax.inject.Inject;

public class CategoryService implements ICategoryService {
    
    @Inject
    private ICategoryDAO categoryDao;

    @Override
    public List<CategoryModel> findAll() {
        return categoryDao.findAll();
    }
    
}
