<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/playlist_item.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/global.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/layout.css">
	<style>
		.background{
			width: 100%;
			height: 400px;
			position: absolute;
			left: 0px;
		}
		.background-overlay{
			width: 100%;
			height: 400px;
			position: absolute;
			left: 0px;
			background-color: rgba(32, 32, 32, 0.7);
		}
		.playlist-container{
			display: flex;
			flex-wrap: wrap;
		}
		.main-content{
			z-index: 10; 
			position: absolute;
			display: flex;
			flex-direction: column;
			justify-content: flex-start;
			align-items: center;
			gap: 20px;
			top: 100px;
			background-color: #141414;
			left: 0;
			width: 100%;
			height: auto;
			margin-top: 200px;
		}
		.avatar{
			height: 200px;
			margin-top: -100px;
		}
	</style>
</head>
<body>
	<jsp:include page="../../components/TabLeft.jsp" />
	<div class="content" style="position: relative; margin: 10px 10px 0px 0px;">
		<jsp:include page="../../components/Header.jsp" />
		<div>
			<img class="background" src="<%=request.getContextPath()%>/static/img/DefaultBackground.jpg">
			<div class="background-overlay"></div>
			<div class="main-content">
				<img class="avatar" src="<%=request.getContextPath()%>/static/img/UserProfile.png">
				<p style="font-size: 40px; font-weight: 600;">Name</p>
				<p style="font-size: 20px; font-weight: 500;">Tất cả playlist</p>
				<div class="playlist-container" style="display: flex; justify-content: center; flex-wrap: wrap; width: 100%;">
				</div>
			</div>
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