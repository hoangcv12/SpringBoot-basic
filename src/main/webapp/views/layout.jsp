<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Fpoly phone</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  .fakeimg {
    height: 300px;
    background: rgb(216, 18, 18);
  }
  .hinh{
    border-radius:  6px;
  }
  .mh{
    margin: 0 auto;
  }
  </style>
</head>
<body>

<div class="text-center" style="background-color: rgb(255, 201, 71);">
  
  <img 	src="https://cdn.cellphones.com.vn/media/wysiwyg/new-HP_DESKTOP_COVID.png" class="img-fluid" alt="Responsive image" />
 </div> 

 <nav class="navbar navbar-expand-lg navbar-light mb-3" style="background-color: #e3f2fd;  ">
     <div class="container">
  <a class="navbar-brand" href="/home" style=" color: rgb(238, 75, 10); ">Fpoly Phone</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      
      <li class="nav-item">
        <a class="nav-link" href="#"></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/products">Sản phẩm</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         <i class="fa fa-list"></i>Danh mục
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/admin/users/views">Quản lý người dùng</a>
          <a class="dropdown-item" href="/admin/products/views">Quản lý sản phẩm</a>
          <a class="dropdown-item" href="/admin/category/views">Quản lý thể loại</a>
          <a class="dropdown-item" href="/user/category_detail/views">Giỏ hàng</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="/login">Login</a>
          <a class="dropdown-item" href="#">Logout</a>
        </div>
      </li>
     
    </ul>
    <form class="form-inline my-2 my-lg-0" >
      <input class="form-control mr-sm-2" type="search" placeholder="Tìm kiếm" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
    </form>
  </div>
</div>
</nav>
<div class="container">
   
    <jsp:include page="${view }"></jsp:include>
     
  
  
      </div>
      
      <div class="row border-top " style="background-color: rgb(226, 224, 220);">
        <div class="col text-center font-weight-ligh" style="font-size: 12px ">
          <p>Công Ty Cổ Phần Thương Mại Điện Tử Hoàng Phát - Địa chỉ: Tầng 5, số 49 Phố Thái Hà, Phường Trung Liệt, Quận Đống Đa, Thành Phố Hà Nội, Việt Nam.
            Giấy CN đăng ký kinh doanh và mã số thuế: 0108940873 do sở Kế hoạch & Đầu tư thành phố Hà Nội cấp</p>
      </div>
    
  </div>

</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
crossorigin="anonymous"></script>
</html>
