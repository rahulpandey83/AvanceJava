package Dao;

import Model.JavaBeanLogin;
import Model.JavaBeanRegistration;
import Services.DataBaseConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SearchConnection {
    public static boolean search(JavaBeanRegistration search, JavaBeanLogin login) {
        try {
            Connection connection = DataBaseConnection.getConnection();
            String searchName = "select firstName, lastName from party";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(searchName);
            String firstName = search.getFirstName();
            String lastName = search.getLastName();
            System.out.println("Profile Query Executed");
            System.out.println(firstName);
            System.out.println(lastName);

            // Checking if name entered by the user matches inside the database.
            while (resultSet.next()) {
                System.out.println("Profile Query Executed");
                if (resultSet.getString("firstName").equalsIgnoreCase(firstName)
                        && resultSet.getString("lastName").equalsIgnoreCase(lastName)) {
                    System.out.println("Profile Query Executed");
                    // Fetches profile from DB based on user input
                    String profileQuery = "SELECT * FROM party p join userlogin ul on p.partyId = ul.partyId WHERE firstName ='"
                            + firstName + "' AND lastName='" + lastName + "'" ;
                    Statement statement1 = connection.createStatement();
                    System.out.println("Profile Query Executed");
                    ResultSet result = statement1.executeQuery(profileQuery);

                   if (result.next()) {
                       System.out.println("Profile Query Executed");
                       login.setPartyId(result.getInt("partyId"));
                       search.setFirstName(result.getString("firstName"));
                       search.setLastName(result.getString("lastName"));
                       search.setAddress(result.getString("address"));
                       search.setCity(result.getString("city"));
                       search.setZip(result.getString("zip"));
                       search.setState(result.getString("state"));
                       search.setCountry(result.getString("country"));
                       search.setPhone(result.getString("phone"));
                       System.out.println("Profile Query Executed");
                       return true;
                   }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
          return  false;
    }
}