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
		.music-option-panel{
			position: absolute;
			background-color: #282828;
			width: 280px;
			padding: 5px;
			top: -10px;
			left: 0;
			border-radius: 10px;
			display: none; /* Hide the panel by default */
		}
		
		.music-option-panel p{
			font-size: 14px;
			font-weight: 500;
			margin: 0;
		}
			
		.music-option-panel-item{
			display: flex;
			gap: 20px;
			cursor: pointer;
			padding: 15px 20px 15px 20px;
			border-radius: 10px;
		}
		
		.music-option-panel-item:hover{
			background-color: #3e3e3e;
		}
		
		.add-playlist-panel-bg {
            position: fixed;
            top: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(32, 32, 32, 0.6);
            display: none; /* Hide the panel by default */
            justify-content: center;
            align-items: center;
            z-index: 10;
        }

        .add-playlist-panel {
            padding: 15px 20px 15px 20px;
            background-color: rgba(32, 32, 32);
            width: 300px;
            position: relative;
            border-radius: 10px;
        }

        .close-panel-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            cursor: pointer;
            font-size: 25px;
            color: white;
        }
        
        .comment-section{
        	width: 100%;
        	padding: 10px;
        	display: flex;
        	justify-content: center;
        	align-items: center;
        	gap: 20px;
        	background-color: #181818;
        	border-radius: 10px;
        }
        
        .comment-section img{
        	width: 35px;
        	height: 35px;
        	border-radius: 10px;
        }
        
        .comment-section input{
        	width: 100%;
        	background-color: #222222;
        	border: 0;
        	padding: 10px;
        	border-radius: 10px;
        	color: white;
        }
        
        .comment-list{
        	display: flex;
        	flex-direction: column;
        	gap: 20px;
        	padding: 10px;s
        }
        
        .comment-card{
        	position: relative;
        	display: flex;
        	gap: 20px;
        }
        
        .comment-card-information{
        	display: flex;
        	flex-direction: column;
        	justify-content: space-between;
        }
        
        .comment-list p{
        	color: white;
        	margin: 0;
        }
        
        .comment-list img{
        	width: 35px;
        	height: 35px;
        	border-radius: 10px;
        }
        
        .comment-card-name{
        	font-weight: 500;
        	font-size: 12px;
        }
        
        .comment-card-content{
        	font-weight: 400;
        	font-size: 12px;
        }
        
        .comment-more-icon{
        	position: absolute;
        	right: 10px;
        }
        
        .comment-option-panel{
        	position: absolute;
			background-color: #282828;
			width: 90px;
			padding: 5px;
			right: 0px;
			top: -5px;
			border-radius: 10px;
			display: none; 
			z-index: 10;
        }
        
        .comment-option-panel p{
        	font-size: 12px;
        	font-weight: 400;
        	margin: 0;
        }
        
        .comment-option-panel-item{
			display: flex;
			gap: 20px;
			cursor: pointer;
			padding: 5px 10px 5px 10px;
			border-radius: 10px;
		}
		
		.comment-option-panel-item:hover{
			background-color: #3e3e3e;
		}

		.edit-comment-panel-bg {
		    position: fixed;
		    top: 0;
		    width: 100vw;
		    height: 100vh;
		    background-color: rgba(32, 32, 32, 0.6);
		    display: none; /* Hide the panel by default */
		    justify-content: center;
		    align-items: center;
		    z-index: 10;
		}
		
		.edit-comment-panel {
		    padding: 15px 20px 15px 20px;
		    background-color: rgba(32, 32, 32);
		    width: 300px;
		    position: relative;
		    border-radius: 10px;
		}

		.edit-comment-panel	textarea{
			background-color: #222222;
			border: 0;
			padding: 10px;
			color: white;
			width: calc(100% - 20px);
		}
		
		.edit-comment-panel	button{
			background-color: white;
			border: 0;
			color: black;
			padding: 10px;
			margin-top: 20px;
			font-weight: 600;
			border-radius: 10px;
		}
		
		#heart-button{
			display: none;
			cursor: pointer;
		}
		
		#pinkheart-button{
			display: none;
			cursor: pointer;
		}
		
		#play-button{
			background-color: #1ed760; 
			border-radius: 100%; 
			display: flex; 
			align-items: center; 
			justify-content: center; 
			width: 45px; 
			height: 45px;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<jsp:include page="../../components/TabLeft.jsp" />
	<div class="add-playlist-panel-bg" id="addPlaylistPanelBg">
        <div class="add-playlist-panel">
            <div class="close-panel-btn" onclick="closeAddPlaylistPanel()">x</div>
        </div>
    </div>
    <div class="edit-comment-panel-bg">
        <div class="edit-comment-panel">
	    	<p>Chỉnh sửa bình luận của bạn</p>
    		<div><textarea id="edit-comment-textarea" placeholder="Nhập bình luận mới"></textarea></div>
            <button id="edit-comment-btn">Lưu</button>
            <div class="close-panel-btn" onclick="closeEditCommentPanel()">x</div>
        </div>
    </div>
	<div class="content" style="margin: 10px 10px 0px 0px; display: flex; flex-direction: column; gap: 20px;">
		<jsp:include page="../../components/Header.jsp" />
		<div class="playlist-information-header">
			<img class="playlist-image" src="<%=request.getContextPath()%>/static/img/DefaultPlaylist.jpg">
			<div class="playlist-information">
				<p style="font-size: 10px; font-weight: 400;">Music</p>
				<p style="font-size: 40px; font-weight: 600;" id="music-name"></p>
				<p style="font-weight: 500;" id="artist-name"></p>			
			</div>
		</div>
		<div style="display: flex; gap: 40px;">
			<div id="play-button">
				<img src="<%=request.getContextPath()%>/static/icon/play.svg">
			</div>
			<img id="heart-button" src="<%=request.getContextPath()%>/static/icon/heart.svg">
			<img id="pinkheart-button" src="<%=request.getContextPath()%>/static/icon/pinkheart.svg">
			<div style="position: relative; display: flex; align-items: center;" id="moreIcon">
				<img src="<%=request.getContextPath()%>/static/icon/more.svg">
				<div class="music-option-panel">
					<div class="music-option-panel-item" onclick="showAddPlaylistPanel()">
						<p>+</p>
						<p>Thêm vào danh sách phát</p>
					</div>
				</div>
			</div>
		</div>
		<div class="comment-section">
			<img src="<%=request.getContextPath()%>/static/img/DefaultPlaylist.jpg">
			<input id="comment-input" type="text" placeholder="Viết bình luận của bạn">
		</div>
		<div class="comment-list">
		</div>
	</div>
