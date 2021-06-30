<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">

		<div class="rows">

			<div class="col-10 offset-1 mt-5  p-2">
				 <div class="float-right mb-1">
					<div class="dropdown">
						<button class="btn btn-secondary dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">SẮP XẾP</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="views?flied=id">sắp xếp theo giá tăng dần
								</a> <a class="dropdown-item" href="views?flied=price">sắp xếp
								theo giá giảm dần</a>
						</div>
					</div>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Photo</th>
							<th>Name</th>
							<th>Price</th>
							<th>Category</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listProduct.content }" var="p">
							<tr>
							
								<td align="center" width="120"><img
									src="/storage/${p.image } "
									width="100" height="100" /></td>
								<td>${p.name }</td>
								
								<td>${p.price }</td>
								<th>${p.category.name }</th>
								<td><a class="btn btn-primary btn-sm"
									href="/user/category_detail/add/${p.id}">By Now</a></td>
							</tr>
						</c:forEach>



					</tbody>
				</table>
				  <nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link"
							href="/products?p=0">Fist</a></li>
						<li class="page-item"><a class="page-link"
							href="/products?p=${listProduct.number-1}">Previous</a></li>
						<li class="page-item"><a class="page-link"
							href="/products?p=${listProduct.number+1}">Next</a></li>
						<li class="page-item"><a class="page-link"
							href="/products?p=${listProduct.totalPages-1}">Last</a></li>
					</ul>
				</nav>
				
				<!--  <ul>
					<li>Số thực thể hiện tại: ${listProduct.numberOfElements}</li>
					<li>Trang số: ${listProduct.number}</li>
					<li>Kích thước trang: ${listProduct.size}</li>
					<li>Tổng số thực thể: ${listProduct.totalElements}</li>
					<li>Tổng số trang: ${listProduct.totalPages}</li>
				</ul> -->
			</div>
		</div>

	</div>
</body>
</html>