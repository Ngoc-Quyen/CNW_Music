<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Đăng ký</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/AuthController" name="form" method="post">
    	Username: <input type="text" name="username"/>
		Password: <input type="password" name="password" />
    	<input type="hidden" name="action" value="register" />
    	<input type="submit" value="Login" />
	</form>
	
</body>
</html>