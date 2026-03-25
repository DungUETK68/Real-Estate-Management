package com.website.repository.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "username", unique = true, nullable = false)
	private String userName;
	
	@Column(name = "password", nullable = false)
	private String passWord;
	
	@Column(name = "fullname", nullable = false)
	private String fullName;
	
	@Column(name = "status")
	private Long status;
	
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	List<UserRoleEntity> items = new ArrayList<>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	public List<UserRoleEntity> getItems() {
		return items;
	}

	public void setItems(List<UserRoleEntity> items) {
		this.items = items;
	}
	
}
