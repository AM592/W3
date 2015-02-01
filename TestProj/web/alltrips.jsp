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
                    "trip_table.id, " +
                    "trip_table.country, " +
                    "trip_table.city, " +
                    "trip_table.region, " +
                    "trip_table.dateFrom, " +
                    "trip_table.dateTo, " + 
                    "trip_table.hostId, " +
                    "CONCAT(user_table.lastName, ' ', user_table.firstName) as fullname " +
                    "FROM " +
                    "trip_table " +
                    "INNER JOIN user_table ON trip_table.hostId = user_table.id";
    
    
%>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-2 column">
                </div>
                <div class="col-md-8 column">
                    <br>
                    <h2>Here you can see all trips available</h2>
                    <p>(Click the id to attend it)</p>                                               
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>User</th>
                                <th>Country</th>
                                <th>City</th>
                                <th>Region</th>
                                <th>From Date</th>
                                <th>To Date</th>                          
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                PreparedStatement pst = (PreparedStatement) conn.prepareStatement(MainSelectQuery);
                                ResultSet r = pst.executeQuery();
                                while (r.next()) {
                                    out.print("<tr>");
                                    out.print("<td><a href='jointrip.jsp?tripid=" + r.getString("trip_table.id") + "&userid=" + session.getAttribute("userID") + "'>" + r.getString("trip_table.id") + "</a></td>");
                                    out.print("<td>" + r.getString("fullname") + "</td>");
                                    out.print("<td>" + r.getString("trip_table.country") + "</td>");
                                    out.print("<td>" + r.getString("trip_table.city") + "</td>");
                                    out.print("<td>" + r.getString("trip_table.region") + "</td>");
                                    out.print("<td>" + r.getString("trip_table.dateFrom") + "</td>");
                                    out.print("<td>" + r.getString("trip_table.dateTo") + "</td>");
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