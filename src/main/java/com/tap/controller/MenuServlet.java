package com.tap.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.tap.model.Menu;
import com.tapdaoimple.MenuDAOimple;

@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int restaurantId =
                Integer.parseInt(request.getParameter("restaurantId"));

        MenuDAOimple dao = new MenuDAOimple();

        List<Menu> menuList =
                dao.getMenuByRestaurantId(restaurantId);

        request.setAttribute("menuList", menuList);

        RequestDispatcher rd =
                request.getRequestDispatcher("menu.jsp");

        rd.forward(request, response);
    }
}