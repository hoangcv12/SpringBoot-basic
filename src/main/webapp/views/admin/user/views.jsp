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
<div class="container mb-5">
		<div class="col-10 offset-1 mt-5 border border-primary p-2">
		<form method="GET" action="${ pageContext.request.contextPath }/admin/users/views">
			<div class="row col-12 mt-2">
				<div class="col-6">
					<label>Sắp xếp theo</label>
					<select name="sort_by" class="form-control">
						<option value="id">Mặc định</option>
						<option value="username" >
							Họ Tên
						</option>
						<option value="email">Email</option>
						<option value="admin">Tài khoản</option>
						<option value="activated">Trạng thái</option>
					</select>
				</div>
				<div class="col-6">
					<label>Thứ tự</label>
					<select name="sort_direction" class="form-control">
						<option value="asc">Tăng dần</option>
						<option value="desc">Giảm dần</option>
					</select>
				</div>
			</div>
			
			<div>
				<button class="btn btn-primary mt-4">Lọc</button>
				<a href="${ pageContext.request.contextPath }/admin/users"
					class="btn btn-danger mt-4" type="reset">
					Reset
				</a>
			</div>
		</form>
	</div>
	<div class="col-10 offset-1 mt-5 border border-primary p-2">
		<a href="/admin/users/create" class="btn btn-primary mb-1">Add
			Users</a>
		<table class="table table-strip table-dark mt-3">
			<thead>
				<tr>
					<th>Photo</th>
					<th>Id</th>
					<th>UserName</th>
					<th>Email</th>					
					<th>Activated</th>
					<th>Admin</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>		
			<c:forEach items="${ pageData.content  }" var="u">
				<tr>
					<td align="center"><img src="/storage/${u.photo }" width="40" height="40"/></td>
					<td>${u.id }</td>
					<td>${u.username }</td>
					<td>${u.email }</td>
					<td>${u.activated ==1 ? "Đang hoạt động" : "Vô hiệu hóa"}</td>
					<td>${u.admin ==1 ? "Admin" : "User" }</td>
					<td><a class="btn btn-primary btn-sm" href="/admin/users/edit/${u.id  }">Edit</a>
						 <a class="btn btn-danger btn-sm" href="/admin/users/delete/${u.id }" onClick="if (confirm('Bạn có chắc chắn muốn xóa?')) { this.form.action='/Config?pg=FIBiller&amp;cmd=delete'; } else { return false; }">                 <span class="ss_sprite ss_delete"><fmt:message key="fiBiller.button-delete" bundle="${configRc}"/></span>Delete</a></td>
				</tr>
			</c:forEach>
				
				
			</tbody>
		</table>
		<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link"
							href="/admin/users/views?page=0">Fist</a></li>
						<li class="page-item"><a class="page-link"
							href="/admin/users/views?page=${pageData.number-1}">Previous</a></li>
						<li class="page-item"><a class="page-link"
							href="/admin/users/views?page=${pageData.number+1}">Next</a></li>
						<li class="page-item"><a class="page-link"
							href="/admin/users/views?page=${pageData. totalPages-1}">Last</a></li>
					</ul>
				</nav>
		<!--  <div>
			<ul class="pagination">
				<c:forEach begin="0" end="${ pageData.totalPages - 1 }" varStatus="page">
					<li class="page-item">
						<a class="page-link">${ page.index + 1 }</a>
					</li>
				</c:forEach>
			</ul>
		</div> -->
	</div>
	</div>
	
				<script src="${ pageContext.request.contextPath }/js/hello.js"></script>
</body>
</html>