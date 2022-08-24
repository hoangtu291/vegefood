package com.vegefood.controller;

import com.vegefood.model.AccountModel;
import com.vegefood.model.CartModel;
import com.vegefood.model.ItemModel;
import com.vegefood.model.UserModel;
import com.vegefood.service.ICartService;
import com.vegefood.service.IItemService;
import com.vegefood.service.ISigninService;
import com.vegefood.service.ISignupService;
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

@WebServlet(name = "SignupController", urlPatterns = {"/signup"})
public class SignupController extends HttpServlet {

    @Inject
    private ISignupService signupService;

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
        String fullName = request.getParameter("fullname");
        String password = request.getParameter("pass");
        String re_pass = request.getParameter("re_pass");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String agree_term = request.getParameter("agree-term");

        UserModel user = new UserModel();
        AccountModel account = new AccountModel();

        user.setFullName(fullName);
        user.setAddress(address);
        user.setPhone(phone);
        account.setUserName(userName);
        account.setPassword(password);
        if (userName == null || fullName == null || password == null || re_pass == null || address == null || phone == null || agree_term == null) {
            if (agree_term != null) {
                request.setAttribute("message", "You have not entered enough");
            } else {
                request.setAttribute("message", "Please choose to agree all statements in Terms of service");
            }
            RequestDispatcher rd = request.getRequestDispatcher("/views/signup.jsp");
            rd.forward(request, response);
        } else {
            if (!password.equals(re_pass)) {
                request.setAttribute("message", "Password and repeat password do not match");
                RequestDispatcher rd = request.getRequestDispatcher("/views/signup.jsp");
                rd.forward(request, response);
            } else {
                List<AccountModel> listAcc = signupService.checkAccountExist(userName);
                if (listAcc.isEmpty()) {
                    signupService.signUpAccount(account, user);

                    List<AccountModel> acc = signinService.getAccount(userName, password);
                    List<UserModel> userSS = signinService.getUserByAccount(acc.get(0).getUserId());
                    List<CartModel> cart = cartService.findCartByUserId(acc.get(0).getUserId());
                    List<ItemModel> item = itemService.findItemByCartId(cart.get(0).getId());
                    HttpSession session = request.getSession();
                    session.setAttribute("item", item);
                    session.setAttribute("itemsize", item.size());
                    session.setAttribute("acc", acc.get(0));
                    session.setAttribute("user", userSS.get(0));
                    response.sendRedirect("home");
                } else {
                    request.setAttribute("message", "Username already exists");
                    RequestDispatcher rd = request.getRequestDispatcher("/views/signup.jsp");
                    rd.forward(request, response);
                }
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
