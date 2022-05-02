package Controller;

import Dao.RegistrationConnection;
import Model.JavaBeanRegistration;
import Model.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
@WebServlet("/verify")
    public class VerifyMailServlet extends HttpServlet {
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            PrintWriter out=response.getWriter();
            HttpSession httpSession = request.getSession();

            JavaBeanRegistration user = (JavaBeanRegistration) httpSession.getAttribute("authCode");
            String code = request.getParameter("authCode");
            if (code.equals(user.getCode())) {

                RegistrationConnection Rs = new RegistrationConnection();
                boolean flag = false;
                flag = Rs.addUser(user);
                if(flag) {
                   // response.sendRedirect("Login.jsp");
                   out.println("done");
                }
            } else {
                //response.sendRedirect("verify.jsp");
                  out.println("error");
            }
        }
    }


