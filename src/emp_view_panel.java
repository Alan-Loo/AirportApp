import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

public class emp_view_panel extends Panel {

    private Button flight_btn = new Button("View Tickets");

    public emp_view_panel(){
        add(flight_btn);
        flight_btn.addActionListener(this::open_flight_table);

    }

    public void open_flight_table(ActionEvent e){
    	queryConnect qc = queryConnect.getInstance();
    	ArrayList<String[]> tickets = qc.getTickets();
        emp_flight_table eft = new emp_flight_table(tickets);
    }
}
