import javax.swing.*;
import java.awt.*;

public class Anal_panel extends JTabbedPane {
    private Panel mpd_pnl;
    private Panel job_pnl;
    private Panel airp_pnl;


    public Anal_panel(){
    	mpd_pnl = new Anal_mpd_panel();
    	job_pnl = new Anal_job_panel();
    	airp_pnl = new Anal_airport_panel();
    	
        addTab("Popular Destinations", mpd_pnl);
        addTab("Jobs", job_pnl);
        addTab("Major Airports", airp_pnl);
    }

}
