package Controller;

import Connection.MyConnection;
import Model.City;
import Model.Civilian;
import Model.Doctor;
import Model.FamilyMember;
import Model.HealthIssue;
import Model.Login;
import Model.Treatement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CivilianDAO {

    public int CivilianGenerateID(Civilian c) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "INSERT INTO civilian VALUES (? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?);";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(c.getHealthID()));
        ps.setInt(2, c.getCityID());
        ps.setString(3, c.getName());
        ps.setLong(4, Long.parseLong(c.getMobileNo()));
        ps.setString(5, c.getAddress());
        ps.setString(6, c.getDOB());
        ps.setLong(7, Long.parseLong(c.getEmergencyNo()));
        ps.setBlob(8, c.getPhoto().getInputStream());
        ps.setBlob(9, c.getAadharImage().getInputStream());
        ps.setString(10, c.getEmail());
        ps.setString(11, c.getReligion());
        ps.setString(12, c.getDiet());
        ps.setString(13, c.getMaritalStatus());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }

    public boolean isAadharExist(String aadhar) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "select * from civilian where HealthID = ?";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(aadhar));
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            con.close();
            return true;
        } else {
            con.close();
            return false;
        }
    }

    public boolean isCivilianID(String UserID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from civilian where HealthID = ?";
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

    public List<HealthIssue> getHealthIssuesByHealthID(String HealthID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from healthIssue where HealthID = ? ";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(HealthID));
        rs = ps.executeQuery();
        List<HealthIssue> mylist = new ArrayList<HealthIssue>();
        while (rs.next()) {
            HealthIssue u = new HealthIssue();
            u.setDateTime(rs.getString("DateTime"));
            u.setHealthID(rs.getString("HealthID"));
            u.setHealthIssueID(rs.getInt("HealthIssueID"));
            u.setComplaint(rs.getString("Complaint"));
            u.setDuration(rs.getString("Duration"));
            u.setDiseases(rs.getString("Diseases"));
            u.setOriginOfCause(rs.getString("OriginOfCause"));
            u.setTroubleTable(rs.getString("TroubleTable"));
            u.setMajor(rs.getInt("Major"));
            mylist.add(u);
            u = null;
        }
        con.close();
        return mylist;
    }

    public List<Treatement> getTreatementsByHealthIsssueID(int HealthIssueID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from treatement where HealthIssueID = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, HealthIssueID);
        rs = ps.executeQuery();
        List<Treatement> mylist = new ArrayList<Treatement>();
        while (rs.next()) {
            Treatement u = new Treatement();
            u.setDateTime(rs.getString("DateTime"));
            u.setHealthIssueID(rs.getInt("HealthIssueID"));
            u.setDoctorID(rs.getInt("DoctorID"));
            u.setHospitalID(rs.getInt("HospitalID"));
            u.setDiagnosis(rs.getString("Diagnosis"));
            u.setMedicinePrescribed(rs.getString("MedicinePrescribed"));
            u.setDetail(rs.getString("Detail"));
            u.setAdvice(rs.getString("Advice"));
            u.setOperation(rs.getString("Operation"));
            u.setOperationDetail(rs.getString("OperationDetail"));
            mylist.add(u);
            u = null;
        }
        con.close();
        return mylist;
    }

    public Civilian getCivilianByID(String HealthID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from civilian where HealthID = ? ";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(HealthID));
        rs = ps.executeQuery();
        Civilian u = null;
        if (rs.next()) {
            u = new Civilian();
            u.setHealthID(rs.getString("HealthID"));
            u.setCityID(rs.getInt("CityID"));
            u.setName(rs.getString("Name"));
            u.setMobileNo(rs.getString("MobileNo"));
            u.setAddress(rs.getString("Address"));
            u.setDOB(rs.getString("DOB"));
            u.setEmergencyNo(rs.getString("EmergencyNo"));
            u.setRPhoto(rs.getBlob("Photo"));
            u.setRAadharImage(rs.getBlob("AadharImage"));
            u.setEmail(rs.getString("Email"));
            u.setReligion(rs.getString("Religion"));
            u.setMaritalStatus(rs.getString("MaritalStatus"));
            u.setDiet(rs.getString("Diet"));
        }
        con.close();
        return u;
    }

    public List<FamilyMember> getFamilyMembersByHealthIDandStatus(String HealthID, int Status) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from familyMember where healthid = ? && status = ?";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(HealthID));
        ps.setInt(2, Status);
        rs = ps.executeQuery();
        List<FamilyMember> mylist = new ArrayList<FamilyMember>();
        while (rs.next()) {
            FamilyMember u = new FamilyMember();
            u.setHealthID(rs.getString("HealthID"));
            u.setRelationship(rs.getString("Relationship"));
            u.setRelativeHealthID(rs.getString("RelativeHealthID"));
            mylist.add(u);
            u = null;
        }
        con.close();
        return mylist;
    }

    public List<FamilyMember> getRFamilyMembersByHealthIDandStatus(String HealthID, int Status) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from familyMember where relativeHealthID = ? && status = ?";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(HealthID));
        ps.setInt(2, Status);
        rs = ps.executeQuery();
        List<FamilyMember> mylist = new ArrayList<FamilyMember>();
        while (rs.next()) {
            FamilyMember u = new FamilyMember();
            u.setHealthID(rs.getString("HealthID"));
            u.setRelationship(rs.getString("Relationship"));
            u.setRelativeHealthID(rs.getString("RelativeHealthID"));
            mylist.add(u);
            u = null;
        }
        con.close();
        return mylist;
    }

    public int isFamilyEntreatyExist(FamilyMember f) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from familyMember where HealthID = ? && RelativeHealthID = ?";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(f.getHealthID()));
        ps.setLong(2, Long.parseLong(f.getRelativeHealthID()));
        rs = ps.executeQuery();
        int n = 0;

        if (rs.next()) {
            n = rs.getInt("status");
            con.close();
            return n;
        } else {
            con.close();
            return -1;
        }
    }

    public int AddFamilyEntreatyID(FamilyMember f) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "INSERT INTO familyMember VALUES (? , ? , ? , ?);";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(f.getHealthID()));
        ps.setString(2, f.getRelationship());
        ps.setLong(3, Long.parseLong(f.getRelativeHealthID()));
        ps.setInt(4, f.getStatus());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }

    public int updateFamilyMemberStatus(FamilyMember f) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "update familyMember set status = ? where HealthID = ? and RelativeHealthID = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, f.getStatus());
        ps.setLong(2, Long.parseLong(f.getHealthID()));
        ps.setLong(3, Long.parseLong(f.getRelativeHealthID()));
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }

    public int getNextHealthIssueID() throws SQLException {
        String sql;
        int n = 120001;
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        sql = "Select max(HealthIssueID) from healthIssue";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            if (rs.getInt("max(HealthIssueID)") != 0) {
                n = rs.getInt("max(HealthIssueID)") + 1;
            }
        }
        con.close();
        return n;
    }

    public int addHealthIssue(HealthIssue f) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "INSERT INTO healthIssue VALUES (now(),?,?,?,?,?,?,?,?)";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(f.getHealthID()));
        ps.setInt(2, new CivilianDAO().getNextHealthIssueID());
        ps.setString(3, f.getComplaint());
        ps.setString(4, f.getDuration());
        ps.setString(5, f.getDiseases());
        ps.setString(6, f.getOriginOfCause());
        ps.setString(7, f.getTroubleTable());
        ps.setInt(8, f.getMajor());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
    
    public HealthIssue getHealthIssuesByID(int HealthIssueID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from healthIssue where HealthIssueID = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, HealthIssueID);
        rs = ps.executeQuery();
            HealthIssue u = null;
        if (rs.next()) {
             u = new HealthIssue();
            u.setDateTime(rs.getString("DateTime"));
            u.setHealthID(rs.getString("HealthID"));
            u.setHealthIssueID(rs.getInt("HealthIssueID"));
            u.setComplaint(rs.getString("Complaint"));
            u.setDuration(rs.getString("Duration"));
            u.setDiseases(rs.getString("Diseases"));
            u.setOriginOfCause(rs.getString("OriginOfCause"));
            u.setTroubleTable(rs.getString("TroubleTable"));
            u.setMajor(rs.getInt("Major"));
        }
        con.close();
        return u;
    }
    
    public int updateHealthIssue(HealthIssue h) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "UPDATE healthIssue SET DateTime = now(), Complaint = ?, Duration = ?, Diseases = ? , OriginOfCause = ?, TroubleTable = ?, Major = ? WHERE HealthIssueId = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, h.getComplaint());
        ps.setString(2, h.getDuration());
        ps.setString(3, h.getDiseases());
        ps.setString(4, h.getOriginOfCause());
        ps.setString(5, h.getOriginOfCause());
        ps.setInt(6, h.getMajor());
        ps.setInt(7, h.getHealthIssueID());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
    
    public int getNextTreatementID() throws SQLException {
        String sql;
        int n = 2000001;
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        sql = "Select max(TreatementID) from treatement";
        ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            if (rs.getInt("max(TreatementID)") != 0) {
                n = rs.getInt("max(TreatementID)") + 1;
            }
        }
        con.close();
        return n;
    }
    
    public int addTreatement(Treatement t) throws SQLException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql = "INSERT INTO treatement VALUES (now(),?,?,?,?,?,?,?,?,?,?);";
        ps = con.prepareStatement(sql);
        ps.setInt(1, new CivilianDAO().getNextTreatementID());
        ps.setInt(2, t.getHealthIssueID());
        ps.setInt(3, t.getDoctorID());
        ps.setInt(4, t.getHospitalID());
        ps.setString(5, t.getDiagnosis());
        ps.setString(6, t.getMedicinePrescribed());
        ps.setString(7, t.getDetail());
        ps.setString(8, t.getAdvice());
        ps.setString(9, t.getOperation());
        ps.setString(10, t.getOperationDetail());
        int n = ps.executeUpdate();
        con.close();
        if (n > 0) {
            return n;
        } else {
            return 0;
        }
    }
}
