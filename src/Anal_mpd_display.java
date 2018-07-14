import javax.swing.*;
import javax.swing.table.TableColumn;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.ArrayList;


public class Anal_mpd_display extends JFrame {
    private String[] col_names = {"City","Ticket Sales"};
    
    private ArrayList<ArrayList<String>> ddata;

    private DefaultTableModel model; 

    private JTable dest_table; 
    private JScrollPane tbl_scrollpane;


    public Anal_mpd_display(ArrayList<ArrayList<String>> data){
    	ddata = data;
    	int num_rows = ddata.size();
    	int num_cols = ddata.get(0).size();
    	String[][] fdArr = new String[num_rows][num_cols]; 
    	for (int i = 0; i < num_rows; i++) {
    		for (int j = 0; j < num_cols; j++) {
    			fdArr[i][j] = ddata.get(i).get(j);
    		}	
    	}
    	model = new DefaultTableModel(fdArr, col_names);
    	dest_table = new JTable(model);
    	tbl_scrollpane  = new JScrollPane(dest_table);
        dest_table.setRowHeight(30);
        dest_table.setGridColor(Color.BLACK);
        dest_table.setDefaultEditor(Object.class, null);

        setJTableColumnsWidth(dest_table,800,80,20);

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
