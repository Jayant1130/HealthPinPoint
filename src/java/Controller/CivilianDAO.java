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
    public int CivilianGenerateID(Civilian c) throws SQLException, IOException{
        Connection con=null;
        PreparedStatement ps=null;
        con=MyConnection.getConnection();
        String sql="INSERT INTO civilian VALUES (? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ?);";
        ps=con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(c.getHealthID()));
        ps.setInt(2, c.getCityID());
        ps.setString(3, c.getName());
        ps.setLong(4, Long.parseLong(c.getMobileNo()));
        ps.setString(5, c.getAddress());
        ps.setString(6, c.getDOB());
        ps.setLong(7, Long.parseLong(c.getEmergencyNo()));
        ps.setString(8, c.getPhoto());
        ps.setString(9, c.getAadharImage());
        ps.setString(10, c.getEmail());
        ps.setString(11, c.getReligion());
        ps.setString(12, c.getDiet());
        ps.setString(13, c.getMaritalStatus());
        int n = ps.executeUpdate();
        con.close();
        if(n > 0){
            return n;
        }else{
            return 0;
        }
    }
    public boolean isAadharExist(String aadhar) throws SQLException, IOException
    {
        Connection con=null;
        PreparedStatement ps=null;
        con=MyConnection.getConnection();
        String sql="select * from civilian where HealthID = ?";
        ps=con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(aadhar));
        ResultSet rs = ps.executeQuery();
        if(rs.next())
        {
            return true;
        }
        else
        {
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
            u =  new Civilian();
            u.setHealthID(rs.getString("HealthID"));
            u.setCityID(rs.getInt("CityID"));
            u.setName(rs.getString("Name"));
            u.setMobileNo(rs.getString("MobileNo"));
            u.setAddress(rs.getString("Address"));
            u.setDOB(rs.getString("DOB"));
            u.setEmergencyNo(rs.getString("EmergencyNo"));
            u.setPhoto(rs.getString("Photo"));
            u.setAadharImage(rs.getString("AadharImage"));
            u.setEmail(rs.getString("Email"));
            u.setReligion(rs.getString("Religion"));
            u.setMaritalStatus(rs.getString("MaritalStatus"));
        }
        con.close();
        return u;
    }
    public List<FamilyMember> getFamilyMembersByHealthID(String HealthID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from familyMember where healthid = ?";
        ps = con.prepareStatement(sql);
        ps.setLong(1, Long.parseLong(HealthID));
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
}
