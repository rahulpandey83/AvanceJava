package Controller;

import Services.DataBaseConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        if (session.getAttribute("userLogin") != null) {
            int partyId = (int) session.getAttribute("partyId");
            System.out.println(partyId);

            try {
                Connection connection = DataBaseConnection.getConnection();

                String query = "DELETE userlogin , party  FROM userlogin  INNER JOIN party  " +
                        "WHERE userlogin.partyId= party.partyId and party.partyId =" + partyId;

                Statement statement = connection.createStatement();
                statement.executeUpdate(query);
                session.invalidate();

                RequestDispatcher requestDispatcher = req.getRequestDispatcher("Register.jsp");
                requestDispatcher.forward(req, resp);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else
            resp.sendRedirect("/Login.jsp");
    }
}

