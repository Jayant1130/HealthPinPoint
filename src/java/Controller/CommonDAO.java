package Controller;

import Connection.MyConnection;
import Model.City;
import Model.State;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommonDAO {
    public List<State> getAllStates() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from state ";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        List<State> mylist = new ArrayList<State>();
        while (rs.next()) {
            State u = new State();
            u.setStateId(rs.getInt("StateID"));
            u.setStateName(rs.getString("StateName"));
            mylist.add(u);
            u = null;
        }
        con.close();
        return mylist;
    }
    
    public List<City> getAllCitiesByStateID(int StateID) throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        con = MyConnection.getConnection();
        String sql;
        sql = "select * from city where stateid = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, StateID);
        rs = ps.executeQuery();
        List<City> mylist = new ArrayList<City>();
        while (rs.next()) {
            City u = new City();
            u.setStateID(rs.getInt("StateID"));
            u.setCityName(rs.getString("CityName"));
            u.setCityID(rs.getInt("CityID"));
            mylist.add(u);
            u = null;
        }
        con.close();
        return mylist;
    }
}
