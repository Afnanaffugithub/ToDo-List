package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.Todo_service;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Todo_service service=new Todo_service();
		if (service.signup(req,resp)) {
			req.setAttribute("msg", "Account has been created");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		else {
			req.setAttribute("msg", "Account has been taken already");
			req.getRequestDispatcher("signup.jsp").forward(req, resp);
		}
	}
}
