package com.week13;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));

        HttpSession session = request.getSession();

        ArrayList<HashMap<String, Object>> cart =
                (ArrayList<HashMap<String, Object>>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
        }

        boolean found = false;

        for (HashMap<String, Object> item : cart) {
            if (item.get("name").equals(name)) {
                int qty = (int) item.get("quantity");
                item.put("quantity", qty + 1);
                found = true;
                break;
            }
        }

        if (!found) {
            HashMap<String, Object> item = new HashMap<>();
            item.put("name", name);
            item.put("price", price);
            item.put("quantity", 1);
            cart.add(item);
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}