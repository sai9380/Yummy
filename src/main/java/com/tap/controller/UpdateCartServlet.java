package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.tap.model.Cart;
import com.tap.model.CartItem;

@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("menuId"));
        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {

            int quantity = 0;

            for (CartItem item : cart.getItems()) {
                if (item.getMenu().getMenuId() == menuId) {
                    quantity = item.getQuantity();
                    break;
                }
            }

            if ("increase".equals(action)) {
                cart.updateItem(menuId, quantity + 1);
            } else if ("decrease".equals(action)) {
                cart.updateItem(menuId, quantity - 1);
            }

            session.setAttribute("cart", cart);
        }

        response.sendRedirect("CartServlet");
    }
}