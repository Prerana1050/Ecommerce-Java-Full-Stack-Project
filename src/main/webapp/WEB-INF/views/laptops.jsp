<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <jsp:include page="navbar.jsp" />
<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.entity.Product" %>
<%String ses=(String)session.getAttribute("udata");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
</head>
<body>
<br><br><br>

<div class="container mt-5">
    <div class="row">
    <% List<Product> product=(List<Product>)request.getAttribute("product");
	   if(product!=null && !product.isEmpty()) {
		   for(Product prod:product) {
	%>
	<div class="col-md-4 mb-4">
		<div class="card" style="width: 18rem;">
	<img src="<%=prod.getFilePath()%>" class="card-img-top" alt="product Image">
			<div class="card-body">
				<h5 class="card-title"><%= prod.getBrand() %></h5>
				<p class="card-text">Available Quantity: <%= prod.getQuantity() %></p>
				<p class="card-text">Price Rs: <%= prod.getPrice() %></p>
				<%
						
			            	if(ses!=null)
			            	{%>
			            		<a href="/pdetails?prodid=<%=prod.getId()%>&price=<%=prod.getPrice()%>&email=<%=ses%>" class="btn btn-primary">Buy Now</a>
			            	<% }
			            	else{%>
			            		<a href="log" class="btn btn-primary">Buy Now</a>
			            		
			            	<% }%>
				<a href="#" class="btn btn-primary">Add to Cart</a>
        	</div>
    	</div>
	</div>
	<%		}
		}
	    else { %>
	    
			<tr>
				<td colspan="3">No Product to display.</td>
			</tr>
            <% } %>
            
	</div>
</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
