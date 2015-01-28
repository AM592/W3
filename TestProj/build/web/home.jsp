<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:import url="header2.jsp">
    <c:param name="title" value="TravelPal"></c:param>
</c:import>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-2 column">
                </div>
                <div class="col-md-8 column">

                    <div class="alert alert-success" role="alert">You logged in successfully.</div>
                    <br>
                    <p>Welcome to TravelPal! Here you can find a fellow traveler to acompany you to your next trip!</p>
                    <br>
                    <p>Now you can pick one our services.</p>                                        
                    <a href="services.jsp" class="btn btn-primary btn-lg" role="button">Let's go</a>
                </div>
                <div class="col-md-2 column">
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="footer.jsp"></c:import>