<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <style>
        body {
            font-family: Arial;
            background: #eef2f3;
        }

        h1 {
            text-align: center;
        }

        .container {
            display: flex;
            justify-content: center;
            gap: 25px;
            margin-top: 50px;
        }

        .card {
            background: white;
            width: 250px;
            padding: 25px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 10px gray;
        }

        button {
            background: green;
            color: white;
            border: none;
            padding: 10px 18px;
            border-radius: 5px;
            cursor: pointer;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 30px;
            text-decoration: none;
        }
    </style>
</head>
<body>

<h1>Available Products</h1>

<div class="container">

<%
    ArrayList<HashMap<String, String>> products =
            (ArrayList<HashMap<String, String>>) request.getAttribute("products");

    for (HashMap<String, String> p : products) {
%>

    <div class="card">
        <h2><%= p.get("name") %></h2>
        <p>Price: Rs. <%= p.get("price") %></p>

        <form action="cart" method="post">
            <input type="hidden" name="name" value="<%= p.get("name") %>">
            <input type="hidden" name="price" value="<%= p.get("price") %>">
            <button type="submit">Add to Cart</button>
        </form>
    </div>

<%
    }
%>

</div>

<a href="cart.jsp">Go to Cart</a>

</body>
</html>