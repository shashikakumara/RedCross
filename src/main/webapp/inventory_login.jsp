<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	
	<style type="text/css">
		*{
			box-sizing:border-box
		}
		
		h1{
			color:#E42217;
			font-size:80px;
			text-align:center;
			margin-top:80px;
		}
		
		button{
			background-color: red;
			border: none;
			color:white;
  			text-align: center;
  			text-decoration: none;
  			display: inline-block;
  			font-size: 40px;
  			font-weight: bold;
  			padding:25px 50px;
  			justify-content: center;
  			align-items: center;
		}
		
		.column {
  			float: left;
  			width: 50%;
  			padding: 10px;
  			height: 100px;
		}

		.row:after {
  			content: "";
  			display: table;
  			clear: both;
		}
		
		.roww{
			width:75%;
			margin:0 auto;
		}
		
		.btn button{
			width:500px !important;
		}
	</style>
	
</head>
<body>

	<h1>Welcome To Inventory Page</h1>
	<div class="roww">
		<div class="row">
  			<div class="column btn">
    			<a href="inventory_insert.jsp"><button>Add New Item</button></a>
    
  			</div>
  			<div class="column btn">
   				<a href="inventory_view.jsp"><button>View All and Delete</button></a>
    
  			</div>
		</div>
		<div class="row">
 		 	<div class="column btn" >
    			<a href="inventory_stock.jsp"><button>Stock</button></a>
    
  			</div>
  			<div class="column btn">
    			<a href="inventory_getreport.jsp"><button>Get Report</button></a>
    
 			 </div>
		</div>
	</div>
	

</body>
</html>