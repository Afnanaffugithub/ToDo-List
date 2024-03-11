package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.Todo_service;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Todo_service service=new Todo_service();
		
		if (service.login(req,resp)) {
			req.setAttribute("msg", "Login Success");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("msg", "Invalid Email or Password");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
}
