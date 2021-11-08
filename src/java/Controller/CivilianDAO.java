package Controller;

import Connection.MyConnection;
import Model.Civilian;
import Model.Login;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        System.out.println(sql);
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
}
