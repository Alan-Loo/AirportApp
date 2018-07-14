import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

    
    
public class Customer_gui extends JFrame {
	
    private Panel cust_pnl = new cus_flight_panel();
    private JTabbedPane employ_pnl = new emp_register_view_panel();
    private JTabbedPane anal_pnl = new Anal_panel();
    private JTabbedPane tabbedPane = new JTabbedPane();
    public static queryConnect qc;

    public Customer_gui() {
    	qc = queryConnect.getInstance();

        // add tabs
        tabbedPane.addTab("Customer",cust_pnl);
        tabbedPane.addTab("Employee",employ_pnl);
        tabbedPane.addTab("Analysis", anal_pnl);


        add(tabbedPane);


        setSize(800,400);

        Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
        setLocation(dim.width/2-this.getSize().width/2, dim.height/2-this.getSize().height/2);


        setVisible(true);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);


    }



    public static void main(String[] args) {
        // Invoke the constructor to setup the GUI, by allocating an instance
        Customer_gui app = new Customer_gui();
    }

}