package com.vegefood.controller;

import com.vegefood.model.AccountModel;
import com.vegefood.model.CartModel;
import com.vegefood.model.ItemModel;
import com.vegefood.service.ICartService;
import com.vegefood.service.ICategoryService;
import com.vegefood.service.IItemService;
import com.vegefood.service.IPageService;
import com.vegefood.service.IProductService;
import java.io.IOException;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/shop"})
public class ShopController extends HttpServlet {

    @Inject
    private IProductService productService;

    @Inject
    private ICategoryService categoryService;

    @Inject
    private IPageService PageService;

    @Inject
    private ICartService cartService;

    @Inject
    private IItemService itemService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String cateId = request.getParameter("cid");
        String page = request.getParameter("page");
        int numberOfProductInPage = 12;
        HttpSession session = request.getSession();

        if (session.getAttribute("acc") != null) {
            
            AccountModel account = (AccountModel) session.getAttribute("acc");

            List<CartModel> cart = cartService.findCartByUserId(account.getUserId());
            List<ItemModel> item = itemService.findItemByCartId(cart.get(0).getId());
            session.setAttribute("item", item);
            session.setAttribute("itemsize", item.size());
        }

        request.setAttribute("products", productService.findAll());
        request.setAttribute("categories", categoryService.findAll());
        request.setAttribute("numPage", productService.getNumberPageByCateId(cateId, numberOfProductInPage));
        request.setAttribute("productBegin", PageService.setBeginIndexProcduct(page, numberOfProductInPage));
        request.setAttribute("productEnd", PageService.setEndIndexProcduct(page, numberOfProductInPage));
        request.setAttribute("pages", page);

        RequestDispatcher rd = request.getRequestDispatcher("/views/web/shop.jsp");
        rd.forward(request, response);
    }

}
