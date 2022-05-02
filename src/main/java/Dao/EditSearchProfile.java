package Dao;

import Model.JavaBeanLogin;
import Model.JavaBeanRegistration;
import Services.DataBaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditSearchProfile {
    public static boolean EditSearch(JavaBeanRegistration user, JavaBeanLogin login) throws SQLException {

        try {
            Connection connection = DataBaseConnection.getConnection();
            String editFirstName = user.getFirstName();
            String editLastName = user.getLastName();
            String editAddress = user.getAddress();
            String editCity = user.getCity();
            String editZip = user.getZip();
            String editState = user.getState();
            String editCountry = user.getCountry();
            String editPhone = user.getPhone();


            int partyId = login.getPartyId();

            String updateQuery = "UPDATE Party SET firstName = ?, lastName = ?,address =?, city = ?, zip = ?, state = ?, " +
                    "country = ?, phone = ? WHERE partyId =" + partyId;


            PreparedStatement statement = connection.prepareStatement(updateQuery);
            statement.setString(1, editFirstName);
            statement.setString(2, editLastName);
            statement.setString(3, editAddress);
            statement.setString(4, editCity);
            statement.setString(5, editZip);
            statement.setString(6, editState);
            statement.setString(7, editCountry);
            statement.setString(8, editPhone);
            statement.executeUpdate();
            statement.close();

            connection.close();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

