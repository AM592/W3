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

import java.sql.*;
import com.mysql.jdbc.PreparedStatement;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Chris
 */
public class AddtripServlet extends HttpServlet {

    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/test_db";
    String dbUserName = "root";
    String dbpassword = "";
    Connection conn = null;
    Statement stmt = null;
    Statement stmt1 = null;
    Statement stmt2 = null;
    Statement stmt3 = null;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);

        String country = request.getParameter("country");
        String region = request.getParameter("region");
        String city = request.getParameter("city");
        String date = request.getParameter("date");
        int id = 0;
        int user_id = 0;
        int trip_id = 0;
        int ut_id = 0;

        RequestDispatcher rd = request.getRequestDispatcher("/services.jsp");
        rd.include(request, response);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, dbUserName, dbpassword);
            PreparedStatement pst = (PreparedStatement) conn.prepareStatement("SELECT id FROM trip_table");
            ResultSet rs = pst.executeQuery();            
            stmt = conn.createStatement();
            
            while (rs.next()) {
                id = rs.getInt(1);
            }
            //String sql="insert into table values(?,?,?,?)";
            java.sql.PreparedStatement ps = conn.prepareStatement("insert into trip_table values(?,?,?,?,?)");

            ps.setInt(1, id + 1);
            ps.setString(2, country);
            ps.setString(3, region);
            ps.setString(4, city);
            ps.setString(5, date);

            int i = ps.executeUpdate();
            if (i > 0) {
                request.setAttribute("message4", "Trip added successfully!");
                request.getRequestDispatcher("/services.jsp").forward(request, response);
                //out.print("Trip added successfully... <br>");
            }

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, dbUserName, dbpassword);
            Statement connect = con.createStatement();
            Statement connect2 = con.createStatement();
            
            String query = "SELECT * FROM user_trips where user_id='" + session.getAttribute("userID") + "' and trip_id = '" + id + "'";
            ResultSet  qr = connect.executeQuery(query);
            //stmt2 = conn.createStatement();
            
            if (qr.next()) {
                //RequestDispatcher rd2 = request.getRequestDispatcher("services.jsp");
                //rd2.forward(request, response);
                //out.print(" The selected trip is already been added in db. ");
                request.setAttribute("message5", "The selected trip is already been added in db");
                request.getRequestDispatcher("/services.jsp").forward(request, response);
            } 
            else {
                request.setAttribute("message5", "The selected trip is NOT added in db");
                request.getRequestDispatcher("/services.jsp").forward(request, response);
                /*Class.forName("com.mysql.jdbc.Driver");
                 conn = DriverManager.getConnection(url, dbUserName, dbpassword);
                 PreparedStatement pst3 = (PreparedStatement) conn.prepareStatement("SELECT id FROM user_table");
                 ResultSet rs3 = pst3.executeQuery();
                 stmt3 = conn.createStatement();
                 while (rs3.next()) {
                 trip_id = rs3.getInt(1);
                 }*/
                /*
                String query2 = "insert into user_trips(user_id,trip_id) values ('" + session.getAttribute("userID") + "','" + id + "')";
                request.setAttribute("message4", "The selected trip has been added successfully.");
                request.getRequestDispatcher("/services.jsp").forward(request, response);
                */
                
                /*
                 java.sql.PreparedStatement ps2 = conn.prepareStatement("insert into user_trips values(?,?,?)");
                 ps2.setInt(1, ut_id);
                 ps2.setInt(2, );
                 ps2.setInt(3, trip_id);
                 }*/
                

                /*if (i > 0) {
                 out.print("user-Trip updated successfully...");
                 }*/
            }

        } catch (ClassNotFoundException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        } catch (SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        //fill user_trips
    }
}
