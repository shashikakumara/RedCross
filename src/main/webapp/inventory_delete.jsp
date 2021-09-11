<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
int quantity = Integer.parseInt(request.getParameter("quantity"));
String name=request.getParameter("name");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotell", "root", "");
Statement st=conn.createStatement();
//String sql = "update item set quantity=quantity-'"+quantity+"' where name='"+name+"'";
//int rs = st.executeUpdate(sql);
int i=st.executeUpdate("DELETE FROM customer WHERE id="+id);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<style type="text/css">
	*{
  		box-sizing: border-box;
	}
	
	h1{
		color:#E42217;
		font-size:70px;
		text-align:center;
		margin-top:50px;
	}
	
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
  			margin-top:50px;
		}
		
	</style>

<h1>Data Deleted Successfully</h1>
<a href="inventory_view.jsp"><button align="right">Back</button></a>