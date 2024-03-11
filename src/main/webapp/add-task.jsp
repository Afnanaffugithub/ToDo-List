<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add task</title>
   <!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
 <style>
 	.alertify-notifier .ajs-message.ajs-success{
		background-color: rgba(0, 0, 0, 0.800);
		color: #fff;
		font-family: sans-serif;
		font-size: 20px;
		font-weight: 100;
		border-radius: 10px;
	}

 
        body{
            height: 100vh;
            box-sizing: border-box;
            padding: 0;margin: 0;
            display: flex;justify-content: center;align-items: center;flex-direction: column;
        }
        .table-div{
            height: auto;width: 90%;
            display: flex;justify-content: center;align-items: center;
        }
        .btn-div{
            height: 100px;width: 80%;
            display: flex;justify-content: space-evenly;align-items: center;
        }
        .btn-div input{
        	cursor: pointer;
            height: 40px;width: 150px;border: none;border-radius: 15px;
            background-color: #007bff;color: #fff;font-weight: 600;
        }
        .btn-div input:hover{
            background-color: #0056b3;
        }
        form{
        position: relative;
            height: 300px;width: 400px;
            background-color: #eef4fa;
            border-radius: 10px;
            box-shadow: 2px 2px 5px black;
            display: flex;justify-content: center;align-items: center;flex-direction: column;
        }
        form h4{
        	text-align:center;height:15px;width:15px;padding:10px;
        	border-radius:10px;
        	font-family:sans-serif;
        	position: absolute;
        	top:-10px;
        	right: 15px;
        	color: #007bff;
        }
        form h4:hover{
        	background-color:red;
        	color: #fff;
        }
        .table-div table tr td label{   
            font-size: 1.2rem;font-weight: 600;
        }
        .table-div table tr td input{
            width: 300px;height: 30px;
            background-color: #fff;
            outline: none;border-radius: 10px;
            border: 1px solid #0056b3;
        }
    </style>
</head>
<body>
<div heading-div>
            <h1><u>Add Task</u></h1>
        </div>
        <div class="table-div">
        <form action="addtask" method="post">
       <a href="home.jsp"><h4>X</h4></a>
        <table>
            <tr><td><label for="taskname">Task Name:</label></td></tr>
            <tr><td><input type="text" id="taskname" name="taskname" required="required"></td></tr>
            </tr>
            
            <tr><td><label for="taskdes">Task Description:</label></td></tr>
            <tr><td><input type="text" id="taskdes" name="taskdes" required="required"></td></tr>
            
            </table>
            <div class="btn-div">
                    <input type="submit" value="Add Task">
                    <input type=reset value="Clear">         
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
      
    </script>

</body>
</html>