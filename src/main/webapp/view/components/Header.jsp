<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.header{
		width: 100%;
		display: flex;
		position: relative;
		justify-content: flex-end;
		align-items: center;
		max-height: 40px;
		gap: 10px;
	}
	.user-image{
		width: 30px;
		height: 30px;
		border-radius: 100%;
	}
	.user-name{
		font-size: 14px;
		font-weight: 600;
	}
	.header-option-panel{
		position: absolute;
		right: 5px;
		top: 50px;
		background: #282828;
		border-radius: 10px;
		padding: 5px;
		z-index: 10;
	}
	.header-option-item{
		display: flex;
		gap: 20px;
		cursor: pointer;
		padding: 15px 20px 15px 20px;
		border-radius: 10px;
	}
	.header-option-panel p{
		font-size: 14px;
		font-weight: 500;
		margin: 0;
    }
    .header-option-item:hover{
		background-color: #3e3e3e;
	}
	/* Add this to your existing CSS */
	.header-option-panel.hidden {
	    display: none;
	}
	#drop-down-btn{
		cursor: pointer;
	}
</style>
</head>
<body>
	<div class="header">
		<img class="user-image" src="<%= request.getContextPath() %>/static/img/UserProfile.png" >
		<p class="user-name">Will</p>
		<img id="drop-down-btn" class="drop-down" src="<%= request.getContextPath() %>/static/icon/dropdown.svg" >
		<div class="header-option-panel hidden">
			<div class="header-option-item" onclick="redirectToUserProfile()">
				<p>Hồ sơ</p>			
			</div>
			<div class="header-option-item">
				<p>Đăng xuất</p>
			</div>
		</div>
	</div>
	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    // Get references to the button and panel
	    var dropDownBtn = document.getElementById('drop-down-btn');
	    var optionPanel = document.querySelector('.header-option-panel');
	
	    // Add a click event listener to the button
	    dropDownBtn.addEventListener('click', function() {
	        // Toggle the 'hidden' class to show/hide the panel
	        optionPanel.classList.toggle('hidden');
	    });
	});
	function redirectToUserProfile(){
        window.location.href = '<%=request.getContextPath()%>/view/pages/user/UserProfile.jsp';
	}
	</script>
	
</body>
</html>