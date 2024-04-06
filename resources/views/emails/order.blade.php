<!DOCTYPE html>

<html>

<head>

    <title>Poly Egypt Orders </title>

</head>

<body>

    <h2><small> Name   : </small> <br> {{ $order['name'] }}</h2>
    <h2><small>Email  :</small> <br> {{ $order['email'] }}</h2>
    <h2><small>Phone  : </small><br>{{ $order['phone'] }}</h2>
    <h2><small> address: </small><br>{{ $order['address'] }}</h2>
    <p><strong>Order Details:</strong> <br> {{ $order['order_desc'] }}</p>

</body>

</html>