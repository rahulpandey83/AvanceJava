package Controller;

import Dao.Update;
import Model.JavaBeanLogin;
import Model.JavaBeanRegistration;
import Services.DataBaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/EditServlet")
public class EditProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public EditProfileServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession httpSession = request.getSession();
        int id = (int) httpSession.getAttribute("partyId");


        JavaBeanLogin login = new JavaBeanLogin();


        login.setPartyId(id);

        JavaBeanRegistration user = new JavaBeanRegistration();
        user.setFirstName(request.getParameter("userFirstName"));
        user.setLastName(request.getParameter("userLastName"));
        user.setAddress(request.getParameter("userAddress"));
        user.setCity(request.getParameter("userCity"));
        user.setZip(request.getParameter("userZip"));
        user.setState(request.getParameter("userState"));
        user.setCountry(request.getParameter("userCountry"));
        user.setPhone(request.getParameter("userPhone"));

        Update update = new Update();
        boolean flag = false;

        try {
            flag = update.EditProfile(user, login);
            if (flag) {

                Connection connection = DataBaseConnection.getConnection();
                String userData = "SELECT * from Party  WHERE partyId =" + id;
                PreparedStatement preparedStatement = connection.prepareStatement(userData);
                // preparedStatement.setString(1, userLogin.getUsername());
                ResultSet resultSet1 = preparedStatement.executeQuery();

                if (resultSet1.next()) {
//                    httpSession.setAttribute("firstName",  resultSet1.getString("firstName"));
//                    httpSession.setAttribute("lastName", resultSet1.getString("lastName"));
//
//                    httpSession.setAttribute("address", resultSet1.getString("address"));
//                    httpSession.setAttribute("city",  resultSet1.getString("city"));
//                    httpSession.setAttribute("zip", resultSet1.getString("zip"));
//                    httpSession.setAttribute("state",  resultSet1.getString("state"));
//                    httpSession.setAttribute("country",    resultSet1.getString("country"));
//                    httpSession.setAttribute("phone",  resultSet1.getString("phone"));
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("profile.jsp");
                    request.setAttribute("firstName", resultSet1.getString("firstName"));
                    request.setAttribute("lastName", resultSet1.getString("lastName"));
                    request.setAttribute("address", resultSet1.getString("address"));
                    request.setAttribute("city", resultSet1.getString("city"));
                    request.setAttribute("zip", resultSet1.getString("zip"));
                    request.setAttribute("state", resultSet1.getString("state"));
                    request.setAttribute("country", resultSet1.getString("country"));
                    request.setAttribute("phone", resultSet1.getString("phone"));
//                    request.setAttribute("userName1", login.getUsername());
//                    request.setAttribute("partyId1", login.getPartyId());
                    // System.out.println(user.getCountry());

                    requestDispatcher.forward(request, response);
                } else {
                    response.sendRedirect("/profile.jsp");
                }

            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }


}







