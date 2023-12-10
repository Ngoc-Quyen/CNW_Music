<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/music_item.css">
</head>
<body>
<div class="music-container"></div>
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
        // Use AJAX to call the MusicController servlet when the page loads
        $.ajax({
            url: '../../../MusicController',
            type: 'GET',
            data: { playlistItemId:  playlistItemId}, // Pass the playlistItem information
            dataType: 'json',
            success: function(data) {
                console.log(data);

                // Create a string to hold the HTML content
                var htmlString = '';

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
                    htmlString += '<p class="name">Name for default</p>';
                    htmlString += '<p class="artist-name">Artist</p>';
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
