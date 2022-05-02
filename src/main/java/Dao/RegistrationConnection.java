package Dao;

import Model.JavaBeanRegistration;
import Services.DataBaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

 public class RegistrationConnection {

    public static int nextPk() {
        int partyId = 0;
        Connection conn;
        try {
            conn = DataBaseConnection.getConnection();
            //select max partyId into the party table for incrementing the party id
            PreparedStatement stmt = conn.prepareStatement("select Max(partyId) as pk from rs.party");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                partyId = rs.getInt(1);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return partyId + 1;

    }

    public static boolean addUser(JavaBeanRegistration user) {
        boolean flag = false;
        int partyId = nextPk();
        try {
            Connection conn = DataBaseConnection.getConnection();
            //inserting data in registration (party) table
            String query = "INSERT INTO rs.party" + "(partyId,firstName,lastName,address,city,zip,state,country,phone) values" + "(?,?,?,?,?,?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, partyId);
            preparedStatement.setString(2, user.getFirstName());
            preparedStatement.setString(3, user.getLastName());
            preparedStatement.setString(4, user.getAddress());
            preparedStatement.setString(5, user.getCity());
            preparedStatement.setString(6, user.getZip());
            preparedStatement.setString(7, user.getState());
            preparedStatement.setString(8, user.getCountry());
            preparedStatement.setString(9, user.getPhone());

            //insert data in login table
            String query2 = "INSERT INTO rs.userlogin" + "(userLoginId,password,partyId) values" + "(?,?,?)";
            PreparedStatement preparedStatement1 = conn.prepareStatement(query2);
            preparedStatement1.setString(1, user.getUsername());
            preparedStatement1.setString(2, user.getPassword());
            preparedStatement1.setInt(3, partyId);
            System.out.println("success");
            preparedStatement1.executeUpdate();
            preparedStatement1.close();

            preparedStatement1.executeUpdate();
            preparedStatement1.close();
            flag = true;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return flag;
    }
}

