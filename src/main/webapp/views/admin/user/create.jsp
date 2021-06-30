<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

        <div class="container" style="margin-top: 10px; margin-bottom:30px ">
            <div class="row" style="border: 1px darkgrey solid; border-radius: 10px;width: 50%; margin: 0 auto; padding: 20px;" >
                <div class="col-sm-12">
                    <h2>Create User</h2>
                    <form action="/admin/users/save"  method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>UserName</label>
                            <input type="text" class="form-control" name="username"  placeholder="Enter UserName"/>
                            
                        </div>
                        <div class="form-group">
                            <label>Password:</label>
                            <input type="password" class="form-control" name="password"  placeholder="Enter password"/>
                            
                        </div>
                       
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" class="form-control" name="email"  placeholder="Enter email"/>
                        </div>
						<div class="form-group">
                            <label>Photo</label>
                            <input type="file" class="form-control" name="imageFile" >
                        </div>
                       <div class="form-group">
				<label for="admin">Role</label>
				<select name="admin" id="admin" class="form-control" required>
					<option selected disabled>Choose</option>
					<option value="0">User</option>
					<option value="1">Admin</option>
				</select>
			    <small id="role_error" class="form-text text-danger"></small>
			</div>
                        <div class="form-group">
				<label for="activated">Status</label>
				<select name="activated" id="activated" class="form-control" required>
					<option selected disabled>Choose</option>
					<option value="1">Active</option>
					<option value="0">Inactive</option>
				</select>
			    <small id="status_error" class="form-text text-danger"></small>
			</div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="reset" class="btn btn-primary">Cancel</button>
                        <a href="/admin/users/views" class="btn btn-primary">Display User</a>
                    </form>
                </div>
            </div>
        </div>
   

