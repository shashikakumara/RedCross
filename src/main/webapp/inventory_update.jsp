<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/hotell";
String userid = "root";
String password = "";

try {
	Class.forName(driver);
} 
catch (ClassNotFoundException e) {
	e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<%
try{
	connection = DriverManager.getConnection(connectionUrl, userid, password);
	statement=connection.createStatement();
	String sql ="select * from item where id="+id;
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Stock Out</title>
	
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
	
	input[type=number], select{
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
  		font-size: 20px;
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
	<h1>Stock Out</h1>
	
  	<form action="update" method="post">
  	<input type="hidden" name="cusid" value="<%=resultSet.getString("id") %>">
  	<div class="row">
    <div class="col-25">
      	<label for="fname">Item Number</label>
    	</div>
    	<div class="col-75">
      		<input type="text" name="id"  value="<%=resultSet.getString("id") %>" readonly >
    </div>
  	</div>
  	
  	<div class="row">
    <div class="col-25">
      	<label for="fname">Item Name</label>
    	</div>
    	<div class="col-75">
      		<input type="text" name="name" value="<%=resultSet.getString("name") %>" readonly> 
    </div>
  	</div>
  	
  	<div class="row">
    <div class="col-25">
      	<label for="lname">Quantity</label>
   		</div>
    	<div class="col-75">
      		<input type="number" name="quantity" max="<%=resultSet.getString("quantity") %>"  value="<%=resultSet.getString("quantity") %>"> 
    </div>
  	</div>

  	
  	<div class="row">
    	<input type="submit" value="Update The Item">
 	 </div>
	
	</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>