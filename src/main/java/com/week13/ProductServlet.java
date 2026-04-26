package com.week13;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<HashMap<String, String>> products = new ArrayList<>();

        HashMap<String, String> p1 = new HashMap<>();
        p1.put("id", "1");
        p1.put("name", "Java Book");
        p1.put("price", "500");
        products.add(p1);

        HashMap<String, String> p2 = new HashMap<>();
        p2.put("id", "2");
        p2.put("name", "Python Book");
        p2.put("price", "600");
        products.add(p2);

        HashMap<String, String> p3 = new HashMap<>();
        p3.put("id", "3");
        p3.put("name", "Web Development Book");
        p3.put("price", "800");
        products.add(p3);

        request.setAttribute("products", products);
        request.getRequestDispatcher("products.jsp").forward(request, response);
    }
}