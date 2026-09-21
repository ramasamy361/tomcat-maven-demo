package com.devops;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class AppServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        response.getWriter().println(
            "<html><head><title>DevOps Demo</title></head>" +
            "<body style='font-family:Arial;margin:40px'>" +
            "<h1>Tomcat Maven DevOps Demo</h1>" +
            "<p>Application is running successfully.</p>" +
            "<p>Build tool: Maven</p>" +
            "<p>Application server: Apache Tomcat</p>" +
            "<p>CI/CD: Jenkins</p>" +
            "</body></html>"
        );
    }
}
