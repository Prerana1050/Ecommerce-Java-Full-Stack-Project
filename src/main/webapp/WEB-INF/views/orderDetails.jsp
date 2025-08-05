<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String transactionId=request.getParameter("payment_id");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="col-6 offset-2">
<form action="/order" method="post" novalidate class="needs-validation">
<h2 class="col-6 offset-2">Order Details:</h2>
		<div class="mb-3">
        <label for="address" class="form-label">Enter Your Address To Deliver</label>
        <input type="text" id="address" name="address" class="form-control" required/>   
        </div>
        
        <button class="btn btn-success" type="submit">Place Order</button>
        
        <div class="mb-3">
        <label for="tdetails" class="form-label">Transaction Id</label>
        <input type="hidden" id="tdetails" name="tdetails" class="form-control" value=<%=transactionId %> required/>   
        </div>
</form>
</div>
</body>
</html>

<!-- Enter Your Address to Deliver:<input type="text" name="address">
<input type="submit" value="Place Order">
<input type="hiden" name="tdetails" value=<%=transactionId %>>-->
