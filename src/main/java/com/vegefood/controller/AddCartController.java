package com.vegefood.controller;

import com.vegefood.model.AccountModel;
import com.vegefood.model.CartModel;
import com.vegefood.model.ItemModel;
import com.vegefood.model.ProductModel;
import com.vegefood.service.ICartService;
import com.vegefood.service.IItemService;
import com.vegefood.service.IProductService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddCartController", urlPatterns = {"/addCart"})
public class AddCartController extends HttpServlet {

    @Inject
    private IProductService productService;

    @Inject
    private ICartService cartService;

    @Inject
    private IItemService itemService;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String productId = request.getParameter("id");
        if (productId != null) {
            Long pId = Long.parseLong(productId);
            Long quantity = 1L;

            ProductModel product = productService.findProductById(productId);

            if (product == null) {
                response.sendRedirect("shop");
            } else {
                HttpSession session = request.getSession();
                AccountModel account = (AccountModel) session.getAttribute("acc");
                Long userId = account.getUserId();
//                Long userId = 3L; //debug
                List<CartModel> cart = cartService.findCartByUserId(userId);
                List<ItemModel> item = itemService.findItemByCartId(cart.get(0).getId());

                Long itemId = null;
                boolean check = false;
                if (!item.isEmpty()) {
                    for (ItemModel o : item) {
                        if (pId == o.getProductId()) {
                            quantity = o.getQuantity() + 1;
                            itemId = o.getId();
                            check = true;
                        }
                    }
                    if (check) {
                        cartService.updateQuantityProductToCart(itemId, quantity);
                    } else {
                        cartService.addToCart(product, userId, quantity);
                    }
                } else {
                    cartService.addToCart(product, userId, quantity);
                }
                ProductModel productByItem;
                List<ProductModel> productItem = new ArrayList<>();
                for (ItemModel o : item) {
                    productByItem = productService.findProductById(o.getProductId() + "");
                    productItem.add(productByItem);
                }
                session.setAttribute("item", item);
                session.setAttribute("productItem", productItem);
                session.setAttribute("itemsize", item.size());
                response.sendRedirect("shop");
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
