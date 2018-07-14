
import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

public class Anal_mpd_panel extends Panel{
	private Button go_btn; 
	
	public Anal_mpd_panel() {
		go_btn = new Button("Go");
		add(go_btn);
		go_btn.addActionListener(this::getPopularDest);
	}
	
	private void getPopularDest(ActionEvent e) {
		queryConnect qc = queryConnect.getInstance();
		ArrayList<ArrayList<String>> destinations = qc.mostPopularDestination();
		Anal_mpd_display display = new Anal_mpd_display(destinations);
	}
}
