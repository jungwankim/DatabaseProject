import java.util.Scanner;
import java.sql.*;

public class Interface {

	public static void main(String[] args) throws SQLException {
		// load DB2 JDBC driver
		try {
			DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());
		} catch (Exception cnfe) {
			System.out.println("Cannot find class!!!");
		}
		
		
		// connect to database
		
		Connection conn = DriverManager.getConnection("jdbc:db2://db2:50000/cs421", "dwu18", "");
		Statement statement = conn.createStatement ();

		try {
			Runtime rt = Runtime.getRuntime();
			Process pr = rt.exec("db2 -f project3C.clp");
		} catch (Exception e) {
		}

		
		int sqlCode=0;      // Variable to hold SQLCODE
     		String sqlState="00000";  // Variable to hold SQLSTATE
		boolean loop = true;
		Scanner input = new Scanner(System.in);
		input.useDelimiter("\n");
		while (loop) {
			System.out.println("1 = insert, 2 = update, 3 = delete, 4 = query, 5 = quit");
			
			int choice = input.nextInt();
			String tablename, attributes, values, attribute, newvalue, constraint;
			switch(choice) {
				case 1: //sql
					try {
					System.out.println("Which table would you like to insert data into?"); 
					tablename = input.next(); 
					System.out.println("Which attributes would you like to insert?"); 
					attributes = input.next(); 
					System.out.println("What are the values of attributes?"); 
					values = input.next(); 
					String insert = "INSERT INTO " + tablename + " (" + attributes + ") values (" + values + ")";
					statement.executeUpdate(insert);
					} catch (SQLException e) {
   						sqlCode = e.getErrorCode(); // Get SQLCODE
                				sqlState = e.getSQLState(); // Get SQLSTATE
 						System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
						System.out.println("please try again");
					}		
					break;
				case 2: //sql update 
					try {
					System.out.println("Which table would you like to update?"); 
					tablename = input.next(); 
					System.out.println("Which attribute would you like to update?"); 
					attribute = input.next(); 
					System.out.println("What is the new value?"); 
					newvalue = input.next(); 
					System.out.println("What is the constraint?"); 
					constraint = input.next(); 
					String update = "UPDATE " + tablename + " SET " + attribute + " = " + newvalue + " WHERE " + constraint; 
					System.out.println(update); 						
					statement.executeUpdate(update);
					} catch (SQLException e) {
   						sqlCode = e.getErrorCode(); // Get SQLCODE
                				sqlState = e.getSQLState(); // Get SQLSTATE
 						System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
						System.out.println("please try again");
					}
					break; 
				case 3: //sql delete 
					try {
					System.out.println("Which table would you like to delete from?"); 
					tablename = input.next(); 
					System.out.println("What is the constraint?"); 
					constraint = input.next(); 
					String delete = "DELETE FROM " + tablename + " WHERE " + constraint; 
					System.out.println(delete); 
					statement.executeUpdate(delete); 
					} catch (SQLException e) {
   						sqlCode = e.getErrorCode(); // Get SQLCODE
                				sqlState = e.getSQLState(); // Get SQLSTATE
 						System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
						System.out.println("please try again");
					}
					break; 
				case 4: //sql query
					try {
					String query; 
					System.out.println("What are you interested in?"); 
					System.out.println("1 = List Plan IDs and number of members enrolled in each plan"); 
					System.out.println("2 = How many patients visit each provider (in descending order)"); 
					System.out.println("3 = Which members haven't submitted claims yet?"); 
					System.out.println("4 = Which members are in Alabama and also visited location 5"); 
					System.out.println("5 = Which members have visited more than two different locations"); 
					int option = input.nextInt(); 
					switch(option) { 
						case 1: query = "select planID, count(*) as numberOfMember from participateIn group by planID";
							System.out.println(query);
							java.sql.ResultSet rs1 = statement.executeQuery(query);
							while (rs1.next()) {
								int planID = rs1.getInt(1);
								int numberOfMember = rs1.getInt(2);
								System.out.println("planID = " + planID + " count = " + numberOfMember);
							}
						System.out.println ("DONE"); 
						break; 
						case 2: query = "select p.providerID, p.firstName, p.lastName, p.specialty, p.experience, p.averageMemberCost, count(*) as count from provider p, services s where p.providerID = s.providerID group by p.providerID, p.firstName, p.lastName, p.specialty, p.experience, p.averageMemberCost order by count desc"; 
							System.out.println(query);
							java.sql.ResultSet rs2 = statement.executeQuery(query);
							while (rs2.next()) {
								int providerID = rs2.getInt(1);
								int averageMemberCost = rs2.getInt(6);
								int count = rs2.getInt(7);
								System.out.println("providerID = " + providerID + " averageMemberCost = " + averageMemberCost + " count = " + count);
							}
						System.out.println ("DONE"); 
						break; 
						case 3: query = "select m.memberID, m.firstName, m.LastName from members m where m.memberID not in ( select s.memberID from submits s)"; 
							System.out.println (query) ;
							java.sql.ResultSet rs3 = statement.executeQuery (query) ;
							while (rs3.next()) {
								int id = rs3.getInt (1) ; 
								String firstname = rs3.getString (2); 
								String lastname = rs3.getString (3); 
								System.out.println ("member id: " + id); 
								System.out.println ("first name: " + firstname); 
								System.out.println ("last name: " + lastname); 
							} 
								System.out.println ("DONE"); 
							break; 
						case 4: query = "select memberID from belongsTo b where b.state = 'AL' intersect select memberID from visits v where v.locationID = 5"; 
							System.out.println (query) ; 
							java.sql.ResultSet rs4 = statement.executeQuery (query) ;
							while (rs4.next()) { 
								int id = rs4.getInt (1) ; 
								System.out.println ("member id: " + id); 
							} 
							System.out.println ("DONE"); 
							break;
						case 5: query = "select m.memberID, m.firstName, m.lastName from members m where m.memberID in (select v.memberID from visits v group by v.memberId having count(*) > 2)"; 
							System.out.println (query) ; 
							java.sql.ResultSet rs5 = statement.executeQuery (query) ; 
							while (rs5.next()) { 
								int id = rs5.getInt (1) ; 
								String firstname = rs5.getString (2); 	
								String lastname = rs5.getString (3); 
								System.out.println ("member id: " + id); 
								System.out.println ("first name: " + firstname);
								System.out.println ("last name: " + lastname); 		
							} 
							System.out.println ("DONE"); 
							break;
					}  
					} catch (SQLException e) {
   						sqlCode = e.getErrorCode(); // Get SQLCODE
                				sqlState = e.getSQLState(); // Get SQLSTATE
 						System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
						System.out.println("please try again");
					}
					break; 
				case 5: loop = false;
					break;
				default: System.out.println("Please choose between 1 and 5");
					break;
			}	
		}

		input.close();
		try {
			Runtime rt = Runtime.getRuntime();
			Process pr = rt.exec("db2 -f project3D.clp");
		} catch (Exception e) {
		}

	}

}
