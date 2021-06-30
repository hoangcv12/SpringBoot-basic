<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <div class="container" style="margin-top: 10px;">
            <div class="row" style="border: 1px darkgrey solid; border-radius: 10px;width: 50%; margin: 0 auto; padding: 20px;" >
                <div class="col-sm-12">
                    <h2>Create Product</h2>
                    <form:form action="/admin/products/SaveOrUpdate" modelAttribute="PRODUCT" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Name</label>
                            <form:input type="text" class="form-control" path="name"  placeholder="Enter name"/>
                            
                        </div>
                        
                       
                        <div class="form-group">
                            <label>Price</label>
                            <form:input type="text" class="form-control" path="price"  placeholder="Enter price"/>
                        </div>
						<div class="form-group">
                            <label>Avilable</label>
                            <form:input type="number" class="form-control" path="avilable"  placeholder="Enter avilable"/>
                        </div>
                        <label for="category">Category</label>
                        
				<form:select path="category" class="form-control" >
					<c:forEach items="${category }" var="cate">
					<form:option value="${cate.id }">${cate.name }</form:option>
					</c:forEach>
				</form:select>
                        <div class="form-group">
                            <label>Image</label>
                            <input type="file" class="form-control" name="imageFile"  />
                        </div>
                        <div class="form-group">
                            <label>Create date</label>
                            <input type="date" class="form-control" name="create_date" >
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="reset" class="btn btn-primary">Cancel</button>
                        <a href="/admin/products/views" class="btn btn-primary">Display Product</a>
                    </form:form>
                </div>
            </div>
        </div>


