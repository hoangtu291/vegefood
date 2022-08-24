/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vegefood.controller;

import com.vegefood.service.ICategoryService;
import com.vegefood.service.IPageService;
import com.vegefood.service.IProductService;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/category"})
public class CategoryController extends HttpServlet {

    @Inject
    private IProductService productService;

    @Inject
    private ICategoryService categoryService;
    
    @Inject
    private IPageService PageService; 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String cateId = request.getParameter("cid");
        String page = request.getParameter("page");
        int numberOfProductInPage = 12;
        

        request.setAttribute("categories", categoryService.findAll());
        request.setAttribute("products", productService.findProductByCateId(cateId));
        request.setAttribute("numPage", productService.getNumberPageByCateId(cateId, numberOfProductInPage));
        request.setAttribute("productBegin", PageService.setBeginIndexProcduct(page, numberOfProductInPage));
        request.setAttribute("productEnd", PageService.setEndIndexProcduct(page, numberOfProductInPage));
        request.setAttribute("cID", cateId);
        request.setAttribute("pages", page);

        RequestDispatcher rd = request.getRequestDispatcher("/views/web/shop.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
