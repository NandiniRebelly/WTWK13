<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial;
            background: #eef2f3;
        }

        .container {
            width: 450px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
        }

        h1 {
            text-align: center;
        }

        input, textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
        }

        button {
            width: 100%;
            padding: 12px;
            background: green;
            color: white;
            border: none;
            font-size: 16px;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Shipping Information</h1>

    <form action="placeOrder" method="post">

        <input type="text" name="customerName" placeholder="Enter Full Name" required>

        <input type="email" name="email" placeholder="Enter Email" required>

        <textarea name="address" placeholder="Enter Address" required></textarea>

        <input type="text" name="city" placeholder="Enter City" required>

        <input type="text" name="phone" placeholder="Enter Phone Number" required>

        <button type="submit">Complete Purchase</button>

    </form>
</div>

</body>
</html>