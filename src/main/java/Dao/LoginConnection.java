package Dao;

import Model.JavaBeanLogin;
import Model.JavaBeanRegistration;
import Services.DataBaseConnection;

import java.sql.*;

public class LoginConnection {
    public static boolean validation(JavaBeanLogin userLogin, JavaBeanRegistration userRegister) throws SQLException {
        Connection connection = DataBaseConnection.getConnection();


        String query = "select userLoginId, password from userlogin";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
            // Checking if entered email & password are correct.
            if (resultSet.getString("userLoginId").equalsIgnoreCase(userLogin.getUsername())
                    && resultSet.getString("password").equals(userLogin.getPassword())) {

                String userData = "select * from Party natural join userlogin where userLoginId = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(userData);
                preparedStatement.setString(1, userLogin.getUsername());
                ResultSet resultSet1 = preparedStatement.executeQuery();

                if (resultSet1.next()) {
                    userLogin.setPartyId(resultSet1.getInt("partyId"));
                    userRegister.setFirstName(resultSet1.getString("firstName"));
                    userRegister.setLastName(resultSet1.getString("lastName"));
                    userRegister.setAddress(resultSet1.getString("address"));
                    userRegister.setCity(resultSet1.getString("city"));
                    userRegister.setZip(resultSet1.getString("zip"));
                    userRegister.setState(resultSet1.getString("state"));
                    userRegister.setCountry(resultSet1.getString("country"));
                    userRegister.setPhone(resultSet1.getString("phone"));
                    System.out.println("hello");
                    return true;

                }

            }

        }
        return false;
    }
}




