import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class queryConnect {
	
	private Connection con; //connecting stuff at top
	private Integer pid = 123456; //incrementing index for pid 
	private Integer fee = 1000; //fee for customers
	private static queryConnect single_instance = null;
	// Constructor for queryConnect (makes a query connection object) establishes connection with database
	private queryConnect(String username, String password) {		
		connect(username, password);
	}

	public static queryConnect getInstance() {
		if (single_instance == null)
			single_instance = new queryConnect(" ", " "); //queryConnect object with user and pass (put username and password here)
		return single_instance;
	}
	
    /*
     * connects to Oracle database named ug using user supplied username and password
     */ 
    public boolean connect(String username, String password)
    {
      String connectURL = " jdbc:oracle:thin:@localhost:1522:ug";

      try 
      {
    DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
	con = DriverManager.getConnection(connectURL,username,password);

	System.out.println("\nConnected to Oracle!");
	return true;
      }
      catch (SQLException ex)
      {
	System.out.println("Message: " + ex.getMessage());
	return false;
      }
    }
    
    
    
    //insert a person tuple into people table (working)
    public int insertPerson(String name, Integer age, String address, String phone, String email) 
    {
    	PreparedStatement  ps;
  	  
    	try
    	{
    	  System.out.print("Inserting person...\n");
    	  ps = con.prepareStatement("INSERT INTO people VALUES (?,?,?,?,?,?)"); 
    	  
    	  pid++;
    	  ps.setInt(1, pid);
    	  System.out.printf("PID: %d\n", pid);

    	  ps.setString(2, name);
    	  System.out.printf("Name: %s\n", name);
    		   
    	  ps.setInt(3, age);
    	  System.out.printf("Age: %d\n", age);
    	  
    	  
    	  
    	  if (address.length() == 0) //address is empty
              {
    	      ps.setString(4, null);
    	  }
    	  else
    	  {
    	      ps.setString(4, address);
    	  }
    	  System.out.printf("Address: %s\n", address);
    	 
    	  
    	  ps.setString(5, phone);
    	  System.out.printf("Phone: %s\n", phone);
    	  
    	  
    	  if (email.length() == 0)
    	  {
    	      ps.setString(6, null);
    	  }
    	  else
    	  {
    	      ps.setString(6, email);
    	  }
    	  System.out.printf("Email: %s\n\n", email);
    	  
    	  ps.executeUpdate();

    	  // commit work 
    	  con.commit();

    	  ps.close();
    	}
    	catch (SQLException ex)
    	{
    		System.out.println("Insertion Failed!");
    	    System.out.println("Message: " + ex.getMessage());
    	    try 
    	    {
    		// undo the insert
    		con.rollback();	
    	    }
    	    catch (SQLException ex2)
    	    {
    		System.out.println("Message: " + ex2.getMessage());
    		System.exit(-1);
    	    }
    	}
    	return pid;
    }
    
    
    //insert customer into Customer table with no points date needs to be passed in format as (yy/mm) (working)
    public void insertCustomer(Integer pid, String member, String ccnum, String exp) {
     	PreparedStatement  ps;
    	  
    	try
    	{
    	  System.out.print("Inserting Customer...");
    	  ps = con.prepareStatement("INSERT INTO customer VALUES (?,?,?,?,?,?)");
    	  
    	  ps.setInt(1, pid);
    	  System.out.printf("\nPID: %d", pid);
    	  
    	  ps.setString(2, member);
    	  System.out.printf("\nMember: %s", member);
    	  
    	  ps.setInt(3, fee);
    	  System.out.printf("\nFee: %d", fee);
    	  
    	  ps.setInt(4, 0);
    	  System.out.printf("\nPoints: %d", 0);
    	  
    	  ps.setString(5, ccnum);
    	  System.out.printf("\nCCNUM: %s", ccnum);
    	  

    	  Date expDate = Date.valueOf(LocalDate.parse(exp));
    	  ps.setDate(6, expDate);
    	  System.out.printf("\nExp: %s\n\n", exp);
    	  
    	  ps.executeUpdate();

    	  // commit work 
    	  con.commit();

    	  ps.close();
    	}
    	catch (SQLException ex)
    	{
    		System.out.println("Insertion Failed!");
    	    System.out.println("Message: " + ex.getMessage());
    	    try 
    	    {
    		// undo the insert
    		con.rollback();	
    	    }
    	    catch (SQLException ex2)
    	    {
    		System.out.println("Message: " + ex2.getMessage());
    		System.exit(-1);
    	    }
    	}
    }
    
    
    //insert airport personnel into AirportPersonnel given pid (broken atm) needs work 
    public void insertPersonnel(Integer AirID, Integer pid, Integer salary, String job) 
    {
      	PreparedStatement  ps;
  	  
    	try
    	{
    	  System.out.print("Inserting Personnel...");
    	  ps = con.prepareStatement("INSERT INTO AirportPersonnel VALUES (?,?,?,?)"); 
    	
    	  
    	  ps.setInt(1, AirID);
    	  System.out.printf("\nAirID: %d", AirID);
    	  
    	  ps.setInt(2, pid);
    	  System.out.printf("\nPID: %d", pid);
    	  
    	  ps.setInt(3, salary);
    	  System.out.printf("\nSalary: %d", salary);
    	  
    	  ps.setString(4, job);
    	  System.out.printf("\nJob: %s\n\n", job);
    	  
    	  ps.executeUpdate();

    	  // commit work 
    	  con.commit();

    	  ps.close();
    	}
    	catch (SQLException ex)
    	{
    		System.out.println("Insertion Failed!");
    	    System.out.println("Message: " + ex.getMessage());
    	    try 
    	    {
    		// undo the insert
    		con.rollback();	
    	    }
    	    catch (SQLException ex2)
    	    {
    		System.out.println("Message: " + ex2.getMessage());
    		System.exit(-1);
    	    }
    	}
    }
    
    
    
    //registers customer for ticket given class, Seatnum, ALID, PID, APID 
    public void registerForTicket(Integer pid, Integer apid, Integer alid, Integer price, String seatClass, Integer seatNum)
    { 
       	PreparedStatement  ps;
    	  
    	try
    	{
    	  System.out.print("Registering for ticket...");
    	  ps = con.prepareStatement("INSERT INTO ticket VALUES (?,?,?,?,?,?)"); 
    	
    	  ps.setInt(1, pid);
    	  System.out.printf("\nPID: %d", pid);
    	  
    	  ps.setInt(2, apid);
    	  System.out.printf("\nAPID: %d", apid);
    	  
    	  ps.setInt(3, alid);
    	  System.out.printf("\nALID: %d", alid);
    	  
    	  ps.setInt(4, price);
    	  System.out.printf("\nPrice: %d", price);
    	  
    	  ps.setString(5, seatClass);
    	  System.out.printf("\nSeatClass: %s", seatClass);
    	  
    	  ps.setInt(6, seatNum);
    	  System.out.printf("\nSeatNum: %d\n\n", seatNum);
    	  ps.executeUpdate();

    	  // commit work 
    	  con.commit();

    	  ps.close();
    	}
    	catch (SQLException ex)
    	{
    		System.out.println("Registration Failed!");
    	    System.out.println("Message: " + ex.getMessage());
    	    try 
    	    {
    		// undo the insert
    		con.rollback();	
    	    }
    	    catch (SQLException ex2)
    	    {
    		System.out.println("Message: " + ex2.getMessage());
    		System.exit(-1);
    	    }
    	}
    }

    
    //update Person (working)
    public void updatePerson(Integer pid, String name, Integer age, String address, String phone, String email) 
    {
    	PreparedStatement  ps;
  	  
    	try
    	{
          System.out.print("Updating People...");
    	  ps = con.prepareStatement("UPDATE people SET name = ?, age = ?, address = ?, phone = ?, email = ? WHERE PID = ?");
    	
    	  System.out.printf("\nPID: %s", pid);
    	  ps.setInt(6, pid);

    	  System.out.printf("\nName: %s", name);
    	  ps.setString(1, name);
    	  
    	  System.out.printf("\nAge: %d", age);
    	  ps.setInt(2, age);
    	  
    	  System.out.printf("\nAddress: %s", address);
    	  ps.setString(3, address);
    	  
    	  System.out.printf("\nPhone: %s", phone);
    	  ps.setString(4, phone);
    	  
    	  System.out.printf("\nEmail: %s\n\n", email);
    	  ps.setString(5, email);

    	  int rowCount = ps.executeUpdate();
    	  if (rowCount == 0)
    	  {
    	      System.out.println("\nPerson " + pid + " does not exist!");
    	      System.out.println("Update failed!");
    	  }

    	  con.commit();

    	  ps.close();
    	}
    	catch (SQLException ex)
    	{
    		System.out.println("Update failed!");
    	    System.out.println("Message: " + ex.getMessage());
    	    
    	    try 
    	    {
    		con.rollback();	
    	    }
    	    catch (SQLException ex2)
    	    {
    		System.out.println("Message: " + ex2.getMessage());
    		System.exit(-1);
    	    }
    	}	
    }
    
    
    
    
    
    //update Customer info in customer table given pid all except fee (exp - expiry date) 
    public void updateCustomer(Integer pid, Boolean member,  Integer points, String ccnum, String exp) {
       	PreparedStatement  ps;
    	  
    	try
    	{
    	  System.out.print("Updating Customers...");	
    	  ps = con.prepareStatement("UPDATE customer SET member = ?, points = ?, ccnum = ?, ccexpirydate = ? WHERE PID = ?");
    	
    	  System.out.printf("\nPID: %d", pid);
    	  ps.setInt(5, pid);

    	  
    	  String memstring;
    	  if (member) {
    		  memstring = "Yes";
    		  ps.setString(1, memstring);	  
    	  } else {
    		  memstring = "No";
    		  ps.setString(1, memstring);	
    	  }
    	  System.out.printf("\nMember: %s", memstring);
    	  
    	  System.out.printf("\nPoints: %d", points);
    	  ps.setInt(2, points);
    	  
    	  System.out.printf("\nCCNUM: %s", ccnum);
    	  ps.setString(3, ccnum);
    	  
    	  System.out.printf("\nCCEXPIRYDATE: %s\n\n", exp);
    	  ps.setString(4, exp);

    	  int rowCount = ps.executeUpdate();
    	  if (rowCount == 0)
    	  {
    	      System.out.println("\nCustomer " + pid + " does not exist!");
    	      System.out.println("Update failed!");
    	  }

    	  con.commit();

    	  ps.close();
    	}
    	catch (SQLException ex)
    	{
    		System.out.println("Update failed!");
    	    System.out.println("Message: " + ex.getMessage());
    	    
    	    try 
    	    {
    		con.rollback();	
    	    }
    	    catch (SQLException ex2)
    	    {
    		System.out.println("Message: " + ex2.getMessage());
    		System.exit(-1);
    	    }
    	}	
    }
    
    //update AirportPersonnel given specified pid
    public void updateAirportPersonnel(Integer pid, Integer salary, String job) {
       	PreparedStatement  ps;
  	  
    	try
    	{
    	  System.out.print("Updating Personnel...");
    	  ps = con.prepareStatement("UPDATE airportpersonnel SET salary = ?, job = ? WHERE PID = ?");
    	
    	  System.out.printf("\nPID: %d", pid);
    	  ps.setInt(3, pid);

    	  System.out.printf("\nSalary: %d", salary);
    	  ps.setInt(1, salary);
    	  
    	  System.out.printf("\nJob: %s\n\n", job);
    	  ps.setString(2, job);

    	  int rowCount = ps.executeUpdate();
    	  if (rowCount == 0)
    	  {
    		  System.out.println("Update Failed!");
    	      System.out.println("\nPersonnel " + pid + " does not exist!");
    	  }

    	  con.commit();

    	  ps.close();
    	}
    	catch (SQLException ex)
    	{
    		System.out.println("Update Failed!");
    	    System.out.println("Message: " + ex.getMessage());
    	    
    	    try 
    	    {
    		con.rollback();	
    	    }
    	    catch (SQLException ex2)
    	    {
    		System.out.println("Message: " + ex2.getMessage());
    		System.exit(-1);
    	    }
    	}	
    }
    
    
    
    
    
    //delete Person from people given specified pid (works)
    public void deletePerson(Integer pid) {
    	PreparedStatement  ps;
  	  
    	try
    	{

    	  ps = con.prepareStatement("DELETE FROM People WHERE PID = ?");
    	
    	  System.out.printf("Deleting Person PID: %d", pid);
    	  ps.setInt(1, pid);

    	  int rowCount = ps.executeUpdate();

    	  if (rowCount == 0)
    	  {
    	      System.out.println("\nPerson " + pid + " does not exist!");
    	      System.out.println("Deletion failed!");
    	  }

    	  con.commit();
    	  
    	  ps.close();
    	  System.out.println();
    	}
    	catch (SQLException ex)
    	{
    		System.out.println("Deletion failed!");
    	    System.out.println("Message: " + ex.getMessage());

                try 
    	    {
    		con.rollback();	
    	    }
    	    catch (SQLException ex2)
    	    {
    		System.out.println("Message: " + ex2.getMessage());
    		System.exit(-1);
    	    }
    	}
    }
   
    
    // ones below this need testing/checking
    
    
    
    //returns list of strings for information regarding boarding (for employee view) based on specified airplane id
    public ArrayList<String> getBoardingInfo(Integer apid) {
    	String     pid; // person id matching ticket
    	String     airplaneid;  //airplane id matching ticket apid
    	String     name; // name of person boarding
    	String     Seatnum; //Seatnum of person boarding
    	String     Class; // class of seating of person boarding
    	PreparedStatement  ps;
    	ResultSet  rs;
    	ArrayList<String> los = new ArrayList<String>(); // the list of information for boarding as a list of strings
    	   
    	try
    	{
          ps = con.prepareStatement("SELECT * FROM people, ticket WHERE ticket.PID = people.PID AND APID = ?");
          
          ps.setInt(1, apid); 

    	  rs = ps.executeQuery(); 

    	  // get info on ResultSet
    	  ResultSetMetaData rsmd = rs.getMetaData();

    	  // get number of columns
    	  int numCols = rsmd.getColumnCount();

    	  System.out.println(" ");
    	  

    	  while(rs.next())
    	  {
    	      // for display purposes get everything from Oracle 
    	      // as a string

    	      // simplified output formatting; truncation may occur
    		  
    		  pid = Integer.toString(rs.getInt("PID"));
    		  
    		  airplaneid = Integer.toString(rs.getInt("APID"));
    		  
    		  name = rs.getString("name");
    		  
    		  Seatnum = Integer.toString(rs.getInt("SeatNum"));
    		  
    		  Class = rs.getString("SeatClass");
    		  
    		  los.add(pid+' '+airplaneid+' '+name+' '+Seatnum+' '+Class);  

    	     /* bid = rs.getString("branch_id");
    	      System.out.printf("%-10.10s", bid);             // old code from branch to base off of

    	      bname = rs.getString("branch_name");
    	      System.out.printf("%-20.20s", bname);

    	      baddr = rs.getString("branch_addr");
    	      if (rs.wasNull())
    	      {
    	    	  System.out.printf("%-20.20s", " ");
                  }
    	      else
    	      {
    	    	  System.out.printf("%-20.20s", baddr);
    	      }

    	      bcity = rs.getString("branch_city");
    	      System.out.printf("%-15.15s", bcity);

    	      bphone = rs.getString("branch_phone");
    	      if (rs.wasNull())
    	      {
    	    	  System.out.printf("%-15.15s\n", " ");
                  }
    	      else
    	      {
    	    	  System.out.printf("%-15.15s\n", bphone);
    	      }   */   
    	  }
     
    	  // close the statement; 
    	  // the ResultSet will also be closed
    	  ps.close();
    	}
    	catch (SQLException ex)
    	{
    	    System.out.println("Message: " + ex.getMessage());
    	}
    	return los;
    }

    
    
    
    //query for displaying most popular destination (involves group by count etc) 
    public ArrayList<ArrayList<String>> mostPopularDestination() {
      	Statement  stmt;
      	ResultSet rs;
      	ArrayList<ArrayList<String>> los = new ArrayList<ArrayList<String>>();
      	
			try
			{
			  stmt = con.createStatement();

			  rs = stmt.executeQuery("SELECT city, COUNT(*) AS dest FROM ticket, airplane, airport WHERE ticket.APID = airplane.APID AND airplane.PlaneTo = airport.AirID GROUP BY airport.city ORDER BY dest DESC");

			 

			  while(rs.next())
			  {
				  ArrayList<String> destination = new ArrayList<String>();
			      destination.add(rs.getString("city"));
			      destination.add(rs.getString("dest"));
			      
			      los.add(destination);
			     }
		 
			  // close the statement; 
			  // the ResultSet will also be closed
			  stmt.close();
			}
			catch (SQLException ex)
			{
			    System.out.println("Message: " + ex.getMessage());
			}
		return los;
	}
      	


    
    //prints all tuples of customers 
    public void showCustomers() {
    	   {
    			String     pid;
    			String 	   mem;
    			int 	   fee;
    			String     points;
    			String	   ccnum;
    			Date   	   ccexp;
    			String     name;
    			String     age;
    			String     addr;
    			String     phone;
    			String     email;
    			
    			Statement  stmt;
    			ResultSet  rs;
    			   
    			try
    			{
    			  stmt = con.createStatement();

    			  rs = stmt.executeQuery("SELECT * FROM customer, people WHERE customer.PID = people.PID");

    			  // get info on ResultSet
    			  ResultSetMetaData rsmd = rs.getMetaData();

    			  // get number of columns
    			  int numCols = rsmd.getColumnCount();

    			  System.out.println(" ");
    			  
    			  // display column names
    			  // some hard coding involved
    			  for (int i = 0; i < numCols; i++)
    			  {
    			      // get column name and print it
    				  if (i+1 < 4) {
    					  System.out.printf("%-10s", rsmd.getColumnName(i+1)); 
    				  } else if (i+1 < 9){
    					  System.out.printf("%-15s", rsmd.getColumnName(i+1)); 
    				  } 
    				  else if (i+1 < 10){
    					  System.out.printf("%-10s", rsmd.getColumnName(i+1)); 
    				  } else {
    					  System.out.printf("%-"+rsmd.getColumnDisplaySize(i+1)+"s", rsmd.getColumnName(i+1)); 
    				  }
    			  }

    			  System.out.println(" ");

    			  while(rs.next())
    			  {
    			      // for display purposes get everything from Oracle 
    			      // as a string

    			      // simplified output formatting; truncation may occur

    			      pid = rs.getString("PID");
    			      System.out.printf("%-10.10s", pid);
    			      
    			      mem = rs.getString("Member");
    			      System.out.printf("%-10.10s", mem);
    			      
    			      fee = rs.getInt("Fee");
    			      System.out.printf("%-10.10s", fee);
    			      
    			      points = rs.getString("Points");
    			      if (rs.wasNull()) System.out.printf("%-15.15s", " ");
    			      else System.out.printf("%-15.15s", points);
    			      
    			      ccnum = rs.getString("CCNUM");
    			      if (rs.wasNull()) System.out.printf("%-15.15s", " ");
    			      else  System.out.printf("%-15.15s", ccnum);
    			      
    			      ccexp = rs.getDate("CCEXPIRYDATE");
    			      if (rs.wasNull())  System.out.printf("%-15.15s", " ");
    			      else System.out.printf("%-15.15s", ccexp.toString());

    			      System.out.printf("%-15.15s", pid);

    			      name = rs.getString("Name");
    			      System.out.printf("%-15.15s", name);
    			      
    			      age = rs.getString("Age");
    			      System.out.printf("%-10.10s", age);

    			      addr = rs.getString("Address");
    			      if (rs.wasNull()) System.out.printf("%-50.50s", " ");
    			      else System.out.printf("%-50.50s", addr);

    			      phone = rs.getString("Phone");
    			      System.out.printf("%-20.20s", phone);

    			      email = rs.getString("Email");
    			      if (rs.wasNull()) System.out.printf("%-50.50s", " ");
    			      else System.out.printf("%-50.50s", email); 
    			      System.out.printf("\n");
    			  }
    		 
    			  // close the statement; 
    			  // the ResultSet will also be closed
    			  stmt.close();
    			}
    			catch (SQLException ex)
    			{
    			    System.out.println("Message: " + ex.getMessage());
    			}	
    	}
    }
    
  //prints all tuples of personnel 
    public void showPersonnel() {
    	   {
    		   	String	   airID;
    			String     pid;
    			String 	   salary;
    			String	   job;
    			String     name;
    			String     age;
    			String     addr;
    			String     phone;
    			String     email;
    			
    			Statement  stmt;
    			ResultSet  rs;
    			   
    			try
    			{
    			  stmt = con.createStatement();

    			  rs = stmt.executeQuery("SELECT * FROM AirportPersonnel, people WHERE AirportPersonnel.PID = people.PID");

    			  // get info on ResultSet
    			  ResultSetMetaData rsmd = rs.getMetaData();

    			  // get number of columns
    			  int numCols = rsmd.getColumnCount();

    			  System.out.println(" ");
    			  
    			  // display column names
    			  // some hard coding involved
    			  for (int i = 0; i < numCols; i++)
    			  {
    			      // get column name and print it, some hardcoding
    				  if (i+1 < 4) {
    					  System.out.printf("%-10s", rsmd.getColumnName(i+1)); 
    				  } else if (i+1 < 5){
    					  System.out.printf("%-30s", rsmd.getColumnName(i+1)); 
    				  }  else if (i+1 < 6){
    					  System.out.printf("%-10s", rsmd.getColumnName(i+1)); 
    				  } else if (i+1 < 7){
    					  System.out.printf("%-30s", rsmd.getColumnName(i+1)); 
    				  } else if (i+1 < 8){
    					  System.out.printf("%-10s", rsmd.getColumnName(i+1)); 
    				  } else if (i+1 < 9){
    					  System.out.printf("%-50s", rsmd.getColumnName(i+1)); 
    				  } else {
    					  System.out.printf("%-"+rsmd.getColumnDisplaySize(i+1)+"s", rsmd.getColumnName(i+1)); 
    				  }
    			  }

    			  System.out.println(" ");

    			  while(rs.next())
    			  {
    			      // for display purposes get everything from Oracle 
    			      // as a string

    			      // simplified output formatting; truncation may occur
    				  
    				  airID = rs.getString("AirID");
    			      System.out.printf("%-10.10s", airID);		
    			      
    			      pid = rs.getString("PID");
    			      System.out.printf("%-10.10s", pid);		     	   

    			      salary = Integer.toString(rs.getInt("Salary"));
    			      if (rs.wasNull()) System.out.printf("%-10.10s", " ");
    			      else System.out.printf("%-10.10s", salary);
    			      
    			      job = rs.getString("Job");
    			      if (rs.wasNull()) System.out.printf("%-30.30s", " ");
    			      else System.out.printf("%-30.30s", job);
    			      
    			      pid = rs.getString("PID");
    			      System.out.printf("%-10.10s", pid);	
    			      
    			      name = rs.getString("Name");
    			      System.out.printf("%-30.30s", name);
    			      
    			      age = rs.getString("Age");
    			      System.out.printf("%-10.10s", age);

    			      addr = rs.getString("Address");
    			      if (rs.wasNull()) System.out.printf("%-50.50s", " ");
    			      else System.out.printf("%-50.50s", addr);

    			      phone = rs.getString("Phone");
    			      System.out.printf("%-20.20s", phone);

    			      email = rs.getString("Email");
    			      if (rs.wasNull()) System.out.printf("%-50.50s", " ");
    			      else System.out.printf("%-50.50s", email); 
    			      System.out.printf("\n");
    			  }
    		 
    			  // close the statement; 
    			  // the ResultSet will also be closed
    			  stmt.close();
    			}
    			catch (SQLException ex)
    			{
    			    System.out.println("Message: " + ex.getMessage());
    			}	
    	}
    }
    
    public boolean checkPeople(int pid) {	
    		boolean result = false;
    		PreparedStatement  ps;
			ResultSet  rs;
			   
			try
			{
			  ps = con.prepareStatement("SELECT * FROM people WHERE people.PID = ?");
			  ps.setInt(1, pid);

			  rs = ps.executeQuery();
			  // get info on ResultSet
			  ResultSetMetaData rsmd = rs.getMetaData();

			  if (rs.next()) {
				  result = true;
			  } 
			  // close the statement; 
			  // the ResultSet will also be closed
			  ps.close();
			}
			catch (SQLException ex)
			{
				System.out.println("Check failed!");
			    System.out.println("Message: " + ex.getMessage());
			}	
			return result;
    }
    
    public boolean checkPersonnel(int pid, int airid) {	
		boolean result = false;
		PreparedStatement  ps;
		ResultSet  rs;
		   
		try
		{
		  ps = con.prepareStatement("SELECT * FROM AirportPersonnel WHERE AirportPersonnel.PID = ? AND AirportPersonnel.AirID = ?");
		  ps.setInt(1, pid);
		  ps.setInt(2, airid);

		  rs = ps.executeQuery();
		  // get info on ResultSet
		  ResultSetMetaData rsmd = rs.getMetaData();

		  if (rs.next()) {
			  result = true;
		  } 
		  // close the statement; 
		  // the ResultSet will also be closed
		  ps.close();
		}
		catch (SQLException ex)
		{
			System.out.println("Check failed!");
		    System.out.println("Message: " + ex.getMessage());
		}	
		return result;
    }
    
    public boolean checkCustomer(int pid) {	
		boolean result = false;
		PreparedStatement  ps;
		ResultSet  rs;
		   
		try
		{
		  ps = con.prepareStatement("SELECT * FROM customer WHERE customer.PID = ?");
		  ps.setInt(1, pid);

		  rs = ps.executeQuery();
		  // get info on ResultSet
		  ResultSetMetaData rsmd = rs.getMetaData();

		  if (rs.next()) {
			  result = true;
		  } 
		  // close the statement; 
		  // the ResultSet will also be closed
		  ps.close();
		}
		catch (SQLException ex)
		{
			System.out.println("Check failed!");
		    System.out.println("Message: " + ex.getMessage());
		}	
		return result;
    }
    
    public boolean validateTicket(int pid, int apid, int alid) {	
		boolean result = false;
		PreparedStatement  ps;
		ResultSet  rs;
		   
		try
		{
		  ps = con.prepareStatement("SELECT * FROM Ticket WHERE Ticket.PID = ? AND  Ticket.APID = ? AND Ticket.ALID = ?");
		  ps.setInt(1, pid);
		  ps.setInt(2, apid);
		  ps.setInt(3, alid);

		  rs = ps.executeQuery();
		  // get info on ResultSet
		  ResultSetMetaData rsmd = rs.getMetaData();

		  if (rs.next()) {
			  result = true;
		  } 
		  // close the statement; 
		  // the ResultSet will also be closed
		  ps.close();
		}
		catch (SQLException ex)
		{
			System.out.println("ERROR");
		    System.out.println("Message: " + ex.getMessage());
		}	
		return result;
}
    
    
    //query highest average paying job
    public String jobHighestSalary() {
      	Statement  stmt;
      	String job; //job title with highest average salary
      	String salary; //highest average salary
      	ResultSet rs;
      	String res = " ";
      	
			try
			{
			  stmt = con.createStatement();

			  rs = stmt.executeQuery("SELECT Job, avg(Salary) FROM AirportPersonnel ap GROUP BY Job HAVING avg(Salary) >= all(SELECT avg(ap.Salary) FROM AirportPersonnel ap GROUP BY ap.Job)");
			  
			  rs.next();


			      job = rs.getString("job");
			      
			      salary = rs.getString("avg(Salary)");
			      
			      res = job + " $" + salary;
			     
		 
			  // close the statement; 
			  // the ResultSet will also be closed
			  stmt.close();
			}
			catch (SQLException ex)
			{
			    System.out.println("Message: " + ex.getMessage());
			}
		return res;
	}
    
    //query lowest average paying job
    public String jobLowestSalary() {
      	Statement  stmt;
      	String job; //job title with lowest average salary
      	String salary; //lowest average salary
      	ResultSet rs;
      	String res = " ";
      	
			try
			{
			  stmt = con.createStatement();

			  rs = stmt.executeQuery("SELECT Job, avg(Salary) FROM AirportPersonnel ap GROUP BY Job HAVING avg(Salary) <= all(SELECT avg(ap.Salary) FROM AirportPersonnel ap GROUP BY ap.Job)");
			  
			  rs.next();


			      job = rs.getString("job");
			      
			      salary = rs.getString("avg(Salary)");
			      
			      res = job + " $" + salary;
			     
		 
			  // close the statement; 
			  // the ResultSet will also be closed
			  stmt.close();
			}
			catch (SQLException ex)
			{
			    System.out.println("Message: " + ex.getMessage());
			}
		return res;
	}
    
    //query highest average paying job
    public String jobSHighestSalary() {
      	Statement  stmt;
      	String job; //job title with highest average salary
      	String salary; //highest average salary
      	ResultSet rs;
      	String res = " ";
      	
			try
			{
			  stmt = con.createStatement();

			  rs = stmt.executeQuery("SELECT max(Salary) FROM AirportPersonnel");
			  
			  rs.next();
			      
			      salary = rs.getString("max(Salary)");
			      
			      res = "$" + salary;
			     
		 
			  // close the statement; 
			  // the ResultSet will also be closed
			  stmt.close();
			}
			catch (SQLException ex)
			{
			    System.out.println("Message: " + ex.getMessage());
			}
		return res;
	}
    
    //query lowest average paying job
    public String jobSLowestSalary() {
      	Statement  stmt;
      	String job; //job title with lowest average salary
      	String salary; //lowest average salary
      	ResultSet rs;
      	String res = " ";
      	
			try
			{
			  stmt = con.createStatement();

			  rs = stmt.executeQuery("SELECT min(Salary) FROM AirportPersonnel");
			  
			  rs.next();
			      
			      salary = rs.getString("min(Salary)");
			      
			      res = "$" + salary;
			     
		 
			  // close the statement; 
			  // the ResultSet will also be closed
			  stmt.close();
			}
			catch (SQLException ex)
			{
			    System.out.println("Message: " + ex.getMessage());
			}
		return res;
	}
    
    //returns list of strings of all available destinations
    public ArrayList<String> getAllCountry() {
    	String     country; 
    	Statement  stmt;
    	ResultSet  rs;
    	ArrayList<String> los = new ArrayList<String>(); // the list of information for boarding as a list of strings
    	   
    	try
    	{
    	  stmt = con.createStatement();
    	  rs = stmt.executeQuery("SELECT country FROM airport GROUP BY country"); 

    	  while(rs.next())
    	  {		  
    		  country = rs.getString("Country"); 
    		  los.add(country);  
    	  }
     
    	  // close the statement; 
    	  // the ResultSet will also be closed
    	  stmt.close();
    	}
    	catch (SQLException ex)
    	{
    	    System.out.println("Message: " + ex.getMessage());
    	}
    	return los;
    }
    
    //returns list of strings of all available airlines
    public ArrayList<String[]> getAllAirline() {

    	Statement  stmt;
    	ResultSet  rs;
    	ArrayList<String[]> los = new ArrayList<String[]>(); 
    	   
    	try
    	{
    	  stmt = con.createStatement();
    	  rs = stmt.executeQuery("SELECT alid, name FROM airline"); 

    	  while(rs.next())
    	  {		
    		  String[] arr = new String[2];
    		  arr[0] = rs.getString("ALID"); 
    		  arr[1] = rs.getString("Name"); 
    		  los.add(arr);
    	  }
     
    	  // close the statement; 
    	  // the ResultSet will also be closed
    	  stmt.close();
    	}
    	catch (SQLException ex)
    	{
    	    System.out.println("Message: " + ex.getMessage());
    	}
    	return los;
    }
    
    //returns list of strings of all tickets
    public ArrayList<String[]> getTickets() {

    	Statement  stmt;
    	ResultSet  rs;
    	ArrayList<String[]> los = new ArrayList<String[]>(); 
    	   
    	try
    	{
    	  stmt = con.createStatement();
    	  rs = stmt.executeQuery("SELECT * FROM ticket"); 

    	  while(rs.next())
    	  {		
    		  String[] arr = new String[6];
    		  arr[0] = rs.getString("pid"); 
    		  arr[1] = rs.getString("apid"); 
    		  arr[2] = rs.getString("alid"); 
    		  arr[3] = rs.getString("price"); 
    		  arr[4] = rs.getString("seatclass"); 
    		  arr[5] = rs.getString("seatnum"); 
    		  los.add(arr);
    	  }
     
    	  // close the statement; 
    	  // the ResultSet will also be closed
    	  stmt.close();
    	}
    	catch (SQLException ex)
    	{
    	    System.out.println("Message: " + ex.getMessage());
    	}
    	return los;
    }
    
    
    //returns list of strings of all available airlines
    public ArrayList<String[]> getAllAirport() {

    	Statement  stmt;
    	ResultSet  rs;
    	ArrayList<String[]> los = new ArrayList<String[]>(); 
    	   
    	try
    	{
    	  stmt = con.createStatement();
    	  rs = stmt.executeQuery("SELECT airid, name FROM airport"); 

    	  while(rs.next())
    	  {		
    		  String[] arr = new String[2];
    		  arr[0] = rs.getString("airid"); 
    		  arr[1] = rs.getString("name"); 
    		  los.add(arr);
    	  }
     
    	  // close the statement; 
    	  // the ResultSet will also be closed
    	  stmt.close();
    	}
    	catch (SQLException ex)
    	{
    	    System.out.println("Message: " + ex.getMessage());
    	}
    	return los;
    }
    
    //queries airplanes for the given data. Returns {APID, ALID, planeFrom, planeTo, airline.Name, planeFrom Aiport.Name, planeTo Airport.Name, departureTime, arrivalTime, numOpenSeats}
    public ArrayList<ArrayList<String>> getFlightData(String alid, String from, String dest, String date) {
    	Statement  stmt;
    	ResultSet  rs;
    	ArrayList<String[]> airlines = getAllAirline();
    	ArrayList<String[]> airports = getAllAirport();
    	
    	String alidQuery = "";
    	String fromQuery = "";
    	String destQuery = "";
    	String dateQuery = "";
    	ArrayList<ArrayList<String>> fdata = new ArrayList<ArrayList<String>>(); 
    	   
    	try
    	{
    	  stmt = con.createStatement();
    	  
    	  if (alid != "Any") {
    		  alidQuery = " AND alid = "+alid;
    	  }
    	  if (from != "Any") {
    		  fromQuery = " AND status = "+from;
    	  }
    	  if (dest != "Any") {
    		  destQuery = " AND planeto = "+dest;
    	  }
    	  if (date != "Any") {
    		  dateQuery = " AND to_date(departuretime, 'YY-MM-DD') = '"+date+"'";
    	  }
    	  System.out.println("SELECT * FROM airplane WHERE numopenseats > 0"+alidQuery+fromQuery+destQuery+dateQuery);

    	  rs = stmt.executeQuery("SELECT * FROM airplane WHERE numopenseats > 0"+alidQuery+fromQuery+destQuery+dateQuery); 

    	  while(rs.next())
    	  {		   
    		  ArrayList<String> flight = new ArrayList<String>();
    		  flight.add(rs.getString("apid")); 
    		  String temp = rs.getString("alid");
    		  flight.add(temp); 
    		  flight.add(rs.getString("planefrom")); 
    		  flight.add(rs.getString("planeto")); 
       		  for (int i = 0; i < airlines.size(); i++) {
    			  if (airlines.get(i)[0].equals(temp)) {
    				  flight.add(airlines.get(i)[1]);
    				  break;
    			  }
    		  }
       		  temp = rs.getString("planefrom");
       		  for (int i = 0; i < airports.size(); i++) {
	  			  if (airports.get(i)[0].equals(temp)) {
	  				  flight.add(airports.get(i)[1]);
	  				  break;
	  			  }
	  		  }
       		  temp = rs.getString("planeto");
     		  for (int i = 0; i < airports.size(); i++) {
	  			  if (airports.get(i)[0].equals(temp)) {
	  				  flight.add(airports.get(i)[1]);
	  				  break;
	  			  }
	  		  }
    		  flight.add(rs.getString("departuretime")); 
    		  flight.add(rs.getString("arrivaltime")); 
    		  flight.add(rs.getString("numopenseats")); 
    		  fdata.add(flight);
    	  }
     
    	  // close the statement; 
    	  // the ResultSet will also be closed
    	  stmt.close();
    	}
    	catch (SQLException ex)
    	{
    	    System.out.println("Message: " + ex.getMessage());
    	}
    	return fdata;
    }
    
    // if the given information is valid, returns the customer's details
    public ArrayList<String> checkBillingInfo(int pid, String ccnum, String expdate) {	
    	ArrayList<String> result = new ArrayList<String>();
		PreparedStatement  ps;
		ResultSet  rs;

		try
		{
		  ps = con.prepareStatement("SELECT * FROM customer WHERE pid = ? AND ccnum = ? AND ccexpirydate = TO_DATE(?, 'YYYY-MM-DD')");
		  ps.setInt(1, pid);
		  ps.setString(2, ccnum);
		  ps.setString(3, expdate);

		  rs = ps.executeQuery();
		  // get info on ResultSet
		  ResultSetMetaData rsmd = rs.getMetaData();
		  int col = rsmd.getColumnCount();

		  if (rs.next()) {
			  for (int i = 1; i <= col; i++) {
				  result.add(rs.getString(i));
			  }
		  } 
		  // close the statement; 
		  // the ResultSet will also be closed
		  ps.close();
		}
		catch (SQLException ex)
		{
			System.out.println("Check failed!");
		    System.out.println("Message: " + ex.getMessage());
		}	
		return result;
    }
    
    // finds the largest seat number on a flight and returns it +1, or returns 1
    public int getSeatNum(int apid, int alid) {	
    	int result = 1;
		PreparedStatement  ps;
		ResultSet  rs;
		   
		try
		{
		  ps = con.prepareStatement("SELECT MAX(seatnum) FROM ticket WHERE apid = ? AND alid = ?");
		  ps.setInt(1, apid);
		  ps.setInt(2, alid);

		  rs = ps.executeQuery();
		  // get info on ResultSet

		  if (rs.next()) {
				  result = rs.getInt(1) + 1;
		  } 
		  // close the statement; 
		  // the ResultSet will also be closed
		  ps.close();
		}
		catch (SQLException ex)
		{
			System.out.println("Check failed!");
		    System.out.println("Message: " + ex.getMessage());
		}	
		return result;
    }
    
    //adds given points to the customer 
    public void addPoints(Integer pid, Integer points) {
       	PreparedStatement  ps;
    	  
    	try
    	{
    	  ps = con.prepareStatement("UPDATE customer SET points = points + ? WHERE pid = ?");
    	  ps.setInt(1, points);
    	  ps.setInt(2, pid);
    	  

    	  int rowCount = ps.executeUpdate();
    	  if (rowCount == 0)
    	  {
    	      System.out.println("\nCustomer " + pid + " does not exist!");
    	      System.out.println("Update failed!");
    	  }

    	  con.commit();

    	  ps.close();
    	}
    	catch (SQLException ex)
    	{
    		System.out.println("Update failed!");
    	    System.out.println("Message: " + ex.getMessage());
    	    
    	    try 
    	    {
    		con.rollback();	
    	    }
    	    catch (SQLException ex2)
    	    {
    		System.out.println("Message: " + ex2.getMessage());
    		System.exit(-1);
    	    }
    	}	
    }
    
    //decrements numOpenSeats by the given number
    public void claimSeats(int apid, int alid, int seats) {
       	PreparedStatement  ps;
    	  
    	try
    	{
    	  ps = con.prepareStatement("UPDATE airplane SET numopenseats = numopenseats - ? WHERE apid = ? AND alid = ?");
    	  ps.setInt(1, seats);
    	  ps.setInt(2, apid);
    	  ps.setInt(3, alid);
    	  

    	  int rowCount = ps.executeUpdate();
    	  if (rowCount == 0)
    	  {
    	      System.out.println("\nAirplane does not exist!");
    	      System.out.println("Update failed!");
    	  }

    	  con.commit();

    	  ps.close();
    	}
    	catch (SQLException ex)
    	{
    		System.out.println("Update failed!");
    	    System.out.println("Message: " + ex.getMessage());
    	    
    	    try 
    	    {
    		con.rollback();	
    	    }
    	    catch (SQLException ex2)
    	    {
    		System.out.println("Message: " + ex2.getMessage());
    		System.exit(-1);
    	    }
    	}	
    }
    
    public boolean validDate(String year, String month, String day) {
    	boolean result = true;
    	
    	if (year.length()  != 2 || month.length() != 2 || day.length() != 2) {
    		return false;
    	}
    	if (!(year.matches("-?\\d+(\\.\\d+)?") && month.matches("-?\\d+(\\.\\d+)?") && day.matches("-?\\d+(\\.\\d+)?"))) {
    		return false;
    	}
    	int num_month = Integer.parseInt(month);
    	int num_day = Integer.parseInt(day);
    	switch (num_month) {
    		case 1:
    		case 3:
    		case 5:
    		case 7:
    		case 8:
    		case 10:
    		case 12:
    			if (!(num_day > 0 && num_day <= 31))
    				result = false;
    			break;
    		case 4:
    		case 6:
    		case 9:
    		case 11:
    			if (!(num_day > 0 && num_day <= 30))
    				result = false;
    			break;
    		case 2:
    			if (!(num_day > 0 && num_day <= 28))
    				result = false;
    			break;
    		default:
    			result = false;
    			break;
    	}
    	
    	return result;
    }
    
    //division query for personnel based on input (works) 
    public ArrayList<String[]> queryPersonnelAge(Integer min, Integer max) {
    	PreparedStatement  ps;
      	ResultSet rs;
      	ArrayList<String[]> los = new ArrayList<String[]>();
      	
			try
			{
			  ps = con.prepareStatement("SELECT salary, job FROM airportpersonnel WHERE PID IN (SELECT PID FROM people WHERE age >= ? AND age <= ?)");
			  
			  ps.setInt(1,min);
			  ps.setInt(2, max);

			  rs = ps.executeQuery();

			  while(rs.next())
			  {
				  String[] person = new String[2];
				  person[0] = rs.getString("job");
			      person[1] = rs.getString("salary");
			      
			      
			      los.add(person);
			     }
		 
			  // close the statement; 
			  // the ResultSet will also be closed
			  ps.close();
			}
			catch (SQLException ex)
			{
			    System.out.println("Message: " + ex.getMessage());
			}
		return los;
    }
    
    //returns all airports connecting to YVR 
    public ArrayList<String> allYVR() {
    	Statement  stmt;
      	String airport; //name of airport that connects to YVR
      	ResultSet rs;
      	ArrayList<String> los = new ArrayList<String>();
      	
			try
			{
			  stmt = con.createStatement();

			  rs = stmt.executeQuery("select name from airport a where not exists ((select toairid from connections c where toairid = 210) minus (select toairid from connections c where c.fromairid = a.airid))");

			  while(rs.next())
			  {
			      // for display purposes get everything from Oracle 
			      // as a string

			      // simplified output formatting; truncation may occur

			      airport = rs.getString("name");
			      
			      los.add(airport);
			     }
		 
			  // close the statement; 
			  // the ResultSet will also be closed
			  stmt.close();
			}
			catch (SQLException ex)
			{
			    System.out.println("Message: " + ex.getMessage());
			}
		return los;
    }
    
    //real division query returns names of all airports that are connected to all airports
    public ArrayList<String[]> connectedToAll() {
     	Statement  stmt;
      	ResultSet rs;
      	ArrayList<String[]> los = new ArrayList<String[]>();
      	
			try
			{
			  stmt = con.createStatement();

			  rs = stmt.executeQuery("select name, city, country from airport a where not exists ((select airid from airport) minus (select toairid from connections c where c.fromairid = a.airid))");

			  while(rs.next())
			  {
				  String[] airport = new String[3];
			      airport[0] = rs.getString("name");
			      airport[1] = rs.getString("city");
			      airport[2] = rs.getString("country");
			      los.add(airport);
			     }
		 
			  // close the statement; 
			  // the ResultSet will also be closed
			  stmt.close();
			}
			catch (SQLException ex)
			{
			    System.out.println("Message: " + ex.getMessage());
			}
		return los;
    }
}
