<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
</head>
<body>
    <div class="auth-wrapper" style="max-width: 520px;">
        <div class="auth-card">
            <div class="auth-header">
                <h2>Create an Account</h2>
                <p>Fill in the details below to get started</p>
            </div>

            <c:if test="${not empty message}">
                <div class="alert alert-${alert}">
                    ${message}
                </div>
            </c:if>

            <form action="<c:url value='/register'/>" id="formRegister" method="post">
                <div class="flex-row">
                    <div class="form-group">
                        <label for="fullName">Họ và tên</label>
                        <input type="text" id="fullName" name="fullName" class="form-control" placeholder="Họ và tên" required/>
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="text" id="phone" name="phone" class="form-control" placeholder="Số điện thoại" required/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="userName">Tên đăng nhập (Email)</label>
                    <input type="email" id="userName" name="userName" class="form-control" placeholder="VD: an.nguyen@gmail.com" required/>
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Mật khẩu" required/>
                </div>

                <div class="form-group">
                    <label for="repeatPassword">Nhập lại mật khẩu</label>
                    <input type="password" id="repeatPassword" name="repeatPassword" class="form-control" placeholder="Nhập lại mật khẩu" required/>
                </div>

                <button type="submit" class="btn-primary">Đăng ký</button>
            </form>

            <div class="auth-footer">
                Đã có tài khoản? <a href="<c:url value='/login'/>">Đăng nhập ngay</a>
            </div>
        </div>
    </div>
</body>
</html>
