/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.controller.admin.API;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.vegefood.model.ProductModel;
import com.vegefood.service.IItemService;
import com.vegefood.service.IProductService;
import com.vegefood.utils.HttpUtil;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(urlPatterns = {"/api-admin-product"})
public class ProductAPI extends HttpServlet {

    @Inject
    private IProductService productService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //-- add product
        // get params
        ObjectMapper objectMapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        // mapper json string to object
        ProductModel productModel = new ProductModel();
        productModel = HttpUtil.toModel(request.getReader(), ProductModel.class);
        productModel.setImage("/template/home/images/" + productModel.getImage());

        //save model to db
        productModel = productService.save(productModel);

        // return object Product json
        objectMapper.writeValue(response.getOutputStream(), productModel);

    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //-- update product
        // get params
        ObjectMapper objectMapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        // mapper json string to object
        ProductModel productModel = new ProductModel();
        productModel = HttpUtil.toModel(request.getReader(), ProductModel.class);
        productModel.setImage("/template/home/images/" + productModel.getImage());

        //update model to db
        productModel = productService.update(productModel);

        // return object Product json
        objectMapper.writeValue(response.getOutputStream(), productModel);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        // mapper json string to object
        ProductModel productModel = new ProductModel();
        productModel = HttpUtil.toModel(request.getReader(), ProductModel.class);
        
        //delete list product from db
        productService.delete(productModel.getIds());

    }

}
