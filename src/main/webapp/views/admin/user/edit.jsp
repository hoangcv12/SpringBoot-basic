<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>

	
<div class="row mb-5" style="border: 1px darkgrey solid; border-radius: 10px; width: 60%; margin: 0 auto; padding: 10px;" >
	
	<div class="mt-5 col-10 offset-1">
	<div class="row">
	<div class="col-5">
	<h2>Edit User</h2>
	</div>
	<div class="col-5">
	<img width="150" height="200" src="/storage/${user.photo }" style="margin-left: 130px  " name="photo"/>
	</div>
	</div>
		<form:form
			modelAttribute="user"
			method="POST"
			action="/admin/users/update/${user.id }"
			
			>
			<input type="hidden" name="_method" value="put" />
			
			<div class="form-group mt-3">
				<label for="username">Username</label>
			    <form:input path="username" class="form-control" id="username" name="username" autocomplete="off"/>
			   <form:errors path="username" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="email">Email</label>
			    <form:input path="email" class="form-control" id="email" name="email" autocomplete="off"/>
			    <form:errors path="email" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<label for="password">Password</label>
			    <form:password  path="password" value="${user.password }" class="form-control"  name="password" readonly="true"/>
			 <form:errors path="password" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group">
                            <label>Photo</label>
                            <input type="file" class="form-control" name="imageFile" >
                        </div>
			<div class="form-group mt-3">
				<label for="admin">Tài khoản</label>
				<form:select path="admin"  id="admin" class="form-control" >
				
					<form:option value="1" >Admin</form:option>
					<form:option value="0" >User</form:option>
				</form:select>
			    <form:errors path="admin" element="span" cssClass="text-danger" />
			</div>
			
			<div class="form-group mt-3">
				<label for="status">Status</label>
				<form:select path="activated" id="status" class="form-control" >
					
					<form:option value="1" >Đang hoạt động</form:option>
					<form:option value="0" >Vô hiệu hóa</form:option>
				</form:select>
			    <form:errors path="activated" element="span" cssClass="text-danger" />
			</div>
			<div class="form-group mt-3">
				<button class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Clear</button>
			</div>
		</form:form>
	</div>
</div>