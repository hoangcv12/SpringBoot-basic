<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
</head>
<body>

<div class="container" style="margin-top: 50px;">
<c:if test="${ not empty sessionScope.error }">
<script  >
            alert("${ sessionScope.error }");
        </script>
			<%--<c:remove var="error" scope="session"/> --%>
		</c:if>
            <div class="row" style="border: 1px darkgrey solid; border-radius: 10px;width: 50%; margin: 0 auto; padding: 20px;" >
       
                <div class="col-sm-12">
                <h3>Create Category</h3>
                <form action="/admin/category/save" method="post">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" name="name" placeholder="Enter name">
                    </div>
                  
                    <p style="color: red">${MESSAGE }</p>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-primary">Cancel</button>
                </form>
                </div>
            </div>
        </div>
</body>
</html>