package Controller;

import Dao.SearchConnection;
import Model.JavaBeanLogin;
import Model.JavaBeanRegistration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JavaBeanRegistration search = new JavaBeanRegistration();
        JavaBeanLogin login = new JavaBeanLogin();

        search.setFirstName(request.getParameter("firstName"));
        search.setLastName(request.getParameter("lastName"));
        boolean flag = false;
        flag = SearchConnection.search(search, login);
        if (flag) {

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("SearchProfile.jsp");

            request.setAttribute("firstName1", search.getFirstName());
            request.setAttribute("lastName1", search.getLastName());
            request.setAttribute("address1", search.getAddress());
            request.setAttribute("city1", search.getCity());
            request.setAttribute("zip1", search.getZip());
            request.setAttribute("state1", search.getState());
            request.setAttribute("country1", search.getCountry());
            request.setAttribute("phone1", search.getPhone());
            request.setAttribute("userName1", login.getUsername());
            // request.setAttribute("partyId1", login.getPartyId());
            HttpSession httpSession = request.getSession(true);
            httpSession.setAttribute("partyId1", login.getPartyId());

            requestDispatcher.forward(request, response);
        } else {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body BGCOLOR = 'PINK',fontcolor='White'><h1>done</h1></body></html>");
        }
    }
}