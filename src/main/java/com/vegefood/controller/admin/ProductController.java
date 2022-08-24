package com.vegefood.controller.admin;

import com.vegefood.model.ProductModel;
import com.vegefood.service.IProductService;
import java.io.IOException;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin-product"})
public class ProductController extends HttpServlet {
    
    @Inject
    private IProductService productService;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String view = "/views/admin/product/list-product.jsp";
        String type = request.getParameter("type");
        String pid = request.getParameter("pid");
        
        ProductModel productModel = new ProductModel();
        if(type.equals("list")){
            request.setAttribute("products", productService.findAll());
        }else if(type.equals("edit")){
//            String pid = request.getParameter("pid");
            if(pid != null){
                productModel = productService.findProductById(pid);
            }
            view = "/views/admin/product/edit-product.jsp";
        }  
        request.setAttribute("product", productModel);
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

}
