package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.apache.catalina.Manager;

import dto.Todo_Task;
import dto.Todo_User;

public class Todo_dao {
	EntityManagerFactory factory=Persistence.createEntityManagerFactory("Mytodo");
	EntityManager manager=factory.createEntityManager();
	EntityTransaction transaction=manager.getTransaction();

	public void saveUser(Todo_User user) {
		transaction.begin();
		manager.persist(user);
		transaction.commit();
	}
	
	public List<Todo_User> checkingEmailUniqueOrNot(String email){
		return manager.createQuery("select x from Todo_User x where email=?1").setParameter(1, email).getResultList();
		
	}
	public void saveTask(Todo_Task task) {
		transaction.begin();
		manager.persist(task);
		transaction.commit();
	}

	public List<Todo_Task> fetchTaskByUser(int id){
		return manager.createQuery("select x from Todo_Task x where user_id=?1").setParameter(1, id).getResultList();
	}
	public void deleteTask(Todo_Task id) {
		transaction.begin();
		manager.remove(id);
		transaction.commit();
	}
	
	public void update(Todo_Task task) {
		transaction.begin();
		manager.merge(task);
		transaction.commit();
	}

	public Todo_Task findTaskById(int id) {
		return manager.find(Todo_Task.class, id);
	}
	
	
}
