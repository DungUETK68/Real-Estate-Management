<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
    <div class="auth-wrapper">
        <div class="auth-card">
            <div class="auth-header">
                <h2>Welcome Back</h2>
                <p>Please enter your details to sign in</p>
            </div>
            
            <c:if test="${param.incorrectAccount != null}">
                <div class="alert alert-danger">Username or password incorrect</div>
            </c:if>
            <c:if test="${param.accessDenied != null}">
                <div class="alert alert-danger">You are not authorized</div>
            </c:if>
            <c:if test="${param.sessionTimeout != null}">
                <div class="alert alert-danger">Session Timeout</div>
            </c:if>

            <form action="j_spring_security_check" id="formLogin" method="post">
                <div class="form-group">
                    <label for="userName">Email</label>
                    <input type="text" class="form-control" id="userName" name="j_username" placeholder="Tên đăng nhập" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="j_password" placeholder="Mật khẩu" required>
                </div>

                <div class="checkbox-wrapper">
                    <label>
                        <input type="checkbox" id="rememberMe"> Remember me
                    </label>
                    <a href="#!" style="color: #10b981; text-decoration: none; font-weight: 600;">Forgot password?</a>
                </div>

                <button type="submit" class="btn-primary">Đăng nhập</button>
            </form>

            <div class="auth-footer">
                Don't have an account? <a href="<c:url value='/register'/>">Sign Up</a>
            </div>
        </div>
    </div>
</body>
</html>
