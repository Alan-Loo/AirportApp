import javax.swing.*;
import java.awt.*;

public class emp_register_view_panel extends JTabbedPane {

    //private JTabbedPane tabbedPane = new JTabbedPane();

    private Panel register_panel = new emp_register_panel();
    private Panel update_panel = new emp_update_panel();
    private Panel view_panel = new emp_view_panel();
    private Panel del_panel = new emp_delete_panel();


    public emp_register_view_panel(){
        addTab("Register", register_panel);
        addTab("Update", update_panel);
        addTab("View", view_panel);
        addTab("Delete", del_panel);


    }




}
