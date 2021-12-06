package Controller;

import Connection.MyConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
    public String isAdminIDExist(String Email) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from admin where AdminID = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, Email);
        rs = ps.executeQuery();
            String s = null;
        if (rs.next()) {
            s = rs.getString("Type");
            con.close();
            return s;
        } else {
            con.close();
            return s;
        }
    }
}
