<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/global.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/music_item.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/layout.css">
	<style>
		.edit-playlist-panel{
			position: absolute;
			width: 100%;
			height: 100%;
			background-color: rgba(32, 32, 32, 0.6);
			z-index: 10;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.edit-playlist-panel .panel{
			padding: 20px;
			border-radius: 20px;
			background-color: rgba(32, 32, 32);
			z-index: 10;
			display: flex;
			flex-direction: column;
			gap: 20px;
		}
		.edit-playlist-panel img{
			width: 100px;
			height: 100px;
		}
		.edit-playlist-panel .edit-playlist-content{
			display: flex;
			gap: 20px;
		}
		.edit-playlist-panel .edit-playlist-content .edit-playlist-content-child{
			display: flex;
			flex-direction: column;
			gap: 20px;
			justify-content: space-between;
		}
		.edit-playlist-content-child input{
			background-color: #3b3b3b;
			border: none;
			padding: 10px;
			border-radius: 5px;
			color: white;
			font-weight: 600;
		}
		.edit-playlist-content-child button{
			background-color: white;
			border: none;
			border-radius: 5px;
			padding: 10px;
			font-weight: 600;
			cursor: pointer;
		}
		.edit-playlist-panel p{
			margin: 0;
		}
		.playlist-information-header{
			display: flex;
			justify-content: flex-start;
			align-items: flex-end;
			gap: 20px;
			margin-top: 20px;
			margin-bottom: 20px;
			position: relative;
		}
		.playlist-image{
			width: 150px;
			height: 150px;
		}
		.playlist-information{
			display: flex;
			flex-direction: column;
			gap: 10px;
		}
		.playlist-information p{
			margin: 0;
		}
	</style>
</head>
<body>
	<jsp:include page="../../components/TabLeft.jsp" />
	<div class="edit-playlist-panel" style="display: none;">
	    <div class="panel">
	        <button id="closePanelBtn">x</button>
	        <p>Sửa thông tin chi tiết</p>
	        <div class="edit-playlist-content">
	            <img src="<%=request.getContextPath()%>/static/img/DefaultPlaylist.jpg">
	            <div class="edit-playlist-content-child">
	                <input type="text" placeholder="Danh sách phát của tôi">
	                <button id="save-button">Lưu</button>
	            </div>
	        </div>
	    </div>
	</div>
	<div class="content" style="margin: 10px 10px 0px 0px;">
		<jsp:include page="../../components/Header.jsp" />
		<div class="playlist-information-header">
			<img class="playlist-image" src="<%=request.getContextPath()%>/static/img/DefaultPlaylist.jpg">
			<div class="playlist-information">
				<p style="font-size: 10px; font-weight: 400;">Playlist</p>
				<p style="font-size: 40px; font-weight: 600;"  class="playlist-information-name">Danh sách phát của bạn</p>
				<p style="font-weight: 500;" class="playlist-information-number">0 bài hát</p>			
			</div>
			<div id="editBtn" style="display: flex; gap: 10px; align-items: center; position: absolute; bottom: -10px; right: 0; cursor: pointer">
				<img style="width: 12px; height: 12px;" src="<%=request.getContextPath()%>/static/icon/write.svg">
				<p style="font-size: 12px;">Edit</p>
			</div>
		</div>
		<div style="display:flex; padding: 10px;">
			<p class="id" style="font-weight:400; font-size: 12px; color: gray;">#</p>
			<p style="width: 48%; font-weight:400; font-size: 12px; color: gray;">Tiêu đề</p>
			<p style="font-weight:400; font-size: 12px; color: gray;">Thể loại</p>
		</div>
		<div class="music-container"></div>
	</div>
<script>
	// Function to get query parameters from the URL
	function getQueryParam(key) {
	    const urlParams = new URLSearchParams(window.location.search);
	    return urlParams.get(key);
	}
	
	// Get the playlistItemId from the URL
	const playlistItemId = getQueryParam('playlistItemId');
	console.log('Playlist Item ID:', playlistItemId);
	
    $(document).ready(function() {
        // Variable to store the playlist name
        var playlistName;

        // Update the playlistName variable when the input field changes
        $(".edit-playlist-content-child input").on('input', function() {
            playlistName = $(this).val();
        });
        
        $(document).on('click', '.music-name', function() {
            // Get the music ID or any relevant information from the clicked element
            var musicId = $(this).data('id');

            // Redirect to the MusicDetail page with the music ID
            window.location.href = '<%=request.getContextPath()%>/view/pages/music/MusicDetail.jsp?musicItemId=' + musicId;
        });
        
        // Use AJAX to call the MusicController servlet when the page loads
        $("#editBtn").click(function() {
            $(".edit-playlist-panel").toggle();
        });

            // Close the edit panel when the "x" button is clicked
        $("#closePanelBtn").click(function() {
            $(".edit-playlist-panel").hide();
        });
            
        $("#save-button").click(function() {
            // Get the playlist name from the input field
            var playlistName = $(".edit-playlist-content-child input").val();

            // Make an AJAX call to the PlaylistController API
            $.ajax({
                url: '<%= request.getContextPath() %>/PlaylistController',
                type: 'POST',
                dataType: 'json',
                data: {
                    action: 'change-name', // Specify the action (create or edit)
                    playlistId: playlistItemId, // Pass the playlist name
                    newName: playlistName
                },
                success: function(data) {
                    console.log(data);
                },
                error: function() {
                    console.error('Error calling PlaylistController');
                }
            });
        });
        
        $.ajax({
            url: '../../../MusicController',
            type: 'GET',
            data: { playlistItemId:  playlistItemId,
            		action: 'getAllMusicByPlaylistId'	
            }, // Pass the playlistItem information
            dataType: 'json',
            success: function(data) {
                console.log(data);

                // Create a string to hold the HTML content
                var htmlString = '';
				$('.playlist-information-name').text(data[0].playlist_name);
				$('.playlist-information-number').text(data.length);
                // Assuming data is an array of playlist items
                // Modify this part based on your JSON structure
                for (var i = 0; i < data.length; i++) {
                    var playlistItem = data[i];
                    console.log(playlistItem);

                    // Concatenate HTML content for each playlist item
                    htmlString += '<div class="container">';
                    htmlString += '<p class="id">' + 1 + '</p>';
                    htmlString += '<img src="${pageContext.request.contextPath}/static/img/DefaultPlaylist.jpg" class="thumbnail"/>';
                    htmlString += '<div class="info">';
                    htmlString += '<p class="music-name" data-id="' + playlistItem.id + '">'+ playlistItem.name +'</p>';
                    htmlString += '<p class="artist-name">' + playlistItem.artist_name + '</p>';
                    htmlString += '</div>';
                    htmlString += '<p class="genre">Genre</p>';
                    htmlString += '</div>';
                }

                // Append the final HTML string to the playlistContainer
                $('.music-container').append(htmlString);
            },
            error: function(error) {
                console.error('Error calling MusicController: ' + error.statusText);
            }

        });
    });
</script>
</body>
</html>
