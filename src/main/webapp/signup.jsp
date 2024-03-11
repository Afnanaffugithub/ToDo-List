<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Page</title>
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
            display: flex;justify-content:center;align-items: center;
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
            width: 90%;
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
        #pass{
			width: 85%;
		}
    </style>
</head>
<body>
    <div class="container">
        <h1>Signup</h1>
        <form action="signup" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" minlength="18" name="email" pattern="[a-z0-9._%+\-]{8,}@[a-z0-9.\-]+\.[a-z]{2,3}" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile Number</label>
                <input type="text" id="mobile" minlength="10" pattern="[0-9]{10}" name="mobile" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="pass" name="password" required>
                	<span style="display: none;" class="eye-icon" id="eye-open" onclick="showpass()"><i class="fa-solid fa-eye" id="open"></i></span> 
             		<span class="eye-icon" id="eye-close" onclick="showpass()"><i class="fa-solid fa-eye-slash" id="close"></i></span>
            </div>
            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" onchange="check()" required>
                <span id="valid" style="color: red; margin-top: 3px; font-size: 12px;"></span>
            </div> 
            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="date" id="dob" name="dob" required>
            </div>
            <!--<div class="form-group">
                <label for="gender">Gender</label>
                male<input type="radio" id="gender" name="gender" value="male" required>
                female<input type="radio" id="gender" name="gender" value="female" required>
            </div>-->
            
            <div class="form-group">
                <input type="submit" value="Sign Up">
            </div>
             <div class="form-group">
                <h5>Have an account click<a href="login.jsp">Login</a></h5>
                
            </div>
        </form>
    </div>
    
    <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
    <script>
       <% if(request.getAttribute("msg")!=null){ %>
       		alertify.set('notifier','position','top-center');
       		alertify.set('notifier','delay',1.7);
       		alertify.success('<%= request.getAttribute("msg") %>');
       <%
       	request.setAttribute("msg", null);
       } 
       %>

		function check(){
        if(document.getElementById('pass').value==document.getElementById('confirm-password').value){
            document.getElementById('valid').innerHTML="";
        }
        
        else{
			document.getElementById('valid').innerHTML="Password doesn't match";
		}  
    }
		
		function showpass(){
        let password=document.getElementById('pass');
        let eyeOpen=document.getElementById('eye-open');
        let eyeClose=document.getElementById('eye-close');
        if(password.type==="password"){
            password.type="text";
            eyeClose.style.display="none";
            eyeOpen.style.display="inline-block";
        }
        else{
            password.type="password";
            eyeClose.style.display="inline-block";
            eyeOpen.style.display="none";
        }
    }
		
	</script>
</body>
</html>