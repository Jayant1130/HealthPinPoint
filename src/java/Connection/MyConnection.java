
package Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
    static java.sql.Connection con=null;
    static
    {
        try 
        {
               Class.forName("com.mysql.cj.jdbc.Driver");
//           Class.forName("com.mysql.jdbc.Driver");
             System.out.println("Driver load...........");
        } 
        catch (Exception e) 
        {
            System.out.println(e);
        }  
    }
    
    public static java.sql.Connection getConnection()
    {
        try {
           con=DriverManager.getConnection("jdbc:mysql://uhjngpybqckknztx:0E8zscqJ9YJezbRe5ELm@baiqzipfb1xqinsda2d5-mysql.services.clever-cloud.com:3306/baiqzipfb1xqinsda2d5", "uhjngpybqckknztx", "0E8zscqJ9YJezbRe5ELm");
//            System.out.println("Connection done....");
          } 
        catch (SQLException e) 
        {
            System.out.println(e);
        } 
        return con;
    }
    
    
}
