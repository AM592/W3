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

                    <div class="alert alert-danger" role="alert">We are sorry. Either your username or password are incorrect.
                        <br>
                        <p>Please try again.</p>
                    </div> 
                    <br>
                    <a href="login.jsp" class="btn btn-primary btn-lg" role="button">Try again</a>
                </div>
                <div class="col-md-2 column">
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="footer.jsp"></c:import>
