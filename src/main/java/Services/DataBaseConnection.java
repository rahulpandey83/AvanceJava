package Services;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseConnection {
    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1:3306/rs";
            String userName = "root";
            String passWord = "123456";
            con = DriverManager.getConnection(url, userName, passWord);


        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
}
