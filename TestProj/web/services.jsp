<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:import url="header2.jsp">
    <c:param name="title" value="TravelPal"></c:param>
</c:import>

<%
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-2 column">
                </div>
                <div class="col-md-8 column">
                    <br>
                    <h2>Select one of our services</h2>
                    <br><br>
                    <a href="profile.jsp" class="btn btn-primary btn-lg" role="button">Edit your profile</a> 
                    <br><br>
                    <a href="addTrip.jsp" class="btn btn-primary btn-lg" role="button">Add new trip</a>
                    <br><br>                    
                    <a href="showTripsIHost.jsp" class="btn btn-primary btn-lg" role="button">See all trips you are host</a>
                    <br><br>
                    <a href="showMyTrips.jsp" class="btn btn-primary btn-lg" role="button">See all your trips</a>
                </div>
                <div class="col-md-2 column">
                </div>
            </div>
        </div>
    </div>
</div>



<c:import url="footer.jsp"></c:import>