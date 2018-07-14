import javax.swing.*;
import javax.swing.table.TableColumn;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowEvent;
import java.util.ArrayList;


public class cus_ticket_ui extends JFrame {
    private String[] col_names = {"AirLine","From","To","Departure Time", "Arrival Time","Available Seats"};
    
    private ArrayList<ArrayList<String>> fdata;

    private DefaultTableModel model; 

    private JTable ticket_table; 
    private JScrollPane tbl_scrollpane;


    public cus_ticket_ui(ArrayList<ArrayList<String>> data){
    	fdata = data;
    	int num_rows = fdata.size();
    	int num_cols = 0;
    	if (num_rows > 0)
    		num_cols = fdata.get(0).size();
    	String[][] fdArr;
    	if (num_cols > 0) {
        	fdArr = new String[num_rows][num_cols - 4]; 
        	for (int i = 0; i < num_rows; i++) {
        		for (int j = 4; j < num_cols; j++) {
        			fdArr[i][j-4] = fdata.get(i).get(j);
        		}	
        	}
    	} else {
    		fdArr = new String[num_rows][num_cols];
    	}

    	model = new DefaultTableModel(fdArr, col_names);
    	ticket_table = new JTable(model);
    	tbl_scrollpane  = new JScrollPane(ticket_table);
        ticket_table.setRowHeight(30);
        ticket_table.setGridColor(Color.BLACK);
        ticket_table.setDefaultEditor(Object.class, null);
        ticket_table.addMouseListener(new MouseAdapter() {
            public void mouseClicked(MouseEvent e) {
                if (e.getClickCount() == 2) {
                    JTable target = (JTable)e.getSource();
                    int row = target.getSelectedRow();
                    int apid = Integer.parseInt(fdata.get(row).get(0));
                    int alid = Integer.parseInt(fdata.get(row).get(1));
                    choose_ticket(e, apid, alid);
                }
            }
        });

        setJTableColumnsWidth(ticket_table,800,10,25,25,15,15,10);

        add(tbl_scrollpane);

        setSize(1000,500);

        Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
        setLocation(dim.width/2-this.getSize().width/2, dim.height/2-this.getSize().height/2);


        setVisible(true);

    }


    public static void setJTableColumnsWidth(JTable table, int tablePreferredWidth,
                                             double... percentages) {
        double total = 0;
        for (int i = 0; i < table.getColumnModel().getColumnCount(); i++) {
            total += percentages[i];
        }

        for (int i = 0; i < table.getColumnModel().getColumnCount(); i++) {
            TableColumn column = table.getColumnModel().getColumn(i);
            column.setPreferredWidth((int)
                    (tablePreferredWidth * (percentages[i] / total)));
        }
    }

    public void choose_ticket(MouseEvent e, int apid, int alid){
    	cus_pay_ui open_payment = new cus_pay_ui(apid, alid);

        //TODO need to store the data

        this.dispatchEvent(new WindowEvent(this, WindowEvent.WINDOW_CLOSING));
    }

}
