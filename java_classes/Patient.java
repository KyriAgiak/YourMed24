package yourmed24;
import java.sql.*;

public class Patient {
    private int id;
	private String name;
	private String surname;
	private String email;
	private String password;

    public Patient(String name, String surname, String email, String password) {        
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
    }

    public Patient(int id, String name, String surname, String email, String password) {        
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setPassword(String password) {
        this.password = password;        
    }  

    public String getPassword() {
        return password;
    }

    //Login Method
    public static Patient login(String email, String password) throws Exception {
		DB db = new DB();
		Connection con = null;
		String query = "SELECT * FROM patient WHERE emailP=? AND password=?;";
		try {
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setString(1, email);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			
			if (!rs.next()) {
				con.close();
				rs.close();
				db.close();
				throw new Exception("Wrong email or password");
			}
			Patient patient = new Patient (rs.getInt("userID"),
									rs.getString("nameP"),
									rs.getString("surnameP"),
									rs.getString("emailP"),
									rs.getString("password"));
            rs.close();
            stmt.close();
            
			return patient;
			
		} catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
                
            }
        }

    }
    //Register Method
    public static void register(Patient patient) throws Exception {	
		DB db = new DB();
		Connection con = null;
		String query = "SELECT * FROM patient WHERE emailP=?;";
		String sql = "INSERT INTO patient (nameP, surnameP, emailP, password) VALUES(?,?,?,?);";
		try {
			con = db.getConnection();
			PreparedStatement stmt1 = con.prepareStatement(query);
			stmt1.setString(1, patient.getEmail());
			ResultSet rs = stmt1.executeQuery();
			if (rs.next()) {
				rs.close();
				stmt1.close();
				db.close();
				throw new Exception("Sorry, email already registered");
			}
			
			PreparedStatement stmt2 = con.prepareStatement(sql);
			stmt2.setString(1, patient.getName());
			stmt2.setString(2, patient.getSurname());
			stmt2.setString(3, patient.getEmail());
			stmt2.setString(4, patient.getPassword());
			stmt2.executeUpdate();
			stmt2.close();

		} catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
                
            }
        }
	}
    //Delete Method
    public static void deletePatient(int id) throws Exception {
        DB db = new DB();
        Connection con = null;
        String sql = "DELETE FROM patient where userID=?;";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);            
            stmt.executeUpdate();
            stmt.close();
            db.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
             db.close();   
            } catch (Exception e) {
                
            }          
            
        }

    }
    //Update Method
    public static void updatePatient(Patient patient) throws Exception {
        DB db = new DB();
        Connection con = null;
        String sql = "UPDATE patient SET nameP=?, surnameP=?, emailP=?, password=? WHERE userID=?";
        try {
            con = db.getConnection();
            PreparedStatement smt = con.prepareStatement(sql);            
            smt.setString(1, patient.getName());
            smt.setString(2, patient.getSurname());
            smt.setString(3, patient.getEmail());
            smt.setString(4, patient.getPassword());
            smt.setInt(5, patient.getId());
            
            smt.executeUpdate();
            smt.close();
            db.close();

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
             db.close();   
            } catch (Exception e) {
                
            }           
            
        }

    }
}

