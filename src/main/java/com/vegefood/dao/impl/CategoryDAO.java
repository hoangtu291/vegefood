/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.dao.impl;

import com.vegefood.dao.ICategoryDAO;
import com.vegefood.mapper.CategoryMapper;
import com.vegefood.model.CategoryModel;
import java.util.List;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

    @Override
    public List<CategoryModel> findAll() {
        String sql = "SELECT * FROM category";
        return query(sql, new CategoryMapper());
    }

//    public static void main(String[] args) {
//        CategoryDAO cate = new CategoryDAO();
//        List<CategoryModel> list = cate.findAll();
//
//        for (CategoryModel o : list) {
//            System.out.println(o.getName());
//        }
//    }

}
