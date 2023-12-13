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
		.manage-list-container{
			display: flex;
			justify-content: flex-start;
			gap: 20px;
		}
		.manage-list-item{
			background-color: #181818;
			border-radius: 10px;
			padding: 15px;
			border: 0;
			color: white;
			font-weight: 600;
			font-size: 14px;
			cursor: pointer;
		}
		.list-item{
			border-radius: 10px;
			padding: 15px;
			padding-top: 5px;
			padding-bottom: 5px;
			color: white;
		}
		.list-item p{
			margin: 0;
		}
		.music-list-container{
			margin-top: 20px;
			display: flex;
			flex-direction: column;
			gap: 10px;
			font-size: 12px;
		}
		.account-list-container{
			margin-top: 20px;
			display: flex;
			flex-direction: column;
			gap: 10px;
			font-size: 12px;
		}
		.account-title{
			color: gray;
			display: flex;
		}
		.account-item{
			color: white;
			display: flex;
			border-radius: 10px;
			align-items: center;
			position: relative;
		}
		.music-title{
			color: gray;
			display: flex;
		}
		.music-item{
			color: white;
			display: flex;
			border-radius: 10px;
			align-items: center;
			position: relative;
		}
		.account-index{
			width: 10%;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.music-index{
			width: 10%;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		.account-item:hover{
			background-color: #232323;
		}
		.music-item:hover{
			background-color: #232323;
		}
		.account-name{
			width: 20%;
		}
		.music-name{
			width: 20%;
		}
		.delete-button{
			position: absolute;
			right: 10px;
			left: auto;
			color: red;
			cursor:pointer;
			padding: 5px;
			border-radius: 5px;
		}
	</style>
</head>
<body>
	<jsp:include page="../../components/TabLeft.jsp" />
	<div class="content" style="position: relative; margin: 10px 10px 0px 0px;">
		<jsp:include page="../../components/Header.jsp" />
		<div class="manage-list-container">
			<button id="account-list-btn" class="manage-list-item">Danh sách tài khoản</button>
			<button id="music-list-btn" class="manage-list-item">Danh sách âm nhạc</button>
		</div>
		<div style="margin-top: 10px;">
			<div class="music-list-container">
				<p>Danh sách nhạc</p>
			</div>
			<div class="account-list-container">
				<p>Danh sách tài khoản</p>
			</div>
		</div>
	</div>
	<script>
	function deleteAccount(accountId) {
        $.ajax({
            url: '<%= request.getContextPath() %>/AdminController',
            type: 'POST',
            data: {
                action: 'deleteAccount',
                accountId: accountId
            },
            success: function(response) {
                console.log(response);
            },
            error: function() {
                console.error('Error calling AdminController');
            }
        });
    }

    // Function to call MusicController with method POST and pass musicId
    function deleteMusic(musicId) {
        $.ajax({
            url: '<%= request.getContextPath() %>/MusicController',
            type: 'POST',
            data: {
                action: 'deleteMusic',
                musicId: musicId
            },
            success: function(response) {
                console.log(response);
            },
            error: function() {
                console.error('Error calling MusicController');
            }
        });
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
        
        function updateAccountList() {
            // Use AJAX to call the AdminController servlet
            $.ajax({
                url: '<%= request.getContextPath() %>/AdminController',
                type: 'GET',
                data: { action: 'getAllAccount' },
                dataType: 'json',
                success: function(data) {
                    console.log(data);

                    // Create a string to hold the HTML content
                    var htmlString = '';
					htmlString += '<div class="account-title">';
					htmlString += '<div class="account-index">#</div>';
					htmlString += '<div class="account-name">Name</div>';
					htmlString += '</div>';
					htmlString += '<div style="border-bottom: 1px solid white;"></div>';
                    // Modify this part based on your JSON structure
                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];

                        // Concatenate HTML content for each item
                        htmlString += '<div class="account-item">';
                        htmlString += '<div class="account-index">' + i + '</div>';
                        htmlString += '<div class="account-name">';
                        htmlString += '<p>' + item.username + '</p>';
                        htmlString += '</div>';
                        htmlString += '<div class="delete-button" onclick="deleteAccount(' + item.id + ')">Xóa</div>';
                        htmlString += '</div>';
                    }

                    // Update the HTML content of the account list container
                    $('.account-list-container').html(htmlString);

                    // Show the account list container and hide the music list container
                    $('.account-list-container').show();
                    $('.music-list-container').hide();
                },
                error: function() {
                    console.error('Error calling AdminController');
                }
            });
        }

        // Function to update the music list
        function updateMusicList() {
            // Use AJAX to call the AdminController servlet
            $.ajax({
                url: '<%= request.getContextPath() %>/AdminController',
                type: 'GET',
                data: { action: 'getAllMusic' },
                dataType: 'json',
                success: function(data) {
                    console.log(data);

                    // Create a string to hold the HTML content
                    var htmlString = '';
                    htmlString += '<div class="music-title">';
					htmlString += '<div class="music-index">#</div>';
					htmlString += '<div class="music-name">Tên</div>';
					htmlString += '<div class="music-name">Nghệ sĩ</div>';
					htmlString += '<div class="music-name">Thể loại</div>';
					htmlString += '<div class="music-name">Ngày phát hành</div>';
					htmlString += '</div>';
					htmlString += '<div style="border-bottom: 1px solid white;"></div>';
                    // Modify this part based on your JSON structure
                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];

                        // Concatenate HTML content for each item
						htmlString += '<div class="music-item">';
                        htmlString += '<div class="music-index">' + i + '</div>';
                        htmlString += '<p class="music-name">' + item.name + '</p>';
                        htmlString += '<p class="music-name">' + item.artist_name + '</p>';
                        htmlString += '<p class="music-name">' + item.genre_name + '</p>';
                        htmlString += '<p class="music-name">' + item.release_date + '</p>';
                        htmlString += '<div class="delete-button" onclick="deleteMusic(' + item.id + ')">Xóa</div>';
                        htmlString += '</div>';
                        htmlString += '</div>';
                    }

                    // Update the HTML content of the music list container
                    $('.music-list-container').html(htmlString);

                    // Show the music list container and hide the account list container
                    $('.music-list-container').show();
                    $('.account-list-container').hide();
                },
                error: function() {
                    console.error('Error calling AdminController');
                }
            });
        }

        updateAccountList();

        // Set up click event listeners for the buttons
        $('#account-list-btn').click(updateAccountList);
        $('#music-list-btn').click(updateMusicList);
    });
    </script>
</body>
</html>