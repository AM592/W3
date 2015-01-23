/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.TestProj;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import com.mysql.jdbc.PreparedStatement;

/**
 *
 * @author Chris
 */
public class Register extends HttpServlet {

    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/test_db";
    String dbUserName = "root";
    String dbpassword = "";
    Connection conn = null;
    Statement stmt = null;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);

        String uname = request.getParameter("username");
        String fname = request.getParameter("firstname");
        String lname = request.getParameter("lastname");
        String uemail = request.getParameter("email");
        String pass = request.getParameter("password");
        int id = 0;

        try {

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUserName, dbpassword);

            PreparedStatement ps = (PreparedStatement) conn.prepareStatement("select username from user_table where username=?");
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {

                PreparedStatement ps3 = (PreparedStatement) conn.prepareStatement("select email from user_table where email=?");
                ps3.setString(1, uemail);
                ResultSet rs3 = ps3.executeQuery();

                if (!rs3.next()) {
                    PreparedStatement pst = (PreparedStatement) conn.prepareStatement("SELECT id FROM user_table");
                    ResultSet rs2 = pst.executeQuery();
                    stmt = conn.createStatement();

                    while (rs2.next()) {
                        id = rs2.getInt(1);
                    }

                    //String sql="insert into table values(?,?,?,?)";
                    java.sql.PreparedStatement ps2 = conn.prepareStatement("insert into user_table values(?,?,?,?,?,?)");

                    ps2.setInt(1, id + 1);
                    ps2.setString(2, uname);
                    ps2.setString(3, pass);
                    ps2.setString(4, fname);
                    ps2.setString(5, lname);
                    ps2.setString(6, uemail);
                    int i = ps2.executeUpdate();
                    if (i > 0) {
                        /*RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                         rd.include(request, response);
                         out.print(" You are successfully registered! Now you can login!");*/
                        request.setAttribute("message", "You are successfully registered! Now you can login!");
                        request.getRequestDispatcher("/signup.jsp").forward(request, response);
                    }
                } else {
                    /*session.setAttribute("errormessage","Sorry, it looks like that email is already taken.Please choose an other one.");
                     RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
                     rd.include(request, response);*/
                    request.setAttribute("message2", "Sorry, it looks like that email is already taken.Please choose an other one.");
                    request.getRequestDispatcher("/signup.jsp").forward(request, response);
                }
            } else {
                /*RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
                 rd.include(request, response);
                 out.println(" Sorry, it looks like that username is already taken.<br>Please choose an other one.");
                 */
                request.setAttribute("message2", "Sorry, it looks like that username is already taken.Please choose an other one.");
                request.getRequestDispatcher("/signup.jsp").forward(request, response);
            }
            out.println();

        } catch (Exception ex) {
            out.println("Error ->" + ex.getMessage());
        } finally {
            out.close();
        }
        /*
         RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
         rd.include(request, response);


         try {
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(url, dbUserName, dbpassword);
         PreparedStatement pst=(PreparedStatement) conn.prepareStatement("SELECT id FROM user_table");
         ResultSet rs=pst.executeQuery();
         stmt = conn.createStatement();
            
         while(rs.next())
         {
         id=rs.getInt(1);            
         }
         //      String sql="insert into table values(?,?,?,?)";
         java.sql.PreparedStatement ps = conn.prepareStatement("insert into user_table values(?,?,?,?,?,?)");

         ps.setInt(1,id+1);
         ps.setString(2, uname);
         ps.setString(3, pass);
         ps.setString(4, fname);
         ps.setString(5, lname);
         ps.setString(6, uemail);
         int i = ps.executeUpdate();
         if (i > 0) {
         out.print("You are successfully registered...");
         }

         } catch (ClassNotFoundException e1) {
         // TODO Auto-generated catch block
         e1.printStackTrace();
         } catch (SQLException e1) {
         // TODO Auto-generated catch block
         e1.printStackTrace();
         }*/
    }
}
