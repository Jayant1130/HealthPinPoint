package Controller;

import Connection.MyConnection;
import Model.Civilian;
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
        ps.setInt(1, Integer.parseInt(c.getHealthID()));
        ps.setInt(2, c.getDistrictID());
        ps.setString(3, c.getName());
        ps.setString(4, c.getMobileNo());
        ps.setString(5, c.getAddress());
        ps.setString(6, c.getDOB());
        ps.setInt(7, Integer.parseInt(c.getEmergencyNo()));
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
        ps.setInt(1, Integer.parseInt(aadhar));
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
}
