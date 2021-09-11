
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
  			font-size: 15px;
  			font-weight: bold;
  			padding:10px 30px;
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
		
		.btnget{
			background-color: red;
			border: none;
			color:white;
  			text-align: center;
  			text-decoration: none;
  			display: inline-block;
  			font-size: 20px;
  			font-weight: bold;
  			width:100%;
  			padding:10px 100px;
  			justify-content: center;
  			align-items: center;
  			margin-top:20px;
		}
		
		h1{
			color:#E42217;
			font-size:40px;
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
		
		
		
	</style>
</head>
<body>
<h1 align="center"><font><strong>Current Stock Report</strong></font></h1>
<a href="inventory_login.jsp"><button class="btnback">Back</button></a>
<table border="2">
<tr></tr>

<td><b>Number</b></td>
<td><b>Item Name</b></td>
<td><b>Quantity</b></td>
<td><b>Total</b></td>

</tr>
<%
int total=0;
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM item";


resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	
%>


<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("quantity") %></td>
<td><%=resultSet.getString("total") %></td>



</tr>

</a>

<% 
total+=Integer.parseInt(resultSet.getString("total"));
}

} catch (Exception e) {
e.printStackTrace();
}
%>
<tr>
<td bgcolor="#E5E4E2" colspan=3>Total</td>
<td bgcolor="#E5E4E2"><%out.println(total); %></td>
</tr>

</table>
<a href="inventory_report"><button class="btnget">Get A Print</button>
</body>
</html>