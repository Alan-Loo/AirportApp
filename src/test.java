import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

public class test {
	
	public test() {
		queryConnect q = queryConnect.getInstance();
		
		/*
		ArrayList<ArrayList<String>> flights = q.getFlightData("Any", "Any", "Any", "Any");
		for(int i = 0; i < flights.size(); i++) {
			for (int j = 0; j < flights.get(0).size(); j++) {
				System.out.print(flights.get(i).get(j) + " ");
			}	
			System.out.println();
		}
		
		ArrayList<String[]> airlines = q.getAllAirline();
		for(int i = 0; i < airlines.size(); i++) {
			System.out.println(airlines.get(i));
		}
		
		
		ArrayList<String> loc = q.getAllCountry();
		Collections.sort(loc);
		for(int i = 0; i < loc.size(); i++) {
			System.out.println(loc.get(i));
		}
		
		ArrayList<String> los = q.mostPopularDestination();
		for(int i = 0; i < los.size(); i++) {
			System.out.println(los.get(i));
		}
		
		System.out.println(q.jobHighestSalary());
		
		
		// should fail
		q.deletePerson(123457);
		q.deletePerson(123458);
		
		//test insert
		// person shouldn't be anywhere
		assert q.checkPeople(123457) == false;
		assert q.checkPersonnel(123457, 123) == false;
		assert q.checkCustomer(123457) == false;
		q.insertPerson("John Doe", 20, "address", "778 321 9898", "JohnDoe@gmail.com"); //123457
		// person should only be in People
		assert q.checkPeople(123457) == true;
		assert q.checkPersonnel(123457, 123) == false;
		assert q.checkCustomer(123457) == false;
		
		q.insertPersonnel(123, 123457, 1000000, "pilot");
		//now person should be in AirportPersonnel too
		assert q.checkPeople(123457) == true;
		assert q.checkPersonnel(123457, 123) == true;
		assert q.checkCustomer(123457) == false;;
		
		q.updatePerson(123457, "Doe John", 1, "address changed", "778 111 2222", "JohnDoe@blah.com");
		//q.showPersonnel(); //uncomment to manually check details were updated 
		
		// person shouldn't be anywhere
		assert q.checkPeople(123458) == false;
		assert q.checkPersonnel(123458, 123) == false;
		assert q.checkCustomer(123458) == false;
		q.insertPerson("John Doe", 30, "address", "778 123 8989", "JohnDoe@outlook.com"); //123458
		//should only be in People
		assert q.checkPeople(123458) == true;
		assert q.checkPersonnel(123458, 123) == false;
		assert q.checkCustomer(123458) == false;
		q.insertCustomer(123458, "no", "ccnuminsertthere", "2018-11-19");
		//should also be in Customers
		assert q.checkPeople(123458) == true;
		assert q.checkPersonnel(123458, 123) == false;
		assert q.checkCustomer(123458) == true;
		q.registerForTicket(123458, 999, 00, 1000, "First", 10);
		assert q.validateTicket(123458, 999, 00);
		
		
		//test getBoardingInfo()
		assert q.getBoardingInfo(999).size() == 2;
		for(int i = 0; i < 2; i++) {
			System.out.println(q.getBoardingInfo(999).get(i));
		}
	
		q.deletePerson(123457);
		// deleted person shouldn't be anywhere
		assert q.checkPeople(123457) == false;
		assert q.checkPersonnel(123457, 123) == false;
		assert q.checkCustomer(123457) == false;
		q.deletePerson(123458);
		// deleted person shouldn't be anywhere
		assert q.checkPeople(123458) == false;
		assert q.checkPersonnel(123458, 123) == false;
		assert q.checkCustomer(123458) == false;
		// deleted person's ticket should be gone
		assert q.getBoardingInfo(999).size() == 1;

		
		System.out.println("All tests passed!");
		*/
	} 
	
	public static void main(String[] args) {
		
		test t = new test();
		
	}
	
}
