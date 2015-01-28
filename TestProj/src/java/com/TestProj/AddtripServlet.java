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
    Connection conn2 = null;
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
        String dateFrom = request.getParameter("dateFrom");
        String dateTo = request.getParameter("dateTo");
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
            java.sql.PreparedStatement ps = conn.prepareStatement("insert into trip_table ( country, city, region, dateFrom, dateTo, hostId) values(?,?,?,?,?,?)");

            
            ps.setString(1, country);
            ps.setString(2, city);
            ps.setString(3, region);
            ps.setString(4, dateFrom);
            ps.setString(5, dateTo);
            //userid
            int userId = Integer.parseInt(session.getAttribute("userID").toString());
            ps.setInt(6, userId);

            
            int i = ps.executeUpdate();
            if (i > 0) {
                request.setAttribute("message4", "Trip added successfully!");
                request.getRequestDispatcher("/services.jsp").forward(request, response);
                //out.print("Trip added successfully... <br>");
            }
            
            Class.forName("com.mysql.jdbc.Driver");
            conn2 = DriverManager.getConnection(url, dbUserName, dbpassword);
            PreparedStatement pst2 = (PreparedStatement) conn2.prepareStatement ("SELECT (trip_table.id, trip_table.country, trip_table.city,trip_table.region,trip_table.dateFrom, trip_table.dateTo,trip_table.dateTo,trip_table.hostId,user_trips.Id,user_trips.UserId,user_trips.TripId) from trip_table LEFT OUTER JOIN user_trips ON trip_table.id = user_trips.TripId where user_trips.UserId='" + session.getAttribute("userID") + "' or trip_table.hostId = '" + session.getAttribute("userID") + "'");

            ResultSet rs2= pst2.executeQuery();            
            stmt = conn.createStatement();
            
            
            
            
  
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
