<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	.header{
		width: 100%;
		display: flex;
		justify-content: flex-end;
		align-items: center;
		max-height: 40px;
		gap: 10px;
	}
	.user-image{
		width: 30px;
		height: 30px;
		border-radius: 100%;
	}
	.user-name{
		font-size: 14px;
		font-weight: 600;
	}
</style>
</head>
<body>
	<div class="header">
		<img class="user-image" src="<%= request.getContextPath() %>/static/img/UserProfile.png" >
		<p class="user-name">Will</p>
		<img class="drop-down" src="<%= request.getContextPath() %>/static/icon/dropdown.svg" >
	</div>
</body>
</html>