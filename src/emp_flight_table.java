import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import java.awt.*;
import java.util.ArrayList;

public class emp_flight_table extends JFrame {

    private String[] col_names = {"PID","APID","ALID","Price","Class","SeatNum"};

    DefaultTableModel model = new DefaultTableModel(null, col_names);
    private JTable ticket_table = new JTable(model);
    private JScrollPane tbl_scrollpane = new JScrollPane(ticket_table);

    public emp_flight_table(ArrayList<String[]> data){
    	int num_rows = 0;
    	if (data.size() > 0) {
    		num_rows = data.size();
    	}
    	String[][] fdArr = new String[1][6];
    	if (num_rows > 0) {
    		fdArr = new String[num_rows][6]; 
    	}   		
    	for (int i = 0; i < num_rows; i++) {
    		fdArr[i][0] = data.get(i)[0];
    		fdArr[i][1] = data.get(i)[1];	
    		fdArr[i][2] = data.get(i)[2];	
    		fdArr[i][3] = data.get(i)[3];
    		fdArr[i][4] = data.get(i)[4];
    		fdArr[i][5] = data.get(i)[5];
    	}
    	model = new DefaultTableModel(fdArr, col_names);
    	ticket_table = new JTable(model);
    	tbl_scrollpane  = new JScrollPane(ticket_table);
        ticket_table.setRowHeight(30);
        ticket_table.setGridColor(Color.BLACK);
        ticket_table.setDefaultEditor(Object.class, null);

        setJTableColumnsWidth(ticket_table,800,20,15,10,20,25,10);

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
}
