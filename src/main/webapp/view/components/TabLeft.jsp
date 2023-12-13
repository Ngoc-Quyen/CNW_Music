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
			min-width: 300px;
		}
		.tab-container{
			background-color: #141414;
			padding: 10px 20px 10px 20px;
			border-radius: 20px;
			margin: 10px 0px 0px 10px;
		}
		.tab-item-container{
			display: flex;
			align-items: center;
			gap: 10px;
		}
		.tab-playlist-container{
			height: calc(100% - 300px);
		}
		.tab-item-container img{
			width: 20px;
			height: 20px;
		}
		.playlist-row-container{
			display: flex;
			flex-direction: column;
			gap: 10px;
			overflow: auto;
			height: calc(100% - 50px);
			scrollbar-width: thin;
		}
		
		.playlist-row-container::-webkit-scrollbar-thumb {
		  background-color: #4CAF50; /* Set the color of the scrollbar thumb */
		  border-radius: 6px; /* Set the radius of the scrollbar thumb */
		}
		
		.playlist-row-container::-webkit-scrollbar-track {
		  background-color: #f1f1f1; /* Set the color of the scrollbar track */
		}
		
		/* Optional: Handle on hover */
		.playlist-row-container::-webkit-scrollbar-thumb:hover {
		  background-color: #45a049; /* Change color on hover */
		}
		
		/* Style for Firefox */
		.playlist-row-container::-moz-scrollbar-thumb {
		  background-color: #4CAF50; /* Set the color of the scrollbar thumb */
		  border-radius: 6px; /* Set the radius of the scrollbar thumb */
		}
		
		.playlist-row-container::-moz-scrollbar-track {
		  background-color: #f1f1f1; /* Set the color of the scrollbar track */
		}
		
		/* Optional: Handle on hover */
		.playlist-row-container::-moz-scrollbar-thumb:hover {
		  background-color: #45a049; /* Change color on hover */
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
		.playlist-name{
			font-weight: 700;
			font-size: 12px;
			margin: 0;
		}
		.number{
			font-size: 12px;
			margin: 0;
			font-weight: 400;
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
        function createPlaylist() {
            $.ajax({
                url: '<%= request.getContextPath() %>/PlaylistController',
                type: 'POST',
                dataType: 'json',
                data: {
                    action: "create"  // Add this line to include the actionType parameter
                },
                success: function(data) {
                    console.log(data);
                    window.location.href = '<%=request.getContextPath()%>/view/pages/music/MusicList.jsp?playlistItemId=' + data;
                },
                error: function() {
                    console.error('Error calling PlaylistController');
                }
            });
        }

    </script>
</head>
<body>
	<div class="tab-left">
		<div class="tab-container">
			<div class="tab-item-container" onclick="redirectToHomePage()">
				<img src="<%=request.getContextPath()%>/static/icon/home.svg">
				<p class="tab-item">Trang chủ</p>
			</div>
			<div class="tab-item-container" onclick="redirectToSearchPage()">
				<img src="<%=request.getContextPath()%>/static/icon/search.svg">
				<p class="tab-item">Tìm kiếm</p>
			</div>
		</div>
		<div class="tab-container tab-playlist-container">
			<div class="playlist-header">
				<div class="tab-item-container">
					<img src="<%=request.getContextPath()%>/static/icon/library.svg">
					<p class="tab-item">Thư viện</p>
				</div>
                <p class="tab-item" onclick="createPlaylist()">+</p>
			</div>
			<div class="playlist-row-container">
				
			</div>
		</div>	
	</div>
	<script>
    function redirectToHomePage() {
        // Redirect to the home page or perform any other action
        window.location.href = '<%=request.getContextPath()%>/view/pages/playlist/PlaylistList.jsp';
    }
    function redirectToSearchPage() {
        // Redirect to the home page or perform any other action
        window.location.href = '<%=request.getContextPath()%>/view/pages/search/Search.jsp';
    }
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
                    htmlString += '<p class="playlist-name">' + playlistItem.name + '</p>';
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