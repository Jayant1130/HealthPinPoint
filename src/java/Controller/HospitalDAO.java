package Controller;

import Connection.MyConnection;
import Model.Doctor;
import Model.Hospital;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HospitalDAO {

    public boolean isHospitalEmailExist(String Email) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from hospital where Email = ?";
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
        sql = "select * from hospital where Email = ? ";
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
    
}
