<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.entity.Product" %>
<%@ page import="com.example.jpa.entity.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecommerce</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admindashboard.css">
    
</head>
<body>

    <!-- Dashboard section starts here -->
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-user-plus" aria-hidden="true"></i></span>
                        <span class="title"><h2>Admin Dashboard</h2></span>
                    </a> 
                </li>
                
                <li>
                    <a href="viewitem">
                        <span class="icon"><i class="fa fa-home" aria-hidden="true"></i></span>
                        <span class="title">Home</span>
                    </a>
                </li>
                
                <li>
                    <a href="addform">    
                        <span class="icon"><i class="fa fa-id-card" aria-hidden="true"></i></span>
                        <span class="title">Add Product</span>
                    </a>
                </li>
                
                <li>
                    <a href="viewuser">
                        <span class="icon"><i class="fa fa-user" aria-hidden="true"></i></span>
                        <span class="title">View User</span>
                    </a>
                </li>
                
                <li>
                    <a href="app">
                        <span class="icon"><i class="fa fa-cogs" aria-hidden="true"></i></span>
                        <span class="title">View Order</span>
                    </a>
                </li>
                
                <li>
                    <a href="app">
                        <span class="icon"><i class="fa fa-cogs" aria-hidden="true"></i></span>
                        <span class="title">View Feedback</span>
                    </a>
                </li>
                
                <li>
                    <a href="/">
                        <span class="icon"><i class="fa fa-sign-out" aria-hidden="true"></i></span>
                        <span class="title">Log out</span>
                    </a>
                </li>
            </ul>
        </div>
    <!-- Dashboard section ends here -->

        <div class="main">
            <div class="topbar">
                <div class="toggle"></div> 
                <div class="search">
                <label for="html">
                    <input type="text" placeholder="Search Here">
                    <i class="fa fa-search" aria-hidden="true"></i>
                </label>
                </div>
                
                <div class="user">
                    <img src="https://pic.onlinewebfonts.com/thumbnails/icons_325791.svg" style="height:30px;">
                </div>
            </div>
           
            <div class="cardbox">
                <div class="card">
                    <div>
                        <div class="numbers">0</div>
                        <div class="cardname">Active Users</div>
                        <div class="numbers"></div>
                    </div>
                    <div class="iconbox">
                        <i class="fa fa-users" aria-hidden="true"></i>
                    </div>
                </div>
                
                <div class="card">
                    <div>
                        <div class="numbers">0</div>
                        <div class="cardname">Sales</div>
                        <div class="numbers"></div>
                    </div>
                    <div class="iconbox">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    </div>
                </div>
            </div>

            <div class="details">
                <div class="recentorders">
                    <div class="cardheader">
                        <h2>Product Details</h2><br><br>
                <!--        <a href="memvalid" class="btn">View All</a>  -->
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Prod Id</th>
                                <th>Category</th>
                                <th>Brand</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Images</th>

                            </tr>
                        </thead>
                     <tbody>
                     	<tr>
           				<%
           					List<Product> product=(List<Product>)request.getAttribute("data");
           					if(product!=null && !product.isEmpty()) {
           						for(Product prod:product) {
           				%>
           				<td style="text-align:center;"><%= prod.getId() %></td>
           				<td style="text-align:center;"><%= prod.getCategory() %></td>
           				<td style="text-align:center;"><%= prod.getBrand() %></td>
           				<td style="text-align:center;"><%= prod.getQuantity() %></td>
           				<td style="text-align:center;"><%= prod.getPrice() %></td>
           				<td style="text-align: center;">
							    <% 
							        String filePath = prod.getFilePath();
							        if (filePath != null && !filePath.isEmpty()) { 
							    %>
							        <img src="<%=filePath%>" width="110" height="80"/>
							    <% 
							        } else { 
							    %>
							        N/A
							    <% 
							        } 
							    %>
							</td>
           				<td style="text-align:right;"><a href="/viewrecord/<%=prod.getId()%>" class="btn">Edit</a></td>
           				<td style="text-align:center;"><a href="/delete/<%=prod.getId()%>" onclick="return confirm('Are you sure?')" class="btn">Delete</a></td>
           				</tr>
           				<%		}
           					} else {
           						%>
           						<h4>Record Not found!</h4>
           						<% } %>
           				</tbody>
           			</table>
                </div>
            </div>
     	</div>
</body>
</html>