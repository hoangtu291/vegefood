/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.controller;

import com.vegefood.model.ItemModel;
import com.vegefood.model.ProductModel;
import com.vegefood.service.IProductService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    @Inject
    private IProductService productService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<ItemModel> item = (List<ItemModel>) session.getAttribute("item");
        ProductModel productByItem;
        List<ProductModel> productItem = new ArrayList<>();

        for (ItemModel o : item) {
            productByItem = productService.findProductById(o.getProductId() + "");
            productItem.add(productByItem);
        }
        session.setAttribute("productItem", productItem);
        session.setAttribute("itemsize", item.size());

        RequestDispatcher rd = request.getRequestDispatcher("/views/web/cart.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
