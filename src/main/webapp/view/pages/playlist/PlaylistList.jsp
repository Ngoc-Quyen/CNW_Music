<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.bean.Playlist" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Playlist Container</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/global.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/playlist_item.css">
    
    <!-- Define the redirectToPage function outside of $(document).ready -->
    <script>
        function redirectToPage(playlistItemId) {
            // Use playlistItemId to pass data to the new page, e.g., in the URL or through a form
            window.location.href = '<%=request.getContextPath()%>/view/pages/music/MusicList.jsp?playlistItemId=' + playlistItemId;
        }
    </script>
    <style>
    	body{
	    	background-color: black;
			display: flex;   
			gap: 20px; 	
			padding: 20px;
			margin: 0;
			min-height: 95vh;
    	}
    	.content{
    		background-color: #141414;
    		border-radius: 20px;
    		padding: 20px;
    		width: 100%;
    		min-height: 80%;
    	}
    	.title{
    		font-weight: 600;
    		font-size: 20px;
    	}
    </style>
</head>
<body>
	<jsp:include page="../../components/TabLeft.jsp" />
	<div class="content">
		<jsp:include page="../../components/Header.jsp" />
	    <p class="title">Dành cho bạn</p>
	    <div class="playlist-container">
	    </div>	
	</div>
    <script>
    $(document).ready(function() {
        // Use AJAX to call the PlaylistController servlet when the page loads
        $.ajax({
            url: '../../../PlaylistController',
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                console.log(data);

                // Create a string to hold the HTML content
                var htmlString = '';

                // Assuming data is an array of playlist items
                // Modify this part based on your JSON structure
                for (var i = 0; i < data.length; i++) {
                    var playlistItem = data[i];

                    // Concatenate HTML content for each playlist item
                    htmlString += '<div class="container" onclick="redirectToPage(\'' + playlistItem.id + '\')">';
                    htmlString += '<img src="${pageContext.request.contextPath}/static/img/DefaultPlaylist.jpg" class="thumbnail"/>';
                    htmlString += '<p class="name">' + playlistItem.name + '</p>';
                    htmlString += '</div>';
                }

                // Append the final HTML string to the playlistContainer
                $('.playlist-container').append(htmlString);
            },
            error: function() {
                console.error('Error calling PlaylistController');
            }
        });
    });
    </script>
</body>
</html>
