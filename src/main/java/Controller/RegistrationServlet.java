package Controller;

import Model.JavaBeanRegistration;
import Services.Email;

import javax.mail.MessagingException;
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
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        try (PrintWriter out = response.getWriter()) {
            String check = request.getParameter("check");
            if (check == null) {
                out.println("box not checked");
            } else {
                JavaBeanRegistration user = new JavaBeanRegistration();
                user.setFirstName(request.getParameter("firstName"));
                user.setLastName(request.getParameter("lastName"));
                user.setAddress(request.getParameter("address"));
                user.setCity(request.getParameter("city"));
                user.setZip(request.getParameter("zip"));
                user.setState(request.getParameter("state"));
                user.setCountry(request.getParameter("country"));
                user.setPhone(request.getParameter("phone"));
                user.setUsername(request.getParameter("userName"));
                user.setPassword(request.getParameter("password"));
                Email mail = new Email();
                user.setCode(mail.getRandom());
                Boolean test = false;

                test = mail.sendEmail(user);

                if (test) {
                    HttpSession session = request.getSession();
                    session.setAttribute("authCode", user);
                    //response.sendRedirect("verify.jsp");
                    out.println("done");
                } else {
                    out.println("error");
                }


            }
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}


