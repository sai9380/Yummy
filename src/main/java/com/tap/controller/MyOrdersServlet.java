package com.tap.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.tap.model.Order;
import com.tap.model.User;
import com.tapdaoimple.OrderDAOimple;

@WebServlet("/MyOrdersServlet")
public class MyOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedUser");

        if(user == null){
            response.sendRedirect("login.jsp");
            return;
        }

        OrderDAOimple dao = new OrderDAOimple();

        List<Order> orders = dao.getOrdersByUserId(user.getUserId());

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("myOrders.jsp")
               .forward(request, response);
    }
}