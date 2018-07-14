import java.awt.*;
import java.awt.event.ActionEvent;
import java.util.ArrayList;

import javax.swing.BoxLayout;

public class Anal_job_panel extends Panel{
	private Button max_btn; 
	private Button min_btn;
	private Button smax_btn; 
	private Button smin_btn;
	private Button age_btn;
	
	private TextField max_txt;
	private TextField min_txt;
	private TextField smax_txt;
	private TextField smin_txt;
	
	private Panel max_pnl;
	private Panel min_pnl;
	private Panel smax_pnl;
	private Panel smin_pnl;
	private Panel age_pnl;
	
	private Label age_lbl;
	private TextField low_txt;
	private TextField high_txt;
	
	public Anal_job_panel() {
		BoxLayout boxLayout = new BoxLayout(this,BoxLayout.Y_AXIS);
		setLayout(boxLayout);
		max_pnl = new Panel();
		min_pnl = new Panel(); 
		smax_pnl = new Panel();
		smin_pnl = new Panel(); 
		age_pnl = new Panel();
		
		max_btn = new Button("Highest avg Salary:");
		max_btn.addActionListener(this::getMaxJob);
		max_txt = new TextField(30);
		max_txt.setEditable(false);
		
		min_btn = new Button("Lowest avg Salary:");
		min_btn.addActionListener(this::getMinJob);
		min_txt = new TextField(30);
		min_txt.setEditable(false);
		
		smax_btn = new Button("MAX Salary:");
		smax_btn.addActionListener(this::getSmaxJob);
		smax_txt = new TextField(30);
		smax_txt.setEditable(false);
		
		smin_btn = new Button("MIN Salary:");
		smin_btn.addActionListener(this::getSminJob);
		smin_txt = new TextField(30);
		smin_txt.setEditable(false);
		
		age_lbl = new Label("Age Range:");
		low_txt = new TextField(4);
		high_txt = new TextField(4);
		age_btn = new Button("Go");
		
		age_pnl.add(age_lbl);
		age_pnl.add(low_txt);
		age_pnl.add(high_txt);
		age_pnl.add(age_btn);
		age_btn.addActionListener(this::getAgeJob);
		
		max_pnl.add(max_btn);
		max_pnl.add(max_txt);
		smax_pnl.add(smax_btn);
		smax_pnl.add(smax_txt);
		min_pnl.add(min_btn);
		min_pnl.add(min_txt);
		smin_pnl.add(smin_btn);
		smin_pnl.add(smin_txt);
		
		add(max_pnl);
		add(smax_pnl);
		add(min_pnl);
		add(smin_pnl);
		add(age_pnl);
	}
	
	private void getMaxJob(ActionEvent e) {
		queryConnect qc = queryConnect.getInstance();
		String job = qc.jobHighestSalary();
		max_txt.setText(job);
	}
	
	private void getMinJob(ActionEvent e) {
		queryConnect qc = queryConnect.getInstance();
		String job = qc.jobLowestSalary();
		min_txt.setText(job);
	}
	
	private void getSmaxJob(ActionEvent e) {
		queryConnect qc = queryConnect.getInstance();
		String job = qc.jobSHighestSalary();
		smax_txt.setText(job);
	}
	
	private void getSminJob(ActionEvent e) {
		queryConnect qc = queryConnect.getInstance();
		String job = qc.jobSLowestSalary();
		smin_txt.setText(job);
	}
	
	private void getAgeJob(ActionEvent e) {
		queryConnect qc = queryConnect.getInstance();
		ArrayList<String[]> jobs = qc.queryPersonnelAge(Integer.parseInt(low_txt.getText()), Integer.parseInt(high_txt.getText()));
		Anal_age_display display = new Anal_age_display(jobs);
	}
}
