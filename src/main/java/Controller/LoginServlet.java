package Controller;

import Dao.LoginConnection;
import Model.JavaBeanLogin;
import Model.JavaBeanRegistration;
import Model.Message;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@MultipartConfig
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        JavaBeanLogin userLogin = new JavaBeanLogin();
        JavaBeanRegistration userRegister = new JavaBeanRegistration();

        userLogin.setUsername(request.getParameter("userName"));
        userLogin.setPassword(request.getParameter("password"));
        try (PrintWriter out = response.getWriter()) {

            if (LoginConnection.validation(userLogin, userRegister)) {
                /**
                 * Creating new session.
                 */
                HttpSession httpSession = request.getSession(true);
                httpSession.setAttribute("userLogin", userLogin.getUsername());
                httpSession.setAttribute("password", userLogin.getPassword());
                httpSession.setAttribute("partyId", userLogin.getPartyId());


//
//                        httpSession.setAttribute("userName", userLogin.getUsername());
//                        httpSession.setAttribute("password", userLogin.getPassword());
//                        httpSession.setAttribute("partyId", userLogin.getPartyId());
//                        httpSession.setAttribute("firstName", userRegister.getFirstName());
//                        httpSession.setAttribute("lastName",userRegister.getLastName());
//
//                        httpSession.setAttribute("address",userRegister.getAddress());
//                        httpSession.setAttribute("city", userRegister.getCity());
//                        httpSession.setAttribute("zip", userRegister.getZip());
//                        httpSession.setAttribute("state", userRegister.getState());
//                        httpSession.setAttribute("country", userRegister.getCountry());
//                        httpSession.setAttribute("phone", userRegister.getPhone());


                // Forwarding user to profile page.
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("profile.jsp");

                request.setAttribute("firstName", userRegister.getFirstName());
                request.setAttribute("lastName", userRegister.getLastName());

                request.setAttribute("address", userRegister.getAddress());
                request.setAttribute("city", userRegister.getCity());
                request.setAttribute("zip", userRegister.getZip());
                request.setAttribute("state", userRegister.getState());
                request.setAttribute("country", userRegister.getCountry());
                request.setAttribute("phone", userRegister.getPhone());
                out.println("done");
                requestDispatcher.forward(request, response);

                // response.sendRedirect("profile.jsp");
            } else {
                Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);

                response.sendRedirect("Login.jsp");
                out.println("error");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

}