<script>
	function getQueryParam(key) {
	    const urlParams = new URLSearchParams(window.location.search);
	    return urlParams.get(key);
	}
	
    function showAddPlaylistPanel() {
        $("#addPlaylistPanelBg").css("display", "flex");
    }

    // Function to close the add playlist panel
    function closeAddPlaylistPanel() {
        $("#addPlaylistPanelBg").hide();
    }
    
    function loadLike(musicId){
    	$.ajax({
	        url: '<%= request.getContextPath() %>/MusicController',
	        type: 'GET',
	        dataType: 'json',
	        data: {
	            action: 'checkLike',
	            musicId: musicItemId // Assuming musicItemId is a global variable containing the current music item ID
	        },
	        success: function(data) {
	            console.log(data);
	            if(data == false){
	            	$('#pinkheart-button').hide();
	            	$('#heart-button').show();
	            }
	            else{
	            	$('#heart-button').hide();
	            	$('#pinkheart-button').show();
	            }
	            // You can handle the success response here, such as displaying a message to the user
	        },
	        error: function(error) {
	            console.error('Error calling PlaylistController' + error.statusText);
	            // You can handle the error here, such as displaying an error message to the user
	        }
	    });
    }
    
    function addMusicToPlaylist(playlistId) {
	    $.ajax({
	        url: '<%= request.getContextPath() %>/PlaylistController',
	        type: 'POST',
	        dataType: 'json',
	        data: {
	            action: 'add-music',
	            playlistId: playlistId,
	            musicId: musicItemId // Assuming musicItemId is a global variable containing the current music item ID
	        },
	        success: function(data) {
	            console.log(data);
	            // You can handle the success response here, such as displaying a message to the user
	        },
	        error: function(error) {
	            console.error('Error calling PlaylistController' + error.statusText);
	            // You can handle the error here, such as displaying an error message to the user
	        }
	    });
    }
    
    function showEditCommentPanel(id) {
    	currentCommentId = id;
		console.log("comment id: " + id);
	    $(".edit-comment-panel-bg").css("display", "flex");
	}

	// Function to close the edit comment panel
	function closeEditCommentPanel() {
	    $(".edit-comment-panel-bg").hide();
	}
    
	function deleteComment(commentId) {
        // Confirm deletion with the user (optional)
        var confirmDelete = confirm("Are you sure you want to delete this comment?");

        if (confirmDelete) {
            // Make an AJAX call to the MusicController API to delete the comment
            $.ajax({
                url: '<%= request.getContextPath() %>/MusicController',
                type: 'POST',
                dataType: 'json',
                data: {
                    action: 'deleteComment',
                    commentId: commentId
                },
                success: function(data) {
                    console.log(data);
                    loadComments();
                },
                error: function(error) {
                    console.error('Error calling MusicController: ' + error.statusText);
                    loadComments();
                }
            });
        }
    }
	
    function toggleCommentOptionPanel() {
    }

    
    function loadComments(){
    	$.ajax({
            url: '../../../MusicController',
            type: 'GET',
            data: { musicId:  musicItemId,
            		action: 'getCommentsById'	
            }, // Pass the playlistItem information
            dataType: 'json',
            success: function(data) {
                console.log(data);
				var htmlString = '';
				
                for (var i = 0; i < data.length; i++) {
                    var commentItem = data[i];
            		htmlString += '<div class="comment-card">';
    				htmlString += '<img src="<%=request.getContextPath()%>/static/img/DefaultPlaylist.jpg">';
    				htmlString += '<div class="comment-card-information">';
    				htmlString += '<p class="comment-card-name">' + commentItem.account_name + '</p>';
    				htmlString += '<p class="comment-card-content">' + commentItem.content + '</p>';
    				htmlString += '</div>';
    				htmlString += '<div class="comment-more-icon">';
    				htmlString += '<img src="<%=request.getContextPath()%>/static/icon/more.svg" style="width: 15px;">';
    				htmlString += '<div class="comment-option-panel">';
    				htmlString += '<div class="comment-option-panel-item" onclick="showEditCommentPanel('+ commentItem.id +')">';
    				htmlString += '<p>Chỉnh sửa</p>';
    				htmlString += '</div>';
    				htmlString += '<div class="comment-option-panel-item" onclick="deleteComment(' + commentItem.id + ')">';
    				htmlString += '<p>Xóa</p>';
    				htmlString += '</div>';
    				htmlString += '</div>';
    				htmlString += '</div>';
    				htmlString += '</div>';
                }
                
                $('.comment-list').html(htmlString);

            },
            error: function(error) {
                console.error('Error calling MusicController: ' + error.statusText);
            }

        });
    }
    
	// Get the playlistItemId from the URL
	const musicItemId = getQueryParam('musicItemId');
	console.log('Playlist Item ID:', musicItemId);
	
    var currentCommentId;
    $(document).ready(function() {
    	loadComments();
    	loadLike();
    	
        // Variable to store the playlist name
      	var commentInput = $("#comment-input");

      	$(document).on('mouseenter', '.comment-more-icon', function() {
      	    $(this).find(".comment-option-panel").show();
      	}).on('mouseleave', '.comment-more-icon', function() {
      	    $(this).find(".comment-option-panel").hide();
      	});

        // Event listener for "Enter" key press in the comment input field
	    commentInput.keypress(function(event) {
	        if (event.which === 13) { // 13 corresponds to the "Enter" key
	            // Get the music ID
	            var musicId = getQueryParam('musicItemId');
	            // Get the comment text
	            var commentText = commentInput.val();
	
	            // Make an AJAX call to the MusicController API
	            $.ajax({
	                url: '<%= request.getContextPath() %>/MusicController',
	                type: 'POST',
	                dataType: 'json',
	                data: {
	                    action: 'addComment', // Specify the action
	                    musicId: musicId,
	                    comment: commentText
	                },
	                success: function(data) {
	                    console.log(data);
	                    loadComments();
	                    // You can handle the success response here
	                },
	                error: function(error) {
	                    console.error('Error calling MusicController: ' + error.statusText);
	                    loadComments();
	                }
	            });
	
	            // Clear the input field after adding the comment
	            commentInput.val('');
	        }
	    });
        
        var playlistName;
        
        $("#moreIcon").hover(
                function() {
                    // Show the music-option-panel on hover
                    $(".music-option-panel").show();
                },
                function() {
                    // Hide the music-option-panel when not hovering
                    $(".music-option-panel").hide();
                }
            );

        // Update the playlistName variable when the input field changes
        $(".edit-playlist-content-child input").on('input', function() {
            playlistName = $(this).val();
        });
        
        // Use AJAX to call the MusicController servlet when the page loads
        $("#editBtn").click(function() {
            $(".edit-playlist-panel").toggle();
        });

            // Close the edit panel when the "x" button is clicked
        $("#closePanelBtn").click(function() {
            $(".edit-playlist-panel").hide();
        });
            
        $("#heart-button").click(function() {
            // Get the music ID
            var musicId = getQueryParam('musicItemId');

            // Make an AJAX call to the MusicController API
            $.ajax({
                url: '<%= request.getContextPath() %>/MusicController',
                type: 'POST',
                dataType: 'json',
                data: {
                    action: 'likeMusic', // Specify the action
                    musicId: musicId
                },
                success: function(data) {
                    console.log(data);
					loadLike();
                },
                error: function(error) {
                    console.error('Error calling MusicController: ' + error.statusText);
					loadLike();
                }
            });
        });
        
        $("#pinkheart-button").click(function() {
            // Get the music ID
            var musicId = getQueryParam('musicItemId');

            // Make an AJAX call to the MusicController API
            $.ajax({
                url: '<%= request.getContextPath() %>/MusicController',
                type: 'POST',
                dataType: 'json',
                data: {
                    action: 'unlikeMusic', // Specify the action
                    musicId: musicId
                },
                success: function(data) {
                    console.log(data);
					loadLike();
                },
                error: function(error) {
                    console.error('Error calling MusicController: ' + error.statusText);
					loadLike();
                }
            });
        });
        
        $.ajax({
            url: '../../../MusicController',
            type: 'GET',
            data: { musicItemId:  musicItemId,
            		action: 'getMusicById'	
            }, // Pass the playlistItem information
            dataType: 'json',
            success: function(data) {
                console.log(data);
             // Assuming data has properties 'name' and 'artist_name'
                var musicName = data.name;
                var artistName = data.artist_name;

                // Set the values in the HTML elements
                $('#music-name').text(musicName);
                $('#artist-name').text(artistName);
            },
            error: function(error) {
                console.error('Error calling MusicController: ' + error.statusText);
            }

        });
        
        $.ajax({
            url: '<%= request.getContextPath() %>/PlaylistController',
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                console.log(data);

                // Create a string to hold the HTML content
                var htmlString = '';
                htmlString += '<p>Chọn playlist để thêm vào</p>';

                // Assuming data is an array of playlist items
                // Modify this part based on your JSON structure
                for (var i = 0; i < data.length; i++) {
                    var playlistItem = data[i];

                    // Concatenate HTML content for each playlist item
                    htmlString += '<div class="playlist" onclick="addMusicToPlaylist(\'' + playlistItem.id + '\')">';
                    htmlString += '<img src="${pageContext.request.contextPath}/static/img/DefaultPlaylist.jpg" class="playlist-thumbnail"/>';
                    htmlString += '<div class="playlist-info">'
                    htmlString += '<p class="playlist-name">' + playlistItem.name + '</p>';
                    htmlString += '<p class="number">1 bài hát</p>';
                    htmlString += '</div>';
                    htmlString += '</div>';
                }

                // Append the final HTML string to the playlistContainer
                $('.add-playlist-panel').append(htmlString);
            },
            error: function() {
                console.error('Error calling PlaylistController');
            }
        });
        $("#edit-comment-btn").click(function() {
            // Get the new comment content
            var newComment = $("#edit-comment-textarea").val();

            // Call the MusicController API to edit the comment
            editComment(currentCommentId, newComment);

            // Close the edit comment panel
            closeEditCommentPanel();
        });
        function editComment(commentId, newComment) {
        	console.log(currentCommentId);
            $.ajax({
                url: '<%= request.getContextPath() %>/MusicController',
                type: 'POST',
                dataType: 'json',
                data: {
                    action: 'editComment',
                    commentId: currentCommentId,
                    newComment: newComment
                },
                success: function(data) {
                    console.log(data);
                    loadComments();
                },
                error: function(error) {
                    console.error('Error calling MusicController: ' + error.statusText);
                    loadComments();
                }
            });
        }
        
    });
</script>
</body>
</html>
