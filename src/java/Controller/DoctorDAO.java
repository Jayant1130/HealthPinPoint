package Controller;

import Connection.MyConnection;
import Model.Civilian;
import Model.Doctor;
import Model.Hospital;
import Model.Treatement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DoctorDAO {
       public boolean isDoctorID(String UserID) throws SQLException {
           Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from doctor where HealthID = ?  ";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(UserID));
        rs = ps.executeQuery();
        if (rs.next()) {
            con.close();
            return true;
        } else {
            con.close();
            return false;
        }
    }
    public Doctor getDoctorByID(int DoctorID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from doctor where DoctorID = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, DoctorID);
        rs = ps.executeQuery();
            Doctor u = null;
        if (rs.next()) {
            u =  new Doctor();
            u.setDoctorID(rs.getInt("DoctorID"));
            u.setSpe_in(rs.getString("Spe_in"));
            u.setRClinicProof(rs.getBlob("ClinicProof"));
            u.setRDegreeProof(rs.getBlob("DegreeProof"));
            u.setHealthID(rs.getString("HealthID"));
            u.setActive(rs.getInt("Active"));
        }
        con.close();
        return u;
    }
    public Doctor getDoctorByHealthID(String HealthID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from doctor where HealthID = ?  ";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(HealthID));
        rs = ps.executeQuery();
            Doctor u = null;
        if (rs.next()) {
            u =  new Doctor();
            u.setDoctorID(rs.getInt("DoctorID"));
            u.setSpe_in(rs.getString("Spe_in"));
            u.setRClinicProof(rs.getBlob("ClinicProof"));
            u.setRDegreeProof(rs.getBlob("DegreeProof"));
            u.setHealthID(rs.getString("HealthID"));
            u.setActive(rs.getInt("Active"));
        }
        con.close();
        return u;
    }
    
    public int getNextDoctorID() throws SQLException {
        String sql;
        int n = 3000001;
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        sql = "Select max(DoctorID) from doctor";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            if (rs.getInt("max(DoctorID)") != 0) {
                n = rs.getInt("max(DoctorID)") + 1;
            }
        }
        con.close();
        return n;
    }
    
    public int DoctorGenerateID(Doctor d) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "INSERT INTO doctor VALUES (? , ? , ? , ? , ? , ? );";
        ps = con.prepareStatement(sql);
        ps.setInt(1, new DoctorDAO().getNextDoctorID());
        ps.setString(2, d.getSpe_in());
        ps.setBlob(4, d.getDegreeProof().getInputStream());
        ps.setBlob(3, d.getClinicProof().getInputStream());
        ps.setLong(5, Long.parseLong(d.getHealthID()));
        ps.setInt(6, 0);
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
    
    public List<Doctor> getUnVerifyDoctors() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from doctor where active = 0  ";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        List<Doctor> mylist = new ArrayList<Doctor>();
        while (rs.next()) {
            Doctor u = new Doctor();
            u.setDoctorID(rs.getInt("DoctorID"));
            u.setSpe_in(rs.getString("Spe_in"));
            u.setRClinicProof(rs.getBlob("ClinicProof"));
            u.setRDegreeProof(rs.getBlob("DegreeProof"));
            System.out.println(u.getRDegreeProof());
            System.out.println(u.getRClinicProof());
            u.setHealthID(rs.getString("HealthID"));
            u.setActive(rs.getInt("Active"));
            mylist.add(u);
            u = null;
        }
        con.close();
        return mylist;
    }
        public int DoctorHospitalID(int DoctorID) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "update doctor set active = 1 where DoctorID = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, DoctorID);
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
         public int ActivateDoctorID(int DoctorID) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "update doctor set active = 1 where DoctorID = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, DoctorID);
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
}
