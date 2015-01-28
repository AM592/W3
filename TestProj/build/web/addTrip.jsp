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
                    <div class="wrapper">
                        <form class="form-signin" method="post" action="AddtripServlet">  
                            <c:if test="${message4 != null}">
                            <div class="alert alert-success alert-dismissible" role="alert">${message4}</div> 
                            </c:if>
                            <c:if test="${message5 != null}">
                            <div class="alert alert-success alert-dismissible" role="alert">${message4}</div> 
                            </c:if>
                            <h2 class="form-signin-heading">Add your trip</h2>
                            <p>Please enter the following information:</p>
                            <label>Country
                                <input type="text" class="form-control" name="country" id="country" placeholder="Ex: Usa" required="" autofocus="" />
                            </label>
                            <label>Region
                                <input type="text" class="form-control" name="region" id="region" placeholder="Ex: Florida" required="" autofocus="" />
                            </label>
                            <label>City
                                <input type="text" class="form-control" name="city" id="city" placeholder="Ex: Miami" required="" autofocus="" />
                            </label>
                            <label>From Date
                                <input type="text" class="form-control" name="dateFrom" id="dateFrom" placeholder="Ex: 2015-01-10" required="" autofocus="" />
                            </label>
                            <label>To Date
                                <input type="text" class="form-control" name="dateTo" id="dateTo" placeholder="Ex: 2015-01-15" required="" autofocus="" />
                            </label>
                            <br>
                            <button class="btn btn-primary btn-lg" type="submit" value="AddtripServlet">Add</button>                            
                        </form>
                    </div>
                </div>
                <div class="col-md-2 column">
                </div>
            </div>
        </div>
    </div>
</div>



<c:import url="footer.jsp"></c:import>