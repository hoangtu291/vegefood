package com.vegefood.mapper;

import com.vegefood.model.CategoryModel;
import com.vegefood.model.ProductModel;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper implements RowMapper<ProductModel> {

    @Override
    public ProductModel mapRow(ResultSet resultSet) {
        try {
            ProductModel product = new ProductModel();

            product.setId(resultSet.getLong("id"));
            product.setName(resultSet.getString("name"));
            product.setPrice(resultSet.getDouble("price"));
            product.setImage(resultSet.getString("image"));
            product.setDiscount(resultSet.getInt("discount"));
            product.setDescription(resultSet.getString("description"));
            product.setCategoryid(resultSet.getLong("categoryid"));
            product.setPriceleft(product.getDiscount());
            
            CategoryModel categoryModel = new CategoryModel();
            categoryModel.setId(resultSet.getLong("categoryid"));
            categoryModel.setName(resultSet.getString("cname"));
            categoryModel.setCode(resultSet.getString("ccode"));
            
            product.setCategoryModel(categoryModel);
            return product;
        } catch (SQLException e) {
            return null;
        }
    }
}
