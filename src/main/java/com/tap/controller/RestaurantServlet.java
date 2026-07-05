package com.tap.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.tap.model.Menu;
import com.tap.model.Restaurant;
import com.tapdaoimple.MenuDAOimple;
import com.tapdaoimple.RestaurantDAOimple;

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Load Restaurants
        RestaurantDAOimple restaurantDAO = new RestaurantDAOimple();
        List<Restaurant> restaurantList = restaurantDAO.getAllRestaurants();

        // Load All Menu Items
        MenuDAOimple menuDAO = new MenuDAOimple();
        List<Menu> menuList = menuDAO.getAllMenuItems();
        
        List<Menu> featuredList = menuDAO.getTopRatedMenus();
        request.setAttribute("featuredList", featuredList);

        // Send data to index.jsp
        request.setAttribute("restaurantList", restaurantList);
        request.setAttribute("menuList", menuList);

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }
}