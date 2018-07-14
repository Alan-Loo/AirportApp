import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

public class cus_flight_panel extends Panel {
	private boolean started;
	
    private Panel from_pnl = new Panel();
    private Panel to_pnl = new Panel();
    private Panel fr_date_pnl = new Panel();
    private Panel al_pnl = new Panel();
    private Panel button_pnl = new Panel(new FlowLayout(FlowLayout.RIGHT));


    private Button search_btn = new Button("Search");
    private Button start_btn = new Button("Start");

    private Label al_label = new Label("Airline");
    private JComboBox al_combo = new JComboBox();
    
    private Label from_label = new Label("Depart From");
    private JComboBox from_combo = new JComboBox();

    private Label to_label = new Label("Destination");
    private JComboBox to_combo = new JComboBox();

    private Label dt_from_label = new Label("Depart On");
    private TextField year_txt = new TextField("YY",2);
    private TextField month_txt = new TextField("MM",2);
    private TextField day_txt = new TextField("DD",2);

    BoxLayout boxLayout = new BoxLayout(this,BoxLayout.Y_AXIS);

    public cus_flight_panel(){
    	started = false;

        setLayout(boxLayout);
        
        al_pnl.add(al_label);
        al_pnl.add(al_combo);
        al_combo.setPreferredSize(new Dimension(150, 20));
        al_combo.addItem("Any");
        
        from_pnl.add(from_label);
        from_pnl.add(from_combo);
        from_combo.addItem("Any");
        from_combo.setPreferredSize(new Dimension(150, 20));
        
        
        to_pnl.add(to_label);
        to_pnl.add(to_combo);
        to_combo.addItem("Any");
        to_combo.setPreferredSize(new Dimension(150, 20));

        fr_date_pnl.add(dt_from_label);
        fr_date_pnl.add(year_txt);
        fr_date_pnl.add(month_txt);
        fr_date_pnl.add(day_txt);

        start_btn.addActionListener(this::load);
        button_pnl.add(start_btn);
        button_pnl.add(search_btn); 

        search_btn.addActionListener(this::search_flight);

        add(al_pnl);
        add(from_pnl);
        add(to_pnl);
        add(fr_date_pnl);
        
        add(button_pnl);

        
    }

    public void search_flight(ActionEvent e){
    	Customer_gui cg = (Customer_gui) SwingUtilities.getWindowAncestor(this);
    	ArrayList<String[]> airlines = cg.qc.getAllAirline();

    	String date = "Any";
    	String alid = "Any";
    	String alName = (String)al_combo.getSelectedItem();
    	for (int i = 0; i < airlines.size(); i++) {
    		if (airlines.get(i)[1].equals(alName)) {
    			alid = airlines.get(i)[0];
    			break;
    		}
    	}
    	
    	if (cg.qc.validDate(year_txt.getText(), month_txt.getText(), day_txt.getText())) {
    		date =  year_txt.getText()+"-"+month_txt.getText()+"-"+day_txt.getText();
    	}
    	ArrayList<ArrayList<String>> flights = cg.qc.getFlightData(alid, (String)from_combo.getSelectedItem(), (String)to_combo.getSelectedItem(),date);

    	cus_ticket_ui ticket_ui = new cus_ticket_ui(flights);
    }

    public void load(ActionEvent e){
    	if (!started) {
    		started = true;
    		start_btn.setLabel("Refresh");
    	}
    	al_combo.removeAll();
    	from_combo.removeAll();
    	to_combo.removeAll();

    	Customer_gui cg = (Customer_gui) SwingUtilities.getWindowAncestor(this);
    	ArrayList<String[]> airlines = cg.qc.getAllAirline();
        for (int i = 0; i < airlines.size(); i++) {
        	al_combo.addItem(airlines.get(i)[1]);
        }
    	
        ArrayList<String> countries = cg.qc.getAllCountry();
        for (int i = 0; i < countries.size(); i++) {
        	from_combo.addItem(countries.get(i));
        	to_combo.addItem(countries.get(i));
        }
        
        al_combo.setSelectedIndex(0);
        from_combo.setSelectedIndex(0);
        to_combo.setSelectedIndex(0);
    }
    

}
