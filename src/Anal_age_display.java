import javax.swing.*;
import javax.swing.table.TableColumn;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.ArrayList;


public class Anal_age_display extends JFrame {
    private String[] col_names = {"Job Description","Salary ($)"};
    
    private ArrayList<String[]> ddata;

    private DefaultTableModel model; 

    private JTable dest_table; 
    private JScrollPane tbl_scrollpane;


    public Anal_age_display(ArrayList<String[]> data){
    	this.ddata = data;
    	int num_rows = 0;
    	if (ddata.size() > 0) {
    		num_rows = ddata.size();
    	}
    	String[][] fdArr = new String[1][2];
    	if (num_rows > 0) {
    		fdArr = new String[num_rows][2]; 
    	}   		
    	for (int i = 0; i < num_rows; i++) {
    		fdArr[i][0] = ddata.get(i)[0];
    		fdArr[i][1] = ddata.get(i)[1];	
    	}
    	model = new DefaultTableModel(fdArr, col_names);
    	dest_table = new JTable(model);
    	tbl_scrollpane  = new JScrollPane(dest_table);
        dest_table.setRowHeight(30);
        dest_table.setGridColor(Color.BLACK);
        dest_table.setDefaultEditor(Object.class, null);

        setJTableColumnsWidth(dest_table,800,50,50);

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
