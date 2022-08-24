package com.vegefood.controller;

import com.vegefood.service.IProductService;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/details"})
public class DetailController extends HttpServlet {

    @Inject
    private IProductService productService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pId = request.getParameter("id");
        request.setAttribute("productById", productService.findProductById(pId));
        request.setAttribute("products", productService.findAll());
        RequestDispatcher rd = request.getRequestDispatcher("/views/web/detail.jsp");
        rd.forward(request, response);
    }

}
