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
                        <form class="form-signin" method="post" action="Register"> 
                            <c:if test="${message != null}">
                            <div class="alert alert-success alert-dismissible" role="alert">${message}</div> 
                            </c:if>
                            <c:if test="${message2 != null}">
                            <div class="alert alert-warning alert-dismissible" role="alert">${message2}</div> 
                            </c:if>
                            <h2 class="form-signin-heading">Create an Account</h2>
                            <p>Please enter the following information:</p>
                            <label>Desired Username
                                <input type="text" class="form-control" name="username" id="username" placeholder="Username" required="" autofocus="" />
                            </label>
                            <label>Your First Name
                                <input type="text" class="form-control" name="firstname" id="firstname" placeholder="First Name" required="" autofocus="" />
                            </label>
                            <label>Your Last Name
                                <input type="text" class="form-control" name="lastname" id="lastname" placeholder="Last Name" required="" autofocus="" />
                            </label>
                            <label>Your email
                                <input type="text" class="form-control" name="email" id="email" placeholder="Ex: eric20@gmail.com" required="" autofocus="" />
                            </label>
                            <label>Your Password
                                <input type="password" class="form-control" name="password" placeholder="Pass" required=""/>      
                            </label><br>
                            <button class="btn btn-primary btn-lg" type="submit" value="Register">Sign Up</button>  
                            <br/>Already have an account? <a href="login.jsp">Login</a>
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
