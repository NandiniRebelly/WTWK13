<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <style>
        body {
            font-family: Arial;
            background: #f2f2f2;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 70%;
            margin: auto;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 15px;
            border: 1px solid gray;
            text-align: center;
        }

        th {
            background: #007bff;
            color: white;
        }

        .buttons {
            text-align: center;
            margin-top: 30px;
        }

        a {
            text-decoration: none;
            padding: 12px 20px;
            background: green;
            color: white;
            border-radius: 5px;
            margin: 10px;
        }
    </style>
</head>
<body>

<h1>Your Cart</h1>

<%
    ArrayList<HashMap<String, Object>> cart =
            (ArrayList<HashMap<String, Object>>) session.getAttribute("cart");

    double total = 0;

    if (cart == null || cart.isEmpty()) {
%>

    <h2 style="text-align:center;">Cart is Empty</h2>

<%
    } else {
%>

<table>
    <tr>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Subtotal</th>
    </tr>

<%
        for (HashMap<String, Object> item : cart) {
            double price = (double) item.get("price");
            int quantity = (int) item.get("quantity");
            double subtotal = price * quantity;
            total += subtotal;
%>

    <tr>
        <td><%= item.get("name") %></td>
        <td>Rs. <%= price %></td>
        <td><%= quantity %></td>
        <td>Rs. <%= subtotal %></td>
    </tr>

<%
        }
%>

    <tr>
        <td colspan="3"><b>Total Amount</b></td>
        <td><b>Rs. <%= total %></b></td>
    </tr>
</table>

<div class="buttons">
    <a href="products">Continue Shopping</a>
    <a href="checkout">Proceed to Checkout</a>
</div>

<%
    }
%>

</body>
</html>