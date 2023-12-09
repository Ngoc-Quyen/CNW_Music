<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="model.bean.Playlist" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Playlist Container</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/global.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/playlist_item.css">
</head>
<body>
    <div class="playlist-container"></div>
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
                    htmlString += '<div class="container">';
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
