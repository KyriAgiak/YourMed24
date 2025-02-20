package yourmed24;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Doctor {
    private int id;
    private String name;
    private String surname;
    private String specialty;
    private String address;
    private String phone;
    private String details;

    public  Doctor () {
    
    }

    public Doctor(int id, String name, String surname, 
            String specialty, String address, String phone, String details) {        
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.specialty = specialty;
        this.address = address;
        this.phone = phone;
        this.details = details;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getSpecialty() {
        return specialty;
    }

    public String getAddress() {
        return address;        
    }  

    public String getPhone() {
        return phone;
    }

    public String getDetails() {
        return details;
    }

    public static List<Doctor> getDoctors(String specialty, String address) throws Exception {
        List<Doctor> doctors = new ArrayList<Doctor>();
        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM doctor WHERE specialty=? AND addressD=?;";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, specialty);
            stmt.setString(2, address);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                doctors.add (new Doctor(rs.getInt("doctorID"),
                rs.getString("nameD"),
                rs.getString("surnameD"),
                rs.getString("specialty"),
                rs.getString("addressD"),
                rs.getString("phoneD"),
                rs.getString("detailsD")));
            }
            rs.close();
            stmt.close();
            db.close();

            return doctors;  
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();    
            } catch (Exception e) {
                
            } 
        }       
    }
    //Get Doctor By id Method
    public static Doctor getDoctorById(int id) throws Exception {
        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM doctor WHERE doctorID=?;";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (!rs.next()) {
                rs.close();
                stmt.close();
                return null;
            }   
                return new Doctor(rs.getInt("doctorID"),
                rs.getString("nameD"),
                rs.getString("surnameD"),
                rs.getString("specialty"),
                rs.getString("addressD"),
                rs.getString("phoneD"),
                rs.getString("detailsD"));
            
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

