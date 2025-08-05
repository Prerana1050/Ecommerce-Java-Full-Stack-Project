<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Make Payment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<h2 class="col-6 offset-2">Pay with Razorpay (Dummy Keys)</h2>
<div class="col-6 offset-2">
<form action="createOrder" method="post" novalidate class="needs-validation">
	<div class="mb-3">
        <label for="amount" class="form-label">Amount</label>
        <input type="number" id="amount" name="amount" class="form-control" required/>   
        </div>
        
        <div class="mb-3">
        <label for="name" class="form-label">Name</label>
        <input type="text" id="name" name="name" class="form-control" required/>   
        </div>
        
        <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" id="email" name="email" class="form-control" required/>    
        </div>
        
        <div class="mb-3">
        <label for="contact" class="form-label">Contact</label>
        <input type="number" id="contact" name="contact" class="form-control" required/>   
        </div>
        
        <button class="btn btn-primary" type="submit">Pay Now</button>
</form>
</div>
</body>
</html>

    <!-- Amount: <input type="number" name="amount" value="100" required/><br><br>
    <div class="mb-3">
        <label for="username" class="form-label">Username</label>
        <input type="text" id="username" name="username" class="form-control" required/>
        <div class="valid-feedback">looks good!</div>    
        </div>
    Name: <input type="text" name="name" value="John Doe" required/><br><br>
    Email: <input type="email" name="email" value="john.doe@example.com" required/><br><br>
    Contact: <input type="text" name="contact" value="6291580778" required/><br><br>
    <button type="submit">Pay Now</button>
</form>-->

