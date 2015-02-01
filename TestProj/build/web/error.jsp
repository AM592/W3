<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<c:import url="header1.jsp">
    <c:param name="title" value="TravelPal"></c:param>
</c:import>


<div class="content">
    <div>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <div class="col-md-4 column"></div>
                    <div class="col-md-8 column">
                        <img src="images/error4.jpg" class="stretch" align="middle" />
                        <h4> You will be redirected to home page in a few seconds...</h4>
                    </div>                        
                </div>
            </div>
        </div>
    </div>
</div>

<meta http-equiv="Refresh" content="7;url=home.jsp">

<c:import url="footer.jsp"></c:import>
