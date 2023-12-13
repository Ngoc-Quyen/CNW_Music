<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tìm kiếm</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/global.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/layout.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/music_item.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/search.css">
</head>
<body>
	<jsp:include page="../../components/TabLeft.jsp" />
	<div style="display: flex; flex-direction: column; gap: 20px;" class="content" style="margin: 10px 10px 0px 0px;">
		<jsp:include page="../../components/Header.jsp" />
		<div style="position: relative">
			<img style="position: absolute; left: 10px; top: 6px;" src="<%=request.getContextPath()%>/static/icon/search.svg">
			<input class="search-input" type="text" placeholder="Bạn muốn tìm gì" id="searchQuery">
		</div>
		<p style="font-weight: 400; font-size: 14px;" class="search-result"></p>
		<div class="music-container"></div>
	</div>

	<script>
		$(document).ready(function() {
	        
	        $(document).on('click', '.music-name', function() {
	            // Get the music ID or any relevant information from the clicked element
	            var musicId = $(this).data('id');

	            // Redirect to the MusicDetail page with the music ID
	            window.location.href = '<%=request.getContextPath()%>/view/pages/music/MusicDetail.jsp?musicItemId=' + musicId;
	        });
	        
			// Add an event listener to the search input
			$(".search-input").on('input', function() {
				// Get the entered search query
				var searchQuery = $(this).val();

				// Make an AJAX call to the MusicController servlet
				$.ajax({
					url: '<%= request.getContextPath() %>/MusicController',
					type: 'GET',
					data: {
						action: 'getMusicByName',
						nameToFind: searchQuery
					},
					dataType: 'json',
					success: function(data) {
						// Handle the response data, e.g., update the page with the search results
						console.log(data);
						// Clear existing search results
                        $('.music-container').empty();
						if(data.length > 0){
							$('.search-result').text("Kết quả tìm kiếm: " + data.length + " kết quả");							
						}
						else{
							$('.search-result').text("Không có dữ liệu");
						}

                        // Append the new search results to the container
                        for (var i = 0; i < data.length; i++) {
                            var musicItem = data[i];
                            var htmlString = '<div class="container">';
                            htmlString += '<p class="id">' + (i + 1) + '</p>';
                            htmlString += '<img src="${pageContext.request.contextPath}/static/img/DefaultPlaylist.jpg" class="thumbnail"/>';
                            htmlString += '<div class="info">';
                            htmlString += '<p class="music-name" data-id="' + musicItem.id + '">' + musicItem.name + '</p>';
                            htmlString += '<p class="artist-name">' + musicItem.artist_name + '</p>';
                            htmlString += '</div>';
                            htmlString += '<p class="genre">Genre</p>';
                            htmlString += '</div>';
                            $('.music-container').append(htmlString);
                        }
					},
					error: function() {
						console.error('Error calling MusicController');
					}
				});
			});
		});
	</script>
</body>
</html>
