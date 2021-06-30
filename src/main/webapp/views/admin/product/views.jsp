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
		<a href="/admin/products/create" class="btn btn-primary">Add
			Product</a>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Photo</th>
					<th>Id</th>
					<th>Name</th>
					<th>Price</th>
					<th>Avilable</th>
					<th>Create date</th>
					<th>Category</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>		
			<c:forEach items="${Product}" var="pr">
				<tr>
					<td align="center"><img src="/storage/${pr.image } " width="100" height="100"/></td>
					<td>${pr.id }</td>
					<td>${pr.name }</td>
					<td>${pr.price }</td>
					<td>${pr.avilable }</td>
					<td>${pr.createDate }</td>
					<td>${pr.category.name }</td>
					<td><a class="btn btn-primary btn-sm" href="/admin/products/edit/${pr.id }">Edit</a>
						 <a class="btn btn-danger btn-sm" href="/admin/products/delete/${pr.id }" onClick="if (confirm('Are you sure you want to delete?')) { this.form.action='/Config?pg=FIBiller&amp;cmd=delete'; } else { return false; }">                 <span class="ss_sprite ss_delete"><fmt:message key="fiBiller.button-delete" bundle="${configRc}"/></span>Delete</a></td>
				</tr>
			</c:forEach>
				
				
			</tbody>
		</table>
	</div>
</body>
</html>