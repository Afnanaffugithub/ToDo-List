package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.Todo_service;

@WebServlet("/complete")
public class UpdateTaskServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if (req.getSession().getAttribute("user")!=null) {
			
		Todo_service service=new Todo_service();
		
		if (service.upadateStatus(req,resp)) {
			req.setAttribute("msg", "Status Updated");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("msg", "Status not Updated");
			req.getRequestDispatcher("add-task.jsp").forward(req, resp);
		}
		}
		else {
			req.setAttribute("msg", "Invalid User Please Login First");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		}
	}

