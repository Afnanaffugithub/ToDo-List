	package dto;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import helper.AES;
import lombok.Data;

@Entity
@Data
public class Todo_User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(nullable = false)
	private String name;
	@Column(nullable = false)
	private String email;
	@Column(nullable = false)
	private Long mobile;
	private LocalDate dob;
	@Column(nullable = false)
	private String password;
	
	public String getPassword() {
		return AES.decrypt(password, "pass");
	}
	public void setPassword(String password) {
		this.password = AES.encrypt(password, "pass");
	}
}
