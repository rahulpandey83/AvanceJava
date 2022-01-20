package Controller;

import Model.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        httpSession.removeAttribute("userName");
        httpSession.removeAttribute("password");
        httpSession.removeAttribute("partyId");
//        httpSession.removeAttribute("firstName");
//        httpSession.removeAttribute("lastName");
//        httpSession.removeAttribute("address");
//        httpSession.removeAttribute("city");
//        httpSession.removeAttribute("state");
//        httpSession.removeAttribute("country");
//        httpSession.removeAttribute("phone");
        Message msg = new Message("Logout Successfully", "success", "alert-success");
        httpSession.setAttribute("msg", msg);
        //  httpSession.invalidate();
        response.sendRedirect("Login.jsp");
    }
}

