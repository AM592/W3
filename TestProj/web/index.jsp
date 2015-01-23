<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:import url="header1.jsp">
    <c:param name="title" value="TravelPal"></c:param>
</c:import>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-2 column">
                </div>
                <div class="col-md-8 column">
                    <h1 align="center">TravelPal</h1>
                    <h2>Don't travel again alone!Find someone to travel with, share experiences and expenses and make him your TravelPal.</h2>
                    <p>Welcome to TravelPal! Here you can find a fellow traveler to acompany you to your next trip!</p>
                    <a href="signup.jsp" class="btn btn-primary btn-lg" role="button">Sign up Now</a>
                </div>
                <div class="col-md-2 column">
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="footer.jsp"></c:import>