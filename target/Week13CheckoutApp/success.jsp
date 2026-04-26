<!DOCTYPE html>
<html>
<head>
    <title>Order Success</title>
    <style>
        body {
            font-family: Arial;
            background: #d4edda;
            text-align: center;
            padding-top: 100px;
        }

        .box {
            background: white;
            width: 450px;
            margin: auto;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
        }

        a {
            text-decoration: none;
            background: #007bff;
            color: white;
            padding: 12px 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="box">
    <h1>Purchase Completed Successfully</h1>

    <p>Your Order ID is: <b><%= session.getAttribute("orderId") %></b></p>

    <p>Total Amount Paid: <b>Rs. <%= session.getAttribute("total") %></b></p>

    <p>Thank you for shopping with us.</p>

    <a href="products">Shop Again</a>
</div>

</body>
</html>