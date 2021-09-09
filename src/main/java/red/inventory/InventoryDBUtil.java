package red.inventory;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;


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

}
