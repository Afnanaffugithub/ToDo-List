package services;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Todo_dao;
import dto.Todo_Task;
import dto.Todo_User;

public class Todo_service {

	Todo_dao dao=new Todo_dao();
	
	// SIGNUP METHOD
	public boolean signup(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Todo_User user=new Todo_User();
		user.setName(req.getParameter("name"));
		user.setEmail(req.getParameter("email"));
		user.setMobile(Long.parseLong(req.getParameter("mobile")));
		user.setDob(LocalDate.parse(req.getParameter("dob")));
		user.setPassword(req.getParameter("password"));
		
		List<Todo_User> list=dao.checkingEmailUniqueOrNot(user.getEmail());
		
		if (list.isEmpty()) {
			dao.saveUser(user);
			return true;
		}
		else {
			return false;
		}
		
	}
	
	
	// LOGIN METHOD
	public boolean login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		List<Todo_User> list=dao.checkingEmailUniqueOrNot(email);
		
		if (list.isEmpty()) {
			return false;
		}
		else {
			Todo_User user=list.get(0);
			if (user.getPassword().equals(password)) {
				req.getSession().setAttribute("user",user);
//				List<Todo_Task> tasks=dao.fetchTaskByUser(user.getId());
//				req.setAttribute("tasks", tasks);
				return true;
			}
			else {
				return false;			}
		}
		
	}

	
	
	// ADD TASK METHOD
	public boolean addTask(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String taskName=req.getParameter("taskname");
		String taskdes=req.getParameter("taskdes");
		
		Todo_Task task=new Todo_Task();
		task.setTaskName(taskName);
		task.setTaskDes(taskdes);
		task.setStatus(false);
		task.setCreateTime(LocalDateTime.now());
		Todo_User user=(Todo_User) req.getSession().getAttribute("user");
		task.setUser(user);
		
		dao.saveTask(task);
		List<Todo_Task> tasks=dao.fetchTaskByUser(user.getId());
		req.setAttribute("tasks", tasks);
		return true;
	}

	// UPDATE STATUS 
	public boolean upadateStatus(HttpServletRequest req, HttpServletResponse resp) {
		int id=Integer.parseInt(req.getParameter("id"));
		Todo_Task task=dao.findTaskById(id);
		task.setStatus(true);
		dao.update(task);
		
		Todo_User user=(Todo_User) req.getSession().getAttribute("user");
		List<Todo_Task> tasks=dao.fetchTaskByUser(user.getId());
		req.setAttribute("tasks", tasks);
		return true;
	}
	
	// DELETE TASK
public boolean deleteTask(HttpServletRequest req, HttpServletResponse resp) {
	int id=Integer.parseInt(req.getParameter("id"));
	Todo_Task task=dao.findTaskById(id);
	dao.deleteTask(task);
	
	Todo_User user=(Todo_User) req.getSession().getAttribute("user");
	List<Todo_Task> tasks=dao.fetchTaskByUser(user.getId());
	req.setAttribute("tasks", tasks);
	return true;
}


// UPDATE TASK
public boolean upadateTask(HttpServletRequest req, HttpServletResponse resp) {
	String Name=req.getParameter("edittaskname");
	String des=req.getParameter("edittaskdes");
	int id=Integer.parseInt(req.getParameter("id"));
	Todo_Task task=dao.findTaskById(id);
	task.setTaskName(Name);
	task.setTaskDes(des);
	dao.update(task);
	
	Todo_User user=(Todo_User) req.getSession().getAttribute("user");
	List<Todo_Task> tasks=dao.fetchTaskByUser(user.getId());
	req.setAttribute("tasks", tasks);
	return true;
	
}
}
