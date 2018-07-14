import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

public class cus_ticket_panel extends Panel{

	private int apid;
	private int alid;
	private Panel title_pnl = new Panel();
	private Label title_lbl = new Label("Ticket Purchase");
	private Panel price_pnl = new Panel();
    private Panel ccard_pnl = new Panel();
    private Panel exp_pnl = new Panel();
    private Panel pid_pnl = new Panel();
    private Panel buybtn_pnl = new Panel(new FlowLayout(FlowLayout.RIGHT));
    
    private TextField ccard_txt = new TextField(15);
    private Label ccard_lbl = new Label("Credit Card");

    private Label exp_lbl = new Label("Exp Date(MM YY)");
    private TextField month_txt = new TextField(2); 
    private TextField year_txt = new TextField(2);

    private Label pid_lbl = new Label("PID");
    private TextField pid_txt = new TextField(12);
    
    private TextField feedback_txt = new TextField(15);
    
    private Label class_lbl = new Label("Class");
    private JComboBox class_cmb = new JComboBox();

    private Label price_lbl = new Label("Price($)");
    private TextField price_txt = new TextField();
    
    private Label points_lbl = new Label("Use Points?");
    private JCheckBox points_cb = new JCheckBox();
    
    private Button buy_btn = new Button("Buy");

    BoxLayout boxLayout = new BoxLayout(this,BoxLayout.Y_AXIS);

    public cus_ticket_panel(int apid, int alid){
    	this.apid = apid;
    	this.alid = alid;
        setLayout(boxLayout);
        buy_btn.addActionListener(this::purchase);
        class_cmb.addActionListener(this::change_price);
        title_pnl.add(title_lbl);
        
        class_cmb.addItem("Business");
        class_cmb.addItem("Economy");
        class_cmb.addItem("First");
        price_txt.setEditable(false);
        
        
        price_pnl.add(class_lbl);
        price_pnl.add(class_cmb);
        price_pnl.add(price_lbl);
        price_pnl.add(price_txt);
        price_pnl.add(points_lbl);
        price_pnl.add(points_cb);

        pid_pnl.add(pid_lbl);
        pid_pnl.add(pid_txt);

        ccard_pnl.add(ccard_lbl);
        ccard_pnl.add(ccard_txt);

        month_txt.setText("MM");
        year_txt.setText("YY");
        exp_pnl.add(exp_lbl);
        exp_pnl.add(month_txt);
        exp_pnl.add(year_txt);

        feedback_txt.setEditable(false);
        buybtn_pnl.add(feedback_txt);
        buybtn_pnl.add(buy_btn);
        
        add(title_pnl);
        add(price_pnl);
        add(pid_pnl);
        add(ccard_pnl);
        add(exp_pnl);
        add(buybtn_pnl);
    }

    private void purchase(ActionEvent e) {
    	queryConnect qc = queryConnect.getInstance();
    	String expdate = "20"+year_txt.getText()+"-"+month_txt.getText()+"-01";
    	ArrayList<String> custData = qc.checkBillingInfo(Integer.parseInt(pid_txt.getText()), ccard_txt.getText(), expdate);
    	if (!custData.isEmpty()) {
    		// get data
    		int pid = Integer.parseInt(pid_txt.getText());
    		int price = Integer.parseInt(price_txt.getText());
    		String seatClass = (String)class_cmb.getSelectedItem();
    		int seatNum = qc.getSeatNum(apid, alid);
    		int custPoints = Integer.parseInt(custData.get(3));
    		
    		// register ticket
    		if (points_cb.isSelected()) {
    			if (custPoints >= price) {
    				qc.addPoints(pid, -price);
    				qc.registerForTicket(pid, apid, alid, 0, seatClass, seatNum);
    				qc.claimSeats(apid, alid, 1); 
    			} else {
    				qc.addPoints(pid, -custPoints);
    				qc.registerForTicket(pid, apid, alid, price-custPoints, seatClass, seatNum);
    				qc.claimSeats(apid, alid, 1); 
    			}
    			
    		} else {
    			qc.addPoints(pid, price/10);
				qc.registerForTicket(pid, apid, alid, price, seatClass, seatNum);
				qc.claimSeats(apid, alid, 1); 
    		}

    		feedback_txt.setText("Purchase Complete!");	
    		buy_btn.setEnabled(false);
    	} else {
    		feedback_txt.setText("Invalid Info Entered");
    	}
    }
    
    private void change_price(ActionEvent e) {
    	if (class_cmb.getSelectedItem().equals("Economy")) {
    		price_txt.setText("300");
    	} else if (class_cmb.getSelectedItem().equals("Business")) {
    		price_txt.setText("2000");
    	} else {
    		price_txt.setText("3500");
    	}
    }

}
