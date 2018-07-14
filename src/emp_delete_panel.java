import java.awt.*;
import java.awt.event.ActionEvent;

import javax.swing.SwingUtilities;

public class emp_delete_panel extends Panel {

    private Label pid_lbl = new Label("PID");
    private TextField pid_txt = new TextField(15);
    private Button del_btn = new Button("Delete");

    public emp_delete_panel(){

        add(pid_lbl);
        add(pid_txt);
        add(del_btn);
        del_btn.addActionListener(this::delete);

    }

    public void delete(ActionEvent e){
    	Customer_gui cg = (Customer_gui) SwingUtilities.getWindowAncestor(this);
    	cg.qc.deletePerson(Integer.parseInt(pid_txt.getText()));
    }
}

