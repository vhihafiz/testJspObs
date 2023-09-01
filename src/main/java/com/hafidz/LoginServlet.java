package com.hafidz;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class LoginServlet extends HttpServlet {
    private final static String USERNAME = "user";
    private final static String PASSWORD = "user";

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String username = request.getParameter("userid");
        String password = request.getParameter("password");

        if (password.equals(USERNAME) && username.equals(PASSWORD)) {
            response.getWriter().write("Success");
        } else {
            response.sendError(1, "Wrong Password");
            System.out.println("Wrong Password");
        }
    }

}

