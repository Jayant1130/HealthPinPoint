
package Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class Connection {
    static java.sql.Connection con=null;
    static
    {
        try 
        {
//               Class.forName("com.mysql.cj.jdbc.Driver");
           Class.forName("com.mysql.jdbc.Driver");
//             System.out.println("Driver load...........");
        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }  
    }
    
    public static java.sql.Connection getConnection()
    {
        try {
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");
          } 
        catch (SQLException e) 
        {
            System.out.println(e);
        } 
        return con;
    }
}
