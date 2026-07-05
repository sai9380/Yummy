package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.tap.model.Cart;
import com.tap.model.Menu;
import com.tapdaoimple.MenuDAOimple;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("menuId"));

        MenuDAOimple dao = new MenuDAOimple();

        Menu menu = dao.getMenu(menuId);

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        cart.addItem(menu);

        session.setAttribute("cart", cart);

        String source = request.getParameter("source");

        if ("home".equals(source)) {
            response.sendRedirect("restaurants");
        } else {
            response.sendRedirect("MenuServlet?restaurantId=" + menu.getRestaurantId());
        }
    }
}