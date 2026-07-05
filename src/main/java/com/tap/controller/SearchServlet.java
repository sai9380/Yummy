package com.tap.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.tap.model.Menu;
import com.tapdaoimple.MenuDAOimple;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        MenuDAOimple dao = new MenuDAOimple();

        List<Menu> result = dao.searchMenu(keyword);

        request.setAttribute("searchResult", result);
        request.setAttribute("keyword", keyword);

        request.getRequestDispatcher("search.jsp")
               .forward(request, response);
    }
}