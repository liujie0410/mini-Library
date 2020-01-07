package Action;

import Dao.UserDao;
import Entity.User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction extends HttpServlet {
    UserDao udao = new UserDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("login")) {
            this.login(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = null;
        String password = null;
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        username = request.getParameter("username");
        password = request.getParameter("password");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        String result = udao.login(user);
        if(result.equals("true")){
            session.setAttribute("adminname", user.getName());
            request.getRequestDispatcher("/main.jsp").forward(request, response);
        }
        else{
            out.write(result);
        }
    }
}



