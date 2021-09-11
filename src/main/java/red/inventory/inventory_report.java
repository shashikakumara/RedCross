package red.inventory;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/inventory_report")
public class inventory_report extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public inventory_report() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setHeader("content-type", "text/csv");
		response.setHeader("content-disposition", "attachment;filename = Stock Report.csv");
        PrintWriter w = response.getWriter();

        ArrayList<Invent> invent = InventoryDBUtil.getAllInventory1();
               
        String output = "Id, Name, Quantity, Unit, Total \n";

        for (Invent d : invent) {
            output += d.getId() + ", " + d.getName() + ", " + d.getQuantity()+", "+d.getUnit()+","+d.getQuantity()*d.getUnit()+"    \n";
        }
       
        w.println(output);

        w.flush();
        w.close();
	}

}
