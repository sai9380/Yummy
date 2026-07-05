package com.tap.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.tap.model.User;
import com.tapdaoimple.UserDAOimple;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loggedUser");

        if(user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Read updated values
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Update object
        user.setUsername(name);
        user.setEmail(email);
        user.setPhoneNumber(phone);
        user.setAddress(address);

        // Update database
        UserDAOimple dao = new UserDAOimple();
        dao.updateUser(user);

        // Update session
        session.setAttribute("loggedUser", user);

        response.sendRedirect("ProfileServlet");
    }
}