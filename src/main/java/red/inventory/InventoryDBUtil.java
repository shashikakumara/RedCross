package red.inventory;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class InventoryDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean insertcustomer(String name, String shop, String date, int quantity, String user, double total) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		double unitPrice=0;
    		String sql1 = "SELECT unit FROM item WHERE name = '"+name+"' limit 1";
    		ResultSet unit1 = stmt.executeQuery(sql1);
		if(unit1.next()) 
			unitPrice = unit1.getDouble(1);
    		double total1 = unitPrice*quantity;
    		
    	    String sql = "insert into customer values (0,'"+name+"','"+shop+"','"+date+"','"+quantity+"','"+user+"','"+total1+"')";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }
	
	public static boolean insertcustomer1(String name, int quantity, double total) {
    	
    	boolean isSuccess = false;
    	
    	
    	try {
    		
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		double unitPrice=0;
    		String sql1 = "SELECT unit FROM item WHERE name = '"+name+"' limit 1";
    		ResultSet unit1 = stmt.executeQuery(sql1);
		if(unit1.next()) 
			unitPrice = unit1.getDouble(1);
    		double total1 = unitPrice*quantity;
		
    	    String sql = "update item set quantity=quantity+'"+quantity+"' where name='"+name+"'";
    	    String sql2 = "update item set total=total+'"+total1+"' where name='"+name+"'";
    		int rs = stmt.executeUpdate(sql);
    		int rs1 = stmt.executeUpdate(sql2);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }
	
	public static boolean updatecustomer(String id, String name, int quantity) {
    	
    	try {
    		
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		double unitPrice=0;
    		String sql1 = "SELECT unit FROM item WHERE name = '"+name+"' limit 1";
    		ResultSet unit1 = stmt.executeQuery(sql1);
		if(unit1.next()) 
			unitPrice = unit1.getDouble(1);
		
		
    		double total1 = unitPrice*quantity;
    		System.out.println(total1);
    		System.out.println("fsefwsfgwfg");
    		String sql = "update item set quantity=quantity-'"+quantity+"' where name='"+name+"'";
    		String sql2 = "update item set total=total-'"+total1+"' where name='"+name+"'";
    		int rs = stmt.executeUpdate(sql);
    		int rs1 = stmt.executeUpdate(sql2);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
	
	public static List<Inventory> getCustomerDetails(String Id) {
    	
    	int convertedID = Integer.parseInt(Id);
    	
    	ArrayList<Inventory> cus = new ArrayList<>();
    	
    	try {
    		
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "select * from customer where id='"+convertedID+"'";
    		rs = stmt.executeQuery(sql);
    		
    		while(rs.next()) {
    			int id = rs.getInt(1);
    			String name = rs.getString(2);
    			String shop = rs.getString(3);
    			String date = rs.getString(4);
    			int quantity = rs.getInt(6);
    			String user = rs.getString(7);
    			double total = rs.getDouble(8);
    			
    			Inventory c = new Inventory(id,name,shop,date,quantity,user,total);
    			cus.add(c);
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}	
    	return cus;	
    }
    
    

	public static boolean deleteInventory(String id) {
		int convId = Integer.parseInt(id);

    	
    	try {
    		
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		
    		String sql2 = "delete from customer where id='"+convId+"'";
    		int r = stmt.executeUpdate(sql2);
    		
    		if (r > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
	}

}
