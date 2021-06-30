<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container mb-5">
		
		<div class="rows mt-5 col-10 offset-2">
			<div class="col-sm-9">
				<table class="table table-bordered">
					<thead>
						<tr>
						<th></th>
						<th>Photo</th>
							<th>Name</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Amount</th>
							<th></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="item" items="${PRO_ITEMS}">
							<form action="/user/category_detail/update/${item.id}" method="post">
								<input type="hidden" name="id" value="${item.id}" />
							<tr>
							<td><input type="checkbox"  id="exampleCheck1"></td>
							
							<td align="center"><img src="/storage/${item.product.image } " width="100" height="100"/></td>
							
								<td>${item.product.name }</td>
								<td>${item.price}</td>
								<td><input name="qty" value="${item.quantity}"
									onblur="this.form.submit()" style="width: 50px;"></td>
								<td>${item.price*item.quantity}</td>
								<td><a class="btn btn-primary btn-sm"
									href="/user/category_detail/delete/${item.id }">Remove</a></td>
							</tr>
							</form>
						</c:forEach>


					</tbody>
				</table>
				<p>Tong Tien: ${TONG}</p>
				<hr />
				<a class="btn btn-primary btn-sm" href="/user/category_detail/clear">Clear
					</a> <a class="btn btn-primary btn-sm" href="/products">Add
					more</a>
					</a> <a class="btn btn-primary btn-sm" href="">Order</a>
			</div>
		</div>

	</div>
</body>
</html>