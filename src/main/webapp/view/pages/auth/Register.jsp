<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Spotify Sign In</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/global.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/register.css">
</head>
<body>

  <header>
    <div class="logo">
      <a href="index.html">
        <img src="img/spo-logo.png" />
      </a>
    </div>
  </header>

  <section>
    <div class="main">
      <h1>Sign up to start listening</h1>

      <div class="log-in">
	      <form action="../../../AuthController" name="form" method="post">
          <label>Email or username</label>
          <input type="text" name="username" placeholder="Email or username"/>
          <label>Password</label>
          <input type="password" name="password" placeholder="Password"/>
          <label>Enter the password</label>
          <input type="password" name="confirm-password" placeholder="Confirm the password" />
          <input type="hidden" name="action" value="register" />
          <input type="submit" value="Register" class="btn"/>
        </form>
      </div>

      <hr />

        <div class="last">
          <span>Do you already have an account?</span>
          <a href="Login.jsp" id="linkToLogin">Login here</a>
        </div>

    </div>
  </section>
	
  <script>
    document.getElementById('linkToLogin').addEventListener('click', function(event) {
      event.preventDefault();

      window.location.href = this.href;
    });
  </script>

</body>
</html>