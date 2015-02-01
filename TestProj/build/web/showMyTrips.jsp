<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.*" %>

<c:import url="header2.jsp">
    <c:param name="title" value="TravelPal"></c:param>
</c:import>

<%
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = null;
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_db", "root", "");
    
    
    String MainSelectQuery = "SELECT " +
                            "trip_table.id,trip_table.country,trip_table.city,trip_table.region,trip_table.dateFrom,trip_table.dateTo,trip_table.hostId,user_trips.Id,user_trips.UserId,user_trips.TripId " +
                            "FROM " +
                            "trip_table " +
                            "LEFT OUTER JOIN user_trips ON trip_table.id = user_trips.TripId  " +
                            "WHERE " +
                            "user_trips.UserId = " + session.getAttribute("userID") + " OR trip_table.hostId = " + session.getAttribute("userID");
    
%>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-2 column">
                </div>
                <div class="col-md-8 column">
                    <br>
                    <h2>Here you can see all your trips</h2>
                    <p></p>                                               
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Country</th>
                                <th>City</th>
                                <th>Region</th>
                                <th>From Date</th>
                                <th>To Date</th> 
                                <th>Host ID</th>
                                <!--<th>ID</th>
                                <th>User ID</th>
                                <th>Trip ID</th>-->                          
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                PreparedStatement pst = (PreparedStatement) conn.prepareStatement(MainSelectQuery);
                                ResultSet r = pst.executeQuery();
                                while (r.next()) {
                                    out.print("<tr>");
                                    out.print("<td>" + r.getString("trip_table.country") + "</td>");
                                    out.print("<td>" + r.getString("trip_table.city") + "</td>");
                                    out.print("<td>" + r.getString("trip_table.region") + "</td>");
                                    out.print("<td>" + r.getString("trip_table.dateFrom") + "</td>");
                                    out.print("<td>" + r.getString("trip_table.dateTo") + "</td>");
                                    out.print("<td>" + r.getString("trip_table.hostId") + "</td>");
                                    //out.print("<td>" + r.getString("user_trips.Id") + "</td>");
                                    //out.print("<td>" + r.getString("user_trips.UserId") + "</td>");
                                    //out.print("<td>" + r.getString("user_trips.Id") + "</td>");
                                    out.print("</tr>");
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-2 column">
                </div>
            </div>
        </div>
    </div>
</div>



<c:import url="footer.jsp"></c:import>