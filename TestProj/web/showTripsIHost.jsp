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
%>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-2 column">
                </div>
                <div class="col-md-8 column">
                    <br>
                    <h2>Here you can see all the trips you host.</h2>
                    <p></p>                                               
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Country</th>
                                <th>City</th>
                                <th>Region</th>
                                <th>From Date</th>
                                <th>To Date</th>                                
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Statement stm = conn.createStatement();
                                String strQuery = "select * from trip_table where trip_table.hostID='" + session.getAttribute("userID") + "'";
                                ResultSet r = stm.executeQuery(strQuery);
                                while (r.next()) {
                                    out.print("<tr>");
                                    out.print("<td>" + r.getString("country") + "</td>");
                                    out.print("<td>" + r.getString("city") + "</td>");
                                    out.print("<td>" + r.getString("region") + "</td>");
                                    out.print("<td>" + r.getString("dateFrom") + "</td>");
                                    out.print("<td>" + r.getString("dateTo") + "</td>");
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