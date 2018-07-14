import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

public class Anal_airport_panel extends Panel{
	private Button go_btn; 
	
	public Anal_airport_panel() {
		go_btn = new Button("Go");
		add(go_btn);
		go_btn.addActionListener(this::getAllConAirports);
	}
	
	private void getAllConAirports(ActionEvent e) {
		queryConnect qc = queryConnect.getInstance();
		ArrayList<String[]> airports = qc.connectedToAll();
		Anal_airport_display display = new Anal_airport_display(airports);
	}
}
