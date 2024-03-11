package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Todo_dao;
import dto.Todo_Task;
import dto.Todo_User;
import services.Todo_service;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if (req.getSession().getAttribute("user")!=null) {
			
		Todo_service service=new Todo_service();
		
		if (service.deleteTask(req,resp)) {
			req.setAttribute("msg", "Record is deleted");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("msg", "Record not deleted");
			req.getRequestDispatcher("add-task.jsp").forward(req, resp);
		}
		}
		else {
			req.setAttribute("msg", "Invalid User Please Login First");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		}
	}

