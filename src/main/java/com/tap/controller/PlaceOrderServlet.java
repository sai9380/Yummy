package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Order;
import com.tap.model.OrderDetails;
import com.tap.model.User;
import com.tapdaoimple.OrderDAOimple;
import com.tapdaoimple.OrderDetailsDAOimple;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedUser");
        Cart cart = (Cart) session.getAttribute("cart");

        if (user == null || cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");

        int restaurantId = 0;

        for (CartItem item : cart.getItems()) {
            restaurantId = item.getMenu().getRestaurantId();
            break; // first item only
        }

        Order order = new Order();

        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurantId);
        order.setTotalAmount(cart.getTotalPrice());
        order.setAddress(address);
        order.setPaymentMethod(paymentMethod);
        order.setStatus("Placed");

        OrderDAOimple orderDAO = new OrderDAOimple();

        int orderId = orderDAO.addOrder(order);

        OrderDetailsDAOimple detailsDAO = new OrderDetailsDAOimple();

        for (CartItem item : cart.getItems()) {

            OrderDetails details = new OrderDetails();

            details.setOrderId(orderId);
            details.setOrderName(item.getMenu().getDescription());
            details.setQty(item.getQuantity());
            details.setTotalPrice(item.getTotalPrice());

            detailsDAO.addOrderDetails(details);
        }

        session.removeAttribute("cart");

        response.sendRedirect("orderSuccess.jsp");
    }
}