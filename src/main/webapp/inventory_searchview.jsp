<%@ page import="java.util.*" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
    <head>
    <style type="text/css">
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
  			margin-bottom:10px;
		}
		
    </style>
    
    </head>
    <body>
    
    	<h1>Item Search result</h1>
    	<a href="inventory_view.jsp"><button class="btnback" align="right">Back</button></a>
        <table border="2">
           
            <tr>
                <td><b>Number</b></td>
                <td><b>Item Name</b></td>
                <td><b>Shop Purchased</b></td>
                <td><b>Date</b></td>
                <td><b>Quantity</b></td>
                <td><b>Entered By</b></td>
                <td><b>Total</b></td>

            </tr>
            <%
                int count = 0;
                String color = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al.toString());
                    
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
                        
            %>
            <tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
                <td><%=pList.get(4)%></td>
                <td><%=pList.get(5)%></td>
                <td><%=pList.get(6)%></td>
                
            </tr>
            <%
                    }
                }
                
            %>
            <%
            if (count == 0) {
            %>
            <tr>
                <td colspan=8 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            
            	}
            %>
        </table>
    </body>
</html>