package com.vegefood.controller;

import com.vegefood.model.AccountModel;
import com.vegefood.model.CartModel;
import com.vegefood.model.ItemModel;
import com.vegefood.model.UserModel;
import com.vegefood.service.ICartService;
import com.vegefood.service.IItemService;
import com.vegefood.service.ISigninService;
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

@WebServlet(name = "SigninController", urlPatterns = {"/signin"})
public class SigninController extends HttpServlet {

    @Inject
    private ISigninService signinService;

    @Inject
    private ICartService cartService;

    @Inject
    private IItemService itemService;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        if(userName == null || password == null){
            request.setAttribute("message", "You have not entered enough");
            RequestDispatcher rd = request.getRequestDispatcher("/views/web/signin.jsp");
            rd.forward(request, response);
        } else{
            List<AccountModel> account = signinService.getAccount(userName, password);
            if (account.isEmpty()) {
                request.setAttribute("message", "Wrong Username or Password");
                RequestDispatcher rd = request.getRequestDispatcher("/views/web/signin.jsp");
                rd.forward(request, response);
            } else {
                Long userId = account.get(0).getUserId();
                List<CartModel> cart = cartService.findCartByUserId(userId);
                List<ItemModel> item = itemService.findItemByCartId(cart.get(0).getId());
                List<UserModel> user = signinService.getUserByAccount(account.get(0).getUserId());
                HttpSession session = request.getSession();
                session.setAttribute("item", item);
                session.setAttribute("itemsize", item.size());
                session.setAttribute("user", user.get(0));
                session.setAttribute("acc", account.get(0));
                response.sendRedirect("home");
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
