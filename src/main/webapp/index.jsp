
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0"); 
%>
<!DOCTYPE html>

<html lang="en" dir="ltr">

<head>
<meta charset="utf-8">
<title>Online examination System</title>
<link rel="stylesheet" href="css/User-Login-Register.css">
<link rel="stylesheet" href="css/nav.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" type="image/x-icon" href="img/logo21.png">
</head>

<body>

	<nav class="main-nav flex-div">
		<div class="main-nav-left flex-div">
			<i class="fa fa-bars" aria-hidden="true" id="menu-icon"></i> <a
				href="" class="nav-logo">Welcome To Our Online Examination System</a>
		</div>
		<div class="main-nav-right flex-div" id="showprofilemenu">
			<a href="Student-Login.jsp?msg=1"><button class="stud-login-btn">Student Login</button></a> &nbsp;&nbsp;&nbsp;&nbsp;
			<a href="User-Login.jsp?msg=1"><button class="stud-login-btn">Admin Login</button></a>
		</div>
	</nav>
	<div class="new">
		<div class="wrapper1">
		<br>
		
			<img src="img/front.jpg" alt="User Login">
			<i>"exam made easy, with our user-friendly online exam system."</i>
		</div>
		<div class="wrappe">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<h1>"Experience a smarter way to exam,<br> with our online system."</h1>

		</div>
	</div>
	<div class="footer">
	
	
	</div>
	<script>
	history.forward();
	window.onbeforeunload = function() {
		return "You work will be lost.";
	};
</script>
</body>

</html>