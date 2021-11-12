package Controller;

import Connection.MyConnection;
import Model.Doctor;
import Model.Treatement;
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
        sql = "select * from doctor where HealthID = ?";
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
            u.setClinicProof(rs.getString("ClinicProof"));
            u.setDegreeProof(rs.getString("DegreeProof"));
            u.setHealthID(rs.getString("HealthID"));
        }
        con.close();
        return u;
    }
}
