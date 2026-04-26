package com.week13;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("customerName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");

        HttpSession session = request.getSession();

        ArrayList<HashMap<String, Object>> cart =
                (ArrayList<HashMap<String, Object>>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        double total = 0;

        for (HashMap<String, Object> item : cart) {
            double price = (double) item.get("price");
            int quantity = (int) item.get("quantity");
            total += price * quantity;
        }

        try {
            Connection con = DBConnection.getConnection();

            String orderSql = "INSERT INTO orders(customer_name, email, address, city, phone, total_amount) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(orderSql, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setString(1, customerName);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setString(4, city);
            ps.setString(5, phone);
            ps.setDouble(6, total);

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            int orderId = 0;

            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            String itemSql = "INSERT INTO order_items(order_id, product_name, price, quantity) VALUES (?, ?, ?, ?)";

            PreparedStatement itemPs = con.prepareStatement(itemSql);

            for (HashMap<String, Object> item : cart) {
                itemPs.setInt(1, orderId);
                itemPs.setString(2, item.get("name").toString());
                itemPs.setDouble(3, (double) item.get("price"));
                itemPs.setInt(4, (int) item.get("quantity"));

                itemPs.executeUpdate();
            }

            session.removeAttribute("cart");
            session.setAttribute("orderId", orderId);
            session.setAttribute("total", total);

            response.sendRedirect("success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Order failed: " + e.getMessage());
        }
    }
}