<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng ký tài khoản</title>
</head>
<body>
    <div class="container">
       <div class="register-form">
          <div class="main-div">

             <c:if test="${not empty message}">
                <div class="alert alert-${alert}">
                      ${message}
                </div>
             </c:if>

             <div class="container-fluid" >
                <section class="gradient-custom">
                   <div class="page-wrapper">
                      <div class="row d-flex justify-content-center align-items-center h-100">
                         <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                            <div class="card text-white" style="border-radius: 1rem; background-color: #35bf76; margin-top: 2rem; margin-bottom: 2rem;">
                               <div class="card-body p-5">
                                  <div class="mb-md-5 mt-md-4 pb-4 text-center">
                                     <h2 class="fw-bold mb-2 text-uppercase">Đăng ký</h2>
                                     <p class="text-white-50 mb-4">Vui lòng điền thông tin để tạo tài khoản!</p>

                                     <form action="<c:url value='/register'/>" id="formRegister" method="post">

                                         <div class="row">
                                            <div class="col-md-6 mb-3 text-left">
                                               <div class="form-outline form-white">
                                                  <label class="form-label" for="fullName">Họ và tên</label>
                                                  <input type="text" id="fullName" name="fullName" class="form-control" placeholder="Họ và tên" required/>
                                               </div>
                                            </div>
                                            <div class="col-md-6 mb-3 text-left">
                                               <div class="form-outline form-white">
                                                  <label class="form-label" for="phone">Số điện thoại</label>
                                                  <input type="text" id="phone" name="phone" class="form-control" placeholder="Số điện thoại" required/>
                                               </div>
                                            </div>
                                         </div>

                                         <div class="form-outline form-white mb-3 text-left">
                                            <label class="form-label" for="userName">Tên đăng nhập (Email)</label>
                                            <input type="email" id="userName" name="userName" class="form-control" placeholder="VD: an.nguyen@gmail.com" required/>
                                         </div>

                                         <div class="form-outline form-white mb-3 text-left">
                                            <label class="form-label" for="password">Mật khẩu</label>
                                            <input type="password" id="password" name="password" class="form-control" placeholder="Mật khẩu" required/>
                                         </div>

                                         <div class="form-outline form-white mb-4 text-left">
                                            <label class="form-label" for="repeatPassword">Nhập lại mật khẩu</label>
                                            <input type="password" id="repeatPassword" name="repeatPassword" class="form-control" placeholder="Nhập lại mật khẩu" required/>
                                         </div>

                                         <button type="submit" class="btn btn-outline-light btn-lg px-5">Đăng ký</button>
                                     </form>

                                     <div class="d-flex justify-content-center text-center mt-4 pt-1">
                                        <a href="#!" class="login-extension text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                                        <a href="#!" class="login-extension text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                        <a href="#!" class="login-extension text-white"><i class="fab fa-google fa-lg"></i></a>
                                     </div>
                                  </div>

                                  <div class="text-center">
                                     <p class="mb-0 tex-center account">Đã có tài khoản? <a href="<c:url value='/login'/>" class="text-white-50 fw-bold">Đăng nhập ngay</a></p>
                                  </div>

                               </div>
                            </div>
                         </div>
                      </div>
                   </div>
                </section>
             </div>
          </div>
       </div>
    </div>
</body>
</html>