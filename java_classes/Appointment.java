package yourmed24;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Appointment {
    private int id;
    private Date date;
    private Time time;
    private int patientId;
    private int doctorId;
    private Patient patient;
    private Doctor doctor;

    public Appointment(Date date, Time time, int patientId, int doctorId) {
        this.date = date;
        this.time = time;
        this.patientId = patientId;
        this.doctorId = doctorId;

    }

    public Appointment(int id, Date date, Time time, int patientId, int doctorId) {
        this.id = id;
        this.date = date;
        this.time = time;
        this.patientId = patientId;
        this.doctorId = doctorId;

    } 

    
    public Appointment(int id, Date date, Time time, Patient patient, Doctor doctor) {
        this.id = id;
        this.date = date;
        this.time = time;
        this.patient = patient;
        this.patientId = patient.getId();
        this.doctor = doctor;
        this.doctorId = doctor.getId();
    } 

    public int getId() {
        return id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

     public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    // Make Appointment Method
    public static void makeAppointment(Appointment appointment) throws Exception {	
		DB db = new DB();
		Connection con = null;
		String query = "SELECT * FROM appointment WHERE appointmentDate=? AND appointmentTime=? AND doctorID=?;";
		String sql = "INSERT INTO appointment(appointmentDate,appointmentTime,userID,doctorID) VALUES(?,?,?,?);";
		try {
			con = db.getConnection();
			PreparedStatement stmt1 = con.prepareStatement(query);
			stmt1.setDate(1, appointment.getDate());
            stmt1.setTime(2, appointment.getTime());
            stmt1.setInt(3, appointment.getDoctorId());
			ResultSet rs = stmt1.executeQuery();
			if (rs.next()) {
				rs.close();
				stmt1.close();
				db.close();
				throw new Exception("Sorry there is no availability for this appointment");
			}
			
			PreparedStatement stmt2 = con.prepareStatement(sql);
			stmt2.setDate(1, appointment.getDate());
			stmt2.setTime(2, appointment.getTime());
			stmt2.setInt(3, appointment.getPatientId());
			stmt2.setInt(4, appointment.getDoctorId());
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

    // Show Appointment Method
    public static List<Appointment> showAppointments(int patientId) throws Exception {
        List<Appointment> appointments = new ArrayList<Appointment>();
        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM appointment "
            + "LEFT JOIN patient on appointment.userID = patient.userID "
            + "LEFT JOIN doctor on appointment.doctorID = doctor.doctorID "
            + "WHERE appointment.userID = ? AND CONCAT(appointmentDate, ' ', appointmentTime) > NOW() ORDER BY appointmentDate; ";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, patientId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
            appointments.add (new Appointment(rs.getInt("appointmentID"),
                        rs.getDate("appointmentDate"),
                        rs.getTime("appointmentTime"),
                            new Patient(rs.getInt("userID"),
                                rs.getString("nameP"),
                                rs.getString("surnameP"),
                                rs.getString("emailP"), 
                                rs.getString("password")),
                            new Doctor(rs.getInt("doctorID"),
                                rs.getString("nameD"),
                                rs.getString("surnameD"),
                                rs.getString("specialty"),
                                rs.getString("addressD"),
                                rs.getString("phoneD"),
                                rs.getString("detailsD"))));
            }

            rs.close();
            stmt.close();
            db.close();

            return appointments;
  
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();    
            } catch (Exception e) {
                
            } 
        }       
    }

    // Cancel Appointment Method
    public static void cancelAppointment(int id) throws Exception {
        DB db = new DB();
        Connection con = null;
        String sql = "DELETE FROM appointment where appointmentID=?;";
        try {
            con = db.getConnection();
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);            
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

//


