/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.dao.impl;

import com.vegefood.dao.IProductDAO;
import com.vegefood.mapper.ProductMapper;
import com.vegefood.model.ProductModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class ProductDAO extends AbstractDAO<ProductModel> implements IProductDAO {

    @Override
    public List<ProductModel> findAll() {
        String sql = "SELECT product.id, product.name, product.price, product.image, "
                + "product.discount, product.description, product.categoryid, category.id as cid, "
                + "category.name as cname, category.code as ccode FROM product "
                + "INNER JOIN category ON product.categoryid=category.id ORDER BY product.name";
        
        return query(sql, new ProductMapper());
    }

    @Override
    public List<ProductModel> findProductByCateId(String cid) {
        String sql = "SELECT product.id, product.name, product.price, product.image, "
                + "product.discount, product.description, product.categoryid, category.id as cid, "
                + "category.name as cname, category.code as ccode FROM product "
                + "INNER JOIN category ON product.categoryid=category.id WHERE product.categoryid = ?";
        return query(sql, new ProductMapper(), cid);
    }

    @Override
    public Long getNumberProductsByCateId(String cid) {
        Long numberProducts = null;
        String sql = "select count(*) as numberproduct from product";
        if (cid != null) {
            sql += " where categoryid = ?";
        }
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(sql);
                if (cid != null) {
                    statement.setString(1, cid);
                }
                resultSet = statement.executeQuery();
                if (resultSet.next()) {
                    numberProducts = resultSet.getLong("numberproduct");
                }
                return numberProducts;
            } catch (SQLException e) {
                return null;
            } finally {
                try {
                    if (connection != null) {
                        connection.close();
                    }

                    if (statement != null) {
                        statement.close();
                    }

                    if (resultSet != null) {
                        resultSet.close();
                    }
                } catch (SQLException e) {
                    return null;
                }
            }
        }
        return null;
    }

    @Override
    public int getNumberPageByCateId(String cid, int numberOfProductInPage) {
        ProductDAO proc = new ProductDAO();
        Long num = proc.getNumberProductsByCateId(cid);
        int page = (int) (num / numberOfProductInPage);
        if (num % numberOfProductInPage != 0) {
            page += 1;
        }
        return page;
    }

//    public static void main(String[] args) {
//        ProductDAO proc = new ProductDAO();
//        Long num = proc.getNumberProductsByCateId(null);
//        int page = (int) (num / 12);
//        if (num % 12 != 0) {
//            page += 1;
//        }
//        System.out.println("  ");
//        System.out.println(page);
//    }

    @Override
    public ProductModel findProductById(String id) {
//        String sql = "SELECT * FROM product WHERE id = ?";
        String sql = "SELECT product.id, product.name, product.price, product.image, "
                + "product.discount, product.description, product.categoryid, category.id as cid, "
                + "category.name as cname, category.code as ccode FROM product "
                + "INNER JOIN category ON product.categoryid=category.id WHERE product.id = ?";
        return query(sql, new ProductMapper(), id).get(0);
    }

    @Override
    public Long save(ProductModel productModel) {
        String sql = "INSERT INTO product(name, price, image, discount, description, categoryid) VALUES"
                + " (?, ?, ?, ?, ?, ?)";
        return insert(sql, productModel.getName(), productModel.getPrice(), productModel.getImage(), productModel.getDiscount(), productModel.getDescription(), productModel.getCategoryid());
    }

    @Override
    public void update(ProductModel productModel) {
        String sql = "UPDATE product SET name = ?, price = ?, image = ?, discount = ?, description = ?, categoryid = ? WHERE id = ?";
        update(sql, productModel.getName(), productModel.getPrice(), productModel.getImage(), productModel.getDiscount(),
                            productModel.getDescription(), productModel.getCategoryid(), productModel.getId());
    }

    @Override
    public void delete(Long pid) {
        String sql = "DELETE FROM product WHERE id = ?";
        update(sql, pid);
    }
}
