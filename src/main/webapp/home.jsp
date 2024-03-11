<%@page import="dto.Todo_User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.Todo_dao"%>
<%@page import="java.util.List"%>
<%@page import="dto.Todo_Task"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home</title>
   <!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style type="text/css">
	.alertify-notifier .ajs-message.ajs-success{
		background-color: rgba(0, 0, 0, 0.800);
		color: #fff;
		font-family: sans-serif;
		font-size: 20px;
		font-weight: 100;
		border-radius: 10px;
	}
	
     .head1{
     	margin-top:10px;
        display: flex;
        border-radius: 30px;
        justify-content: space-between;
        align-items: center;
        background-color:#e9ecfd;
        color: rgb(84, 114, 247);
        height: 70px;
        width: 100%;      
    }
    .head1:hover{
    	color:blue;
    }
    .logo{
        height: 50px;width: 350px;
        /* border: 2px solid black; */
        display: flex;justify-content: center;align-items: center;gap: 5px;
    }
    .logo .logo-name{
        padding-bottom: 9px;
    }
    .logo .logo-name img{
        border-radius: 20px;
        
    }
    .btn-box{
        
        height: 50px;width: 400px;
        /* border: 2px solid black; */
        display: flex;justify-content: center;align-items: center;gap: 20px;
    }
    .btn-box button{
        height: 40px;width: 150px;border: none;
        background-color:#e9ecfd;
        color: rgb(84, 114, 247);
        font-size: 1.2rem;font-weight: 600;
    }
    .btn-box button:hover{
        color: blue;
    }
   

	body{
            height: 100vh;
            box-sizing: border-box;
            padding: 0;margin: 0;
            display: flex;justify-content: start;align-items: center;flex-direction: column;
        }
        .table-div{
            margin-top: 20px;
            height: auto;width: 90%;
            display: flex;justify-content: center;align-items: center;flex-direction: column;
            
        }
       utton:hover{
            background-color: #0056b3;
        }
        table{
            box-shadow: 2px 2px 5px black;
        }
        table tr{
            text-align: center;
        }
        table tr th{
            width: 250px;
            height: 40px;
            background-color: #0056b3;
            color: #fff;
        }
        table tr td{
            width: 250px;
            height: 40px;
        }

        table tr:nth-child(even){
            background-color: rgb(223, 226, 226);
        }
		table tr td .btnedit{
			height:30px;width:60px;
			border:none;
			color:#fff;
			border-radius:10px;
			background-color: green;
		}
		table tr td .btnedit:hover{
			border:2px solid green;
			background-color: #fff;
			color:green;
		}
		table tr td .btndel{
			height:30px;width:60px;
			border:none;
			color:#fff;
			border-radius:10px;
			background-color: red;
		}
		table tr td .btndel:hover{
			border:2px solid red;
			background-color: #fff;
			color:red;
		}
</style>

</head>
<body>
 <% List<Todo_Task> task = new ArrayList(); %>
<% if(session.getAttribute("user")!=null){
	Todo_User user  = (Todo_User)session.getAttribute("user");
	task= new Todo_dao().fetchTaskByUser(user.getId());
 } %>
 <header class="head1">
        <div class="logo">
        <h1><img width="30px" height="30px" src="./images/taskimg.jpg" alt=""></h1>   
        <h1 class="logo-name"> MiNi SchEduLE</h1>
    </div>
        <div class="btn-box">
             <a href="add-task.jsp"><button>Add Task</button></a>
             <a href="logout"><button id="lastbtn">Logout</button></a>
        </div>
    </header>
<div class="heading-div">
        <h1><u>Task Details</u></h1>
    </div>
    
    <div class="table-div">
   
    <table >
        <tr >
        
          <th>Task Name</th>
          <th>Task Description</th>	
          <th>Task Added Time</th>
          <th>Status</th>
          <th>Edit</th>
          <th>Remove</th>
          
        </tr>
         <% if(!task.isEmpty()){ %>
        <% for(Todo_Task task1:task){ %>
        <tr>
        <%-- <td><%= task1.getId() %></td> --%>
          <td> <%= task1.getTaskName() %></td>
          <td><%= task1.getTaskDes() %></td>
          <td><%= task1.getCreateTime() %></td>
          <td><%if(task1.isStatus()){ %>
          			<i style="color: green; cursor: pointer; font-size: 30px" class="fa-solid fa-check-double"></i>
          		<%}else{ %><a href="complete?id=<%= task1.getId()%>"><i style="color: black;font-size: 30px " class="fa-solid fa-check"></i></a><%} %>
          </td>
          
    	  <td><a href="edit-task.jsp?id=<%= task1.getId()%>&des<%= task1.getTaskDes()%>&taskname<%= task1.getTaskName()%>"><button class="btnedit" name="id"><i class="fa-solid fa-pen-to-square"></i></button></a></td>
    	  
          <td><a href="delete?id=<%= task1.getId()%>"><button class="btndel"><i class="fa-solid fa-trash"></i></button></a></td>
        </tr> 
       <% }} %>
      
     </table>
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