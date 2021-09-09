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
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>View All and Delete</title>
	

	<style type="text/css">
		button{
			background-color: red;
			border: none;
			color:white;
  			text-align: center;
  			text-decoration: none;
  			display: inline-block;
  			font-size: 10px;
  			font-weight: bold;
  			padding:10px 30px;
  			justify-content: center;
  			align-items: center;
		}
		
		btn button{
			background-color: red;
			border: none;
			color:white;
  			text-align: center;
  			text-decoration: none;
  			display: inline-block;
  			font-size: 20px;
  			font-weight: bold;
  			padding:15px 30px;
  			justify-content: center;
  			align-items: center;
		}
		
		.btnback{
			background-color: red;
			border: none;
			color:white;
  			text-align: center;
  			text-decoration: none;
  			display: inline-block;
  			font-size: 20px;
  			font-weight: bold;
  			justify-content: center;
  			padding:10px 50px;
  			align-items: center;
  			margin-bottom:20px;
		}
		
		h1{
			color:#E42217;
			font-size:50px;
			text-align:center;
			margin-top:20px;
		}
		
		table{
			width:100%;
			font-family: Arial, Helvetica, sans-serif;
  			border-collapse: collapse;
  			font-size:20px;
 			text-align:center;
		}
		
		input[type=text], select{
  		width: 50%;
  		padding: 12px;
  		border: 1px solid #ccc;
  		border-radius: 4px;
  		resize: vertical;
  		margin-bottom:5px;
  		
		}
		
		input[type=submit] {
  		background-color: red;
  		color: white;
  		padding: 12px 20px;
 		border: none;
  		border-radius: 4px;
  		cursor: pointer;
  		float: left;
  		width:40%;
  		margin-bottom:5px;
	}
		
		
		
	</style>
</head>
<body>
	<h1 align="center"><font><strong>View All and Delete</strong></font></h1>
	<div id="btn">
		<a href="inventory_login.jsp"><button class="btnback" align="right">Back</button></a>
	</div>
	<div class=search>
		<form action="Inventory_Search" name="frm" method="post">
		<table align="center">
			<tr>
			<td colspan=2 style="font-size:12pt;" align="center">
			<td><label for="fname">Search data by Item Name</label></td>
			<td><input type="text" name="name" ></td>
			<td><input  type="submit" name="submit" value="Search"></td></tr>
		</table>
	</form>
	</div>
	<table border="2">
	<tr></tr>

		<td><b>Number</b></td>
		<td><b>Item Name</b></td>
		<td><b>Shop Name</b></td>
		<td><b>Date</b></td>
		<td><b>Quantity</b></td>
		<td><b>Entered By</b></td>
		<td><b>Total</b></td>
		<td><b>Delete</b></td>
	</tr>
	

<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM customer";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("shop") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("quantity") %></td>
<td><%=resultSet.getString("user") %></td>
<td><%=resultSet.getString("total") %></td>
<td><a href="inventory_delete.jsp?id=<%=resultSet.getString("id")%>&name=<%=resultSet.getString("name")%>&quantity=<%=resultSet.getString("quantity")%>">Delete</a></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</body>

</html>