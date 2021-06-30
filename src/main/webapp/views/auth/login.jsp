<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/css/login.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

</head>
<body>


 
			
     <div class="container">
     
	<div class="d-flex justify-content-center h-100">

		<div class="card">
		<c:if test="${ not empty sessionScope.error }">
			<div class="alert alert-danger">${ sessionScope.error }</div>
			<c:remove var="error" scope="session"/>
		</c:if>
			<div class="card-header">
				<h3>Sign In</h3>
				
			</div>
			<form action="/login" method="post">
			<div class="card-body">
				<form>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="email" placeholder="username">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" name="password" placeholder="password">
					</div>
					
					<div class="row align-items-center remember">
						<input type="checkbox">Remember Me
					</div>
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			</form>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a href="#">Sign Up</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">Forgot your password?</a>
				</div>
			</div>
		</div>
	</div>
</div>
               <!--   <div class="col-sm-4" style="border: 1px darkgrey solid; border-radius: 10px; margin: 0 auto; padding: 20px;">
                <h3>Login</h3>
                <form action="/login" method="post">
                    <div class="form-group">
                        <label for="email"></label>
                        <input type="text" class="form-control" name="email" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label></label>
                        <input type="password" class="form-control" name="password" placeholder="Enter password">
                    </div>
                    <div class="checkbox">
                        <label><input type="checkbox" name="chkRemember"> Remember me</label>
                    </div>
                    <p style="color: red">${MESSAGE }</p>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-info">Cancel</button>
                    <p style="margin: 10px; font-size: 16px;"><a href="">Register</a></p>
                </form>
                </div>
            </div> -->
     
</body>
</html>