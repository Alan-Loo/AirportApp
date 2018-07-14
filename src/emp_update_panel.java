import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseEvent;

public class emp_update_panel extends Panel {
    private Panel pid_pnl = new Panel();
    private Panel employee_pnl = new Panel();
    private Panel name_pnl = new Panel();
    private Panel address_pnl = new Panel();
    private Panel phone_pnl = new Panel();
    private Panel ccard_pnl = new Panel();
    private Panel cust_pnl = new Panel();
    private Panel emp_info_pnl = new Panel();
    private Panel button_pnl = new Panel(new FlowLayout(FlowLayout.RIGHT));

    private JCheckBox emp_cb = new JCheckBox("Employee");
    private JCheckBox cust_cb = new JCheckBox("Customer");
    private JCheckBox mem_cb = new JCheckBox("Member?");

    private TextField pid_txt = new TextField(15);
    private Label pid_lbl = new Label("PID");

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
    
    private TextField points_txt = new TextField(15);
    private Label points_lbl = new Label("Points");
    
    private TextField fee_txt = new TextField(15);
    private Label fee_lbl = new Label("Points");

    private Button submit_btn = new Button("Submit");


    BoxLayout boxLayout = new BoxLayout(this,BoxLayout.Y_AXIS);
    public emp_update_panel(){
        setLayout(boxLayout);
        
        submit_btn.addActionListener(this::update);
        
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
                    cust_pnl.setVisible(true);
                }

                else{
                    ccard_pnl.setVisible(false);
                    cust_pnl.setVisible(false);
                }

            }
        });
        employee_pnl.add(cust_cb);
        employee_pnl.add(emp_cb);
        cust_cb.setSelected(true);
        emp_cb.setSelected(true);

        pid_pnl.add(pid_lbl);
        pid_pnl.add(pid_txt);

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


        ccard_pnl.add(ccard_lbl);
        ccard_pnl.add(ccard_txt);
        ccard_pnl.add(exp_lbl);
        month_txt.setText("MM");
        year_txt.setText("YY");
        ccard_pnl.add(month_txt);
        ccard_pnl.add(year_txt);

        cust_pnl.add(mem_cb);
        cust_pnl.add(points_lbl);
        cust_pnl.add(points_txt);
        //ccard_pnl.add(fee_lbl);
        //ccard_pnl.add(fee_txt);
        
        
        emp_info_pnl.add(job_lbl);
        emp_info_pnl.add(job_txt);
        emp_info_pnl.add(salary_lbl);
        emp_info_pnl.add(salary_txt);

        button_pnl.add(submit_btn);


        add(employee_pnl);
        add(pid_pnl);
        add(name_pnl);
        add(address_pnl);
        add(phone_pnl);
        add(ccard_pnl);
        add(cust_pnl);
        add(emp_info_pnl);
        add(button_pnl);
    }

    public void update(ActionEvent e) {
    	Customer_gui cg = (Customer_gui) SwingUtilities.getWindowAncestor(this);
    	Integer age = Integer.parseInt(age_txt.getText());
    	if(age < 1) {
    		System.out.println("Age constraint update violated");
    		return;
    	}
    	cg.qc.updatePerson(Integer.parseInt(pid_txt.getText()), name_txt.getText(),age , addresstxt.getText() , phone_txt.getText(), email_txt.getText());
    	if (cust_cb.isSelected()) {
    		String expdate = "20"+year_txt.getText()+"-"+month_txt.getText()+"-01";
    		cg.qc.updateCustomer(Integer.parseInt(pid_txt.getText()), mem_cb.isSelected(), Integer.parseInt(points_txt.getText()), ccard_txt.getText(), expdate);
    	}
    	if (emp_cb.isSelected()) {
    		cg.qc.updateAirportPersonnel(Integer.parseInt(pid_txt.getText()), Integer.parseInt(salary_txt.getText()), job_txt.getText()); 
    	}
    }
}
