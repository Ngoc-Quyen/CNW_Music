<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.bean.Playlist" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/music_item.css">
</head>
<body>
	<div>
		<div class="container">
			<p class="id">1</p>
			<img src="${pageContext.request.contextPath}/static/img/DefaultPlaylist.jpg" class="thumbnail"/>
		    <div class="info">
			    <p class="name">Name for default</p>
				<p class="artist-name">Artist</p>		    
		    </div>
		    <p class="genre">Genre</p>
		    <p class="time">4:16</p>
		</div>
	    <!-- Add other properties as needed -->
	</div>
	<script>
		
	</script>
</body>
</html>
