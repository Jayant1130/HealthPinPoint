package Controller;

import Connection.MyConnection;
import Model.CivilianAdmit;
import Model.Doctor;
import Model.DoctorAttached;
import Model.FamilyMember;
import Model.HealthIssue;
import Model.Hospital;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class HospitalDAO {

    public boolean isHospitalEmailExist(String Email) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from hospital where Email = ? ";
        ps = con.prepareStatement(sql);
        ps.setString(1, Email);
        rs = ps.executeQuery();
        if (rs.next()) {
            con.close();
            return true;
        } else {
            con.close();
            return false;
        }
    }

    public int getNextHospitalID() throws SQLException {
        String sql;
        int n = 4000001;
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        sql = "Select max(HospitalID) from hospital";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            if (rs.getInt("max(HospitalID)") != 0) {
                n = rs.getInt("max(HospitalID)") + 1;
            }
        }
        con.close();
        return n;
    }

    public int hospitalGenerateID(Hospital h) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "INSERT INTO hospital VALUES (? , ? , ? , ? , ? , ?, ? );";
        ps = con.prepareStatement(sql);
        ps.setInt(1, h.getHospitalID());
        ps.setString(2, h.getHospitalName());
        ps.setInt(3, h.getCityID());
        ps.setString(4, h.getAddress());
        ps.setBlob(5, h.getSDocument().getInputStream());
        ps.setString(6, h.getEmail());
        ps.setInt(7, 0);
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
    
    public Hospital getHospitalByEmail(String Email) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from hospital where Email = ?   ";
        ps = con.prepareStatement(sql);
        ps.setString(1, Email);
        rs = ps.executeQuery();
            Hospital u = null;
        if (rs.next()) {
            u =  new Hospital();
            u.setHospitalID(rs.getInt("HospitalID"));
            u.setAddress(rs.getString("Address"));
            u.setRSDocument(rs.getBlob("SDocument"));
            u.setCityID(rs.getInt("CityID"));
            u.setEmail(rs.getString("Email"));
            u.setHospitalName(rs.getString("HospitalName"));
            u.setActive(rs.getInt("Active"));
        }
        con.close();
        return u;
    }
    
    public CivilianAdmit getCivilianAdmit(CivilianAdmit ca) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from civilianAdmit where HealthID = ? and  HospitalID = ? and Dischargedate = null  ";
        ps = con.prepareStatement(sql);
        ps.setString(1, ca.getHealthID());
        ps.setInt(2, ca.getHospitalID());
        rs = ps.executeQuery();
            CivilianAdmit u = null;
        if (rs.next()) {
            u =  new CivilianAdmit();
            u.setHospitalID(rs.getInt("HospitalID"));
            u.setHealthID(rs.getString("HealthID"));
            u.setAdmitDate(rs.getString("AdmitDate"));
            u.setDischargeDate(rs.getString("DischargeDate"));
        }
        con.close();
        return u;
    }
    public int OptInPatient(CivilianAdmit ca) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "INSERT INTO civilianAdmit VALUES (? , ? , now() , null);";
        ps = con.prepareStatement(sql);
        ps.setString(1, ca.getHealthID());
        ps.setInt(2, ca.getHospitalID());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
    
     public List<CivilianAdmit> getCivlianAdmitByHospitalID(int HospitalID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from civilianAdmit where HospitalID = ?  ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, HospitalID);
        rs = ps.executeQuery();
        List<CivilianAdmit> mylist = new ArrayList<CivilianAdmit>();
        while (rs.next()) {
            CivilianAdmit u = new CivilianAdmit();
            u.setHealthID(rs.getString("HealthID"));
            u.setHospitalID(rs.getInt("HospitalID"));
            u.setAdmitDate(rs.getString("AdmitDate"));
            u.setDischargeDate(rs.getString("DischargeDate"));
            mylist.add(u);
            u = null;
        }
        con.close();
        return mylist;
    }
     public int OptOutPatient(CivilianAdmit ca) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "update civilianAdmit set dischargedate = now() where HealthID = ? and HospitalID = ? and admitdate = ? ";
        ps = con.prepareStatement(sql);
        ps.setString(1, ca.getHealthID());
        ps.setInt(2, ca.getHospitalID());
        ps.setString(3, ca.getAdmitDate());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
     public int AttachDoctor(DoctorAttached da) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "INSERT INTO doctorAttached VALUES (? , ?);";
        ps = con.prepareStatement(sql);
        ps.setInt(1, da.getDoctorID());
        ps.setInt(2, da.getHospitalID());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
     public List<DoctorAttached> getDoctorAttachedByHospitalID(int HospitalID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from doctorAttached where HospitalID = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, HospitalID);
        rs = ps.executeQuery();
        List<DoctorAttached> mylist = new ArrayList<DoctorAttached>();
        while (rs.next()) {
            DoctorAttached u = new DoctorAttached();
            u.setDoctorID(rs.getInt("DoctorID"));
            u.setHospitalID(rs.getInt("HospitalID"));
            mylist.add(u);
            u = null;
        }
        con.close();
        return mylist;
    }
     
     public int DeAttachDoctor(DoctorAttached da) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "delete from doctorAttached where HospitalID = ? and DoctorID = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(2, da.getDoctorID());
        ps.setInt(1, da.getHospitalID());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
     public List<Hospital> getUnVerifyHospitals() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from hospital where active = 0  ";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        List<Hospital> mylist = new ArrayList<Hospital>();
        while (rs.next()) {
            Hospital u = new Hospital();
            u.setHospitalID(rs.getInt("HospitalID"));
            u.setAddress(rs.getString("Address"));
            u.setRSDocument(rs.getBlob("SDocument"));
            u.setCityID(rs.getInt("CityID"));
            u.setEmail(rs.getString("Email"));
            u.setHospitalName(rs.getString("HospitalName"));
            u.setActive(rs.getInt("Active"));
            mylist.add(u);
            u = null;
        }
        con.close();
        return mylist;
    }
    public int ActivateHospitalID(int HospitalID) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "update hospital set active = 1 where HospitalID = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, HospitalID);
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
}
