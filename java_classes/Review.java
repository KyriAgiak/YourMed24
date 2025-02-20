package yourmed24;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Review {
    private int id;
    private Timestamp date;
    private int rate;
    private String comment;
    private int patientId;
    private int doctorId;
    private Patient patient;
    private Doctor doctor;

    public Review(Timestamp date, int rate, String comment, int patientId, int doctorId) {
        this.date = date;
        this.rate = rate;
        this.comment = comment;
        this.patientId = patientId;
        this.doctorId = doctorId;
    }

    public Review(int id, Timestamp date, int rate, String comment, int patientId, int doctorId) {
        this.id = id;
        this.date = date;
        this.rate = rate;
        this.comment = comment;
        this.patientId = patientId;
        this.doctorId = doctorId;
    }

    public Review(int id, Timestamp date, int rate, String comment, Patient patient, Doctor doctor) {
        this.id = id;
        this.date = date;
        this.rate = rate;
        this.comment = comment;
        this.patient = patient;
        this.patientId = patient.getId();
        this.doctor = doctor;
        this.doctorId = doctor.getId();
    }

    public int getId() {
        return id;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
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

    //Get Review Method
    public static List<Review> getReview(int doctorId) throws Exception {
        List<Review> reviews = new ArrayList<>();
        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM review "
            + "LEFT JOIN patient on review.userID=patient.userID "
            + "LEFT JOIN doctor on review.doctorID=doctor.doctorID "
            + "WHERE review.doctorID=?;";
        String query2 = "SELECT * FROM doctor WHERE doctorID=?;";
        try {
            con = db.getConnection();
            PreparedStatement stmt2 = con.prepareStatement(query2);
            stmt2.setInt(1,doctorId);
            ResultSet rs2 = stmt2.executeQuery();
            if (!rs2.next()) {
                throw new Exception ("The doctor you are looking for does not exist");
            }
            stmt2.close();
            rs2.close();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1,doctorId);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()) {
            reviews.add(new Review (rs.getInt("reviewID"),
                rs.getTimestamp("reviewDate"),
                rs.getInt("rate"),
                rs.getString("comment"),
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
            return reviews;

        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {

            }
        }
    }
    //Add Review Method
    public static void addReview(Review review) throws Exception {
        DB db = new DB();
        Connection con = null;
        String sql = "INSERT INTO review(reviewDate,rate,comment,userID,doctorID) VALUES (?,?,?,?,?)";
        try {
             con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             stmt.setTimestamp(1, review.getDate());
             stmt.setInt(2,review.getRate());
             stmt.setString(3,review.getComment());
             stmt.setInt(4,review.getPatientId());
             stmt.setInt(5,review.getDoctorId());
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
}


