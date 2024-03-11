package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.Todo_service;

@WebServlet("/addtask")
public class Add_Task_Servlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if (req.getSession().getAttribute("user")!=null) {
			
		Todo_service service=new Todo_service();
		
		if (service.addTask(req,resp)) {
			req.setAttribute("msg", "Task Added Successfully");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("msg", "Task not added");
			req.getRequestDispatcher("add-task.jsp").forward(req, resp);
		}
		}
		else {
			req.setAttribute("msg", "Invalid User Please Login First");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		}
	}

