<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.tab-left{
			display: flex;
			flex-direction: column;
			gap: 10px;
			min-width: 300px;
		}
		.tab-container{
			background-color: #141414;
			padding: 10px 20px 10px 20px;
			border-radius: 20px;
		}
		.playlist-row-container{
			display: flex;
			flex-direction: column;
			gap: 10px;
		}
		.playlist-header{
			display: flex;
			justify-content: space-between;
		}
		.playlist-thumbnail{
			width: 50px;
			height: 50px;
			border-radius: 10px;
		}
		.playlist{
			display: flex;
			justify-content: flex-start;
			gap: 20px;
			cursor: pointer;
			padding: 5px;
			border-radius: 10px;
		}
		.playlist:hover{
			background-color: #232323;
		}
		.playlist-info{
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			align-items: flex-start;
			padding: 5px;
		}
		.name{
			font-size: 12px;
			margin: 0;
		}
		.number{
			font-size: 12px;
			margin: 0;
		}
		.tab-item{
			font-weight: 600;
			font-size: 14px;
			cursor: pointer;
		}
		p{
			color: white;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function redirectToPage(playlistItemId) {
            // Use playlistItemId to pass data to the new page, e.g., in the URL or through a form
            window.location.href = '<%=request.getContextPath()%>/view/pages/music/MusicList.jsp?playlistItemId=' + playlistItemId;
        }
    </script>
</head>
<body>
	<div class="tab-left">
		<div class="tab-container">
			<p class="tab-item">Trang chủ</p>
			<p class="tab-item">Tìm kiếm</p>
		</div>
		<div class="tab-container">
			<div class="playlist-header">
				<p class="tab-item">Thư viện</p>
				<p class="tab-item">+</p>
			</div>
			<div class="playlist-row-container">
				
			</div>
		</div>	
	</div>
	<script>
    $(document).ready(function() {
        // Use AJAX to call the PlaylistController servlet when the page loads
        $.ajax({
            url: '<%= request.getContextPath() %>/PlaylistController',
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
                    htmlString += '<div class="playlist" onclick="redirectToPage(\'' + playlistItem.id + '\')">';
                    htmlString += '<img src="${pageContext.request.contextPath}/static/img/DefaultPlaylist.jpg" class="playlist-thumbnail"/>';
                    htmlString += '<div class="playlist-info">'
                    htmlString += '<p class="name">' + playlistItem.name + '</p>';
                    htmlString += '<p class="number">1 bài hát</p>';
                    htmlString += '</div>';
                    htmlString += '</div>';
                }

                // Append the final HTML string to the playlistContainer
                $('.playlist-row-container').append(htmlString);
            },
            error: function() {
                console.error('Error calling PlaylistController');
            }
        });
    });
    </script>
</body>
</html>