<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/bootstrap.min.css" ></link>
</head>
<body>
<div class="container">
		<h2>List Category</h2>
		<a href="/admin/users/create" class="btn btn-primary mb-1">Add
			Category</a>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Id Category</th>
					<th>Name</th>
					<th>Manipulation
</th>
				</tr>
			</thead>
			<tbody>		
			<c:forEach items="${ CATEGORY }" var="u">
				<tr>
					
					<td>${u.id }</td>
					<td>${u.name }</td>
					<td><a class="btn btn-primary btn-sm" href="/admin/users/edit/${u.id  }">Edit</a>
						 <a class="btn btn-danger btn-sm" href="/admin/users/delete/${u.id }" onClick="if (confirm('Bạn có chắc chắn muốn xóa?')) { this.form.action='/Config?pg=FIBiller&amp;cmd=delete'; } else { return false; }">                 <span class="ss_sprite ss_delete"><fmt:message key="fiBiller.button-delete" bundle="${configRc}"/></span>Delete</a></td>
				</tr>
			</c:forEach>
				
				
			</tbody>
		</table>
	</div>
</body>
</html>