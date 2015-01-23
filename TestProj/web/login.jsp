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
                        <div class="wrapper">
                            <form class="form-signin" name="loginform" action="LoginServlet" method="POST">       
                                <h2 class="form-signin-heading">Please login</h2>
                                <input type="text" class="form-control" name="username" placeholder="Username" required="" autofocus="" />
                                <input type="password" class="form-control" name="password" placeholder="Password" required=""/>      
                                <br>
                                <button class="btn btn-primary btn-lg" type="submit">Login</button>  
                                <br/>New User? <a href="signup.jsp">Register now</a>
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
