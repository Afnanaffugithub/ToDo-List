<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
	integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>

/* ALERTIFY CSS*/
.alertify-notifier .ajs-message.ajs-success{
		background-color: rgba(0, 0, 0, 0.800);
		color: #fff;
		font-family: sans-serif;
		font-size: 20px;
		font-weight: 100;
		border-radius: 10px;
	}

/* ALERTIFY CSS*/
body {
	background-color: #f2f2f2;
	font-family: Arial, sans-serif;
	height: 95vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	width: 400px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 20px;
	background-color: #fff;
	box-shadow: 5px 5px 10px black;
}

.form-group {
	margin-bottom: 10px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 3px;
}

.form-group input {
	width: 95%;
	padding: 10px;
	border: none;
	border-bottom: 1px solid #ccc;
	background-color: transparent;
}

.form-group input:focus {
	outline: none;
	border-color: #007bff;
}

.form-group input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	cursor: pointer;
	border-radius: 20px;
	font-weight: 600;
}

.form-group input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Login</h1>
		<form action="login" method="post">

			<div class="form-group">
				<label for="email">Email</label> <input type="email" id="email"
					name="email" required>
			</div>

			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password" required>
			</div>

			<div class="form-group">
				<input type="submit" value="Login">

			</div>
			<div class="form-group">
				<h5>
					Does'nt have account?<a href="signup.jsp">SignUp</a>
				</h5>

			</div>
		</form>
	</div>
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<script>
       <%if (request.getAttribute("msg") != null) {%>
       		alertify.set('notifier','position','top-center');
       		alertify.set('notifier','delay',1.7);
       		alertify.success('<%=request.getAttribute("msg")%>');
	<% request.setAttribute("msg", null);
	}%>
		
	</script>
</body>
</html>