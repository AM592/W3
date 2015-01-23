package com.TestProj;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

/**
 *
 * @author Chris
 */
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    public void init(ServletConfig config) throws ServletException {

    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*System.out.println("We are in service method of servlet");*/

        /*
         String username = "root";
         String password = "123";
         */
        String un = request.getParameter("username");
        String pw = request.getParameter("password");

        Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "test_db";
        String driver = "com.mysql.jdbc.Driver";
        String dbUserName = "root";
        String dbpassword = "";

        try {

            Class.forName(driver).newInstance();
            conn = (Connection) DriverManager.getConnection(url + dbName, dbUserName, dbpassword);

            String strQuery = "select * from user_table where username='" + un + "' and password = '" + pw + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(strQuery);
            if (rs.next()) {
                /*msg="Hello " + un + "! Your login is sucessfull.";*/
                HttpSession session = request.getSession();
                session.setAttribute(un, pw);
                session.setAttribute("userName", un);
                session.setAttribute("userID",rs.getString("id"));
                //setting session to expiry in 30 mins
                session.setMaxInactiveInterval( 30 * 60);
                Cookie userName = new Cookie("username", un);
                userName.setMaxAge( 30 * 60);
                response.addCookie(userName);
                response.sendRedirect("home.jsp");
            } else {
                /*msg="Sorry " + un + "! Your login is failed.";*/
                //RequestDispatcher rd = getServletContext().getRequestDispatcher("/invalidLogin.jsp");
                RequestDispatcher rd = request.getRequestDispatcher("invalidLogin.jsp");
                rd.forward(request,response);
            }
            //rs.close();
            //st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
