import javax.swing.*;
import java.awt.*;

public class cus_pay_ui extends JFrame {
	private cus_ticket_panel main_pnl;

    public cus_pay_ui (int apid, int alid){
    	cus_ticket_panel main_pnl = new cus_ticket_panel(apid, alid);
        add(main_pnl);

        setSize(600  ,400);
        Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
        setLocation(dim.width/2-this.getSize().width/2, dim.height/2-this.getSize().height/2);

        setVisible(true);
    }
}
