<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/hotell";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<style type="text/css">
	*{
  		box-sizing: border-box;
	}
	
	h1{
		color:#E42217;
		font-size:50px;
		text-align:center;
		margin-top:20px;
	}
	
	input[type=text], select{
  		width: 100%;
  		padding: 12px;
  		border: 1px solid #ccc;
  		border-radius: 4px;
  		resize: vertical;
  		
	}

	label {
  		padding: 12px 12px 12px 0;
  		display: inline-block;
  		font-size:20px;
	}

	input[type=submit] {
  		background-color: red;
  		color: white;
  		padding: 12px 20px;
 		border: none;
  		border-radius: 4px;
  		cursor: pointer;
  		float: left;
  		width:100%;
  		margin-top:20px;
	}

	input[type=submit]:hover {
  		background-color:red;
	}

	.container {
  		border-radius: 5px;
  		background-color: #f2f2f2;
  		padding: 20px;
	}

	.col-25 {
  		float: left;
  		width: 25%;
  		margin-top: 6px;
	}

	.col-75 {
  		float: right;
  		width: 75%;
  		margin-top: 6px;
	}
	
	.row:after {
  		content: "";
  		display: table;
  		clear: both;
	}

	</style>

</head>
<body>

	<div class="container">
	<h1>Add New Item</h1>
		<form action="insert" method="post">
  	<div class="row">
    <div class="col-25">
      	<label for="fname">Item Name</label>
    	</div>
    	<div class="col-75">
      		<select id="name" name="name">
        		<option value="mask">Mask</option>
        		<option value="glove">Gloves</option>
        		<option value="sanitizer">Sanitizer</option>
        		<option value="ppekit">PPE kit</option>
        		<option value="jackets">Jackets</option>
        		<option value="caps">Caps</option>
        		<option value="soap">Soap</option>
        		<option value="dress">Dress</option>
      		</select>
    </div>
  	</div>
  	<div class="row">
    <div class="col-25">
      	<label for="lname">Shop Purchased</label>
   		</div>
    	<div class="col-75">
      		<input type="text" name="shop" required>
    </div>
  	</div>
  	<div class="row">
    <div class="col-25">
      	<label for="fname">Date</label>
    	</div>
    	<div class="col-75">
      		<input type="text" name="date" required>
    </div>
  	</div>
  	
  	<div class="row">
    <div class="col-25">
      	<label for="lname">Quantity</label>
   		</div>
    	<div class="col-75">
      		<input type="text" name="quantity" required>
    </div>
  	</div>
  	

  	
  	
  	
  	<div class="row">
    <div class="col-25">
      	<label for="fname">Inserted By</label>
    	</div>
    	<div class="col-75">
      		<select id="name" name="user">
      		<%
				try{ 
					connection = DriverManager.getConnection(connectionUrl, userId, password);
					statement=connection.createStatement();
					String sql ="SELECT * FROM user";
					
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
					%>
  	
        		<option value="<%=resultSet.getString("name") %>"><%=resultSet.getString("name") %></option>
        		
        		<% 
				}
				
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
        		
      		</select>
    </div>
  	</div>

  
  	<div class="row">
    	<input type="submit" name="submit" value="Add New Item">
 	 </div>
  	</form>
</div>
	


</body>
</html>