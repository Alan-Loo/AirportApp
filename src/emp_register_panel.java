import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseEvent;

public class emp_register_panel extends Panel {
    private Panel employee_pnl = new Panel();
    private Panel name_pnl = new Panel();
    private Panel address_pnl = new Panel();
    private Panel phone_pnl = new Panel();
    private Panel ccard_pnl = new Panel();
    private Panel emp_info_pnl = new Panel();
    private Panel regbtn_pnl = new Panel(new FlowLayout(FlowLayout.RIGHT));

    private JCheckBox emp_cb = new JCheckBox("Employee");
    private JCheckBox cust_cb = new JCheckBox("Customer");
    private JCheckBox mem_cb = new JCheckBox("Member?");
    
    private TextField name_txt = new TextField(15);
    private Label name_lbl = new Label("Name");

    private TextField addresstxt = new TextField(40);
    private Label address_lbl = new Label("Address");

    private TextField phone_txt = new TextField(15);
    private Label phone_lbl = new Label("Phone");

    private TextField email_txt = new TextField(15);
    private Label email_lbl = new Label("E-mail");

    private TextField age_txt = new TextField(15);
    private Label age_lbl = new Label("Age");

    private TextField ccard_txt = new TextField(15);
    private Label ccard_lbl = new Label("Credit Card");

    private Label exp_lbl = new Label("Exp Date(MM YY)");
    private TextField month_txt = new TextField(2); 
    private TextField year_txt = new TextField(2);

    private TextField job_txt = new TextField(15);
    private Label job_lbl = new Label("Job");

    private TextField salary_txt = new TextField(15);
    private Label salary_lbl = new Label("Salary");
    
    private TextField airID_txt = new TextField(15);
    private Label airID_lbl = new Label("AirID");

    private Button buy_btn = new Button("Register");

    BoxLayout boxLayout = new BoxLayout(this,BoxLayout.Y_AXIS);
    public emp_register_panel(){
        setLayout(boxLayout);
        
        employee_pnl.add(cust_cb);
        employee_pnl.add(emp_cb);
        cust_cb.setSelected(true);
        emp_cb.setSelected(true);
        
        buy_btn.addActionListener(this::register);

        name_pnl.add(name_lbl);
        name_pnl.add(name_txt);

        name_pnl.add(age_lbl);
        name_pnl.add(age_txt);
        
        address_pnl.add(address_lbl);
        address_pnl.add(addresstxt);

        phone_pnl.add(phone_lbl);
        phone_pnl.add(phone_txt);
        phone_pnl.add(email_lbl);
        phone_pnl.add(email_txt);

        ccard_pnl.add(mem_cb);
        ccard_pnl.add(ccard_lbl);
        ccard_pnl.add(ccard_txt);
        ccard_pnl.add(exp_lbl);
        month_txt.setText("MM");
        year_txt.setText("YY");
        ccard_pnl.add(month_txt);
        ccard_pnl.add(year_txt);

        emp_info_pnl.add(job_lbl);
        emp_info_pnl.add(job_txt);
        emp_info_pnl.add(salary_lbl);
        emp_info_pnl.add(salary_txt);
        emp_info_pnl.add(airID_lbl);
        emp_info_pnl.add(airID_txt);
        
        regbtn_pnl.add(buy_btn);

        add(employee_pnl);
        add(name_pnl);
        add(address_pnl);
        add(phone_pnl);
        add(ccard_pnl);
        add(emp_info_pnl);
        add(regbtn_pnl);

        emp_cb.addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                int checked = e.getStateChange();
                if (checked == 1){
                    emp_info_pnl.setVisible(true);
                }

                else{
                    emp_info_pnl.setVisible(false);
                }

            }
        });
        cust_cb.addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent e) {
                int checked = e.getStateChange();
                if (checked == 1){
                    ccard_pnl.setVisible(true);
                }

                else{
                    ccard_pnl.setVisible(false);
                }

            }
        });
    }

    
    public void register(ActionEvent e) {
    	Customer_gui cg = (Customer_gui) SwingUtilities.getWindowAncestor(this);
    	Integer age = Integer.parseInt(age_txt.getText());
    	if(age < 1) {
    		System.out.println("Age Constraint Violated Not Inserted");
    		return;
    	}
    	
    	if (cust_cb.isSelected()) {
    		String membership = "No";
    		if (mem_cb.isSelected())
    			membership = "Yes";
    		String expdate = "20"+year_txt.getText()+"-"+month_txt.getText()+"-01";
    		int pid = cg.qc.insertPerson(name_txt.getText(), age , addresstxt.getText() , phone_txt.getText(), email_txt.getText());
    		cg.qc.insertCustomer(pid, membership, ccard_txt.getText(), expdate);
    	}
    	if (emp_cb.isSelected()) {
        	Integer salary = Integer.parseInt(salary_txt.getText());
        	if(salary < 1) {
        		System.out.println("Salary Constraint Violated Not Inserted");
        		return;
        	}
        	int pid = cg.qc.insertPerson(name_txt.getText(), age , addresstxt.getText() , phone_txt.getText(), email_txt.getText());
    		cg.qc.insertPersonnel(Integer.parseInt(airID_txt.getText()), pid, Integer.parseInt(salary_txt.getText()), job_txt.getText()); 
    	}
    }

}
