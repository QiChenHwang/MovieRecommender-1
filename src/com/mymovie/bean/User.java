package com.mymovie.bean;

public class User {
	private int userid;
	private String username;
	private String password;
	private String email;
	private int usersort;
	
	public int getUsersort() {
		return usersort;
	}


	public void setUsersort(int usersort) {
		this.usersort = usersort;
	}
	
	public int getUserid() {
		return userid;
	}


	public void setUserid(int userid) {
		this.userid = userid;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public User(String username, String password, String email, int usersort) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.usersort = usersort;
	}


	public User(int userid, String username, String password, String email, int usersort) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.email = email;
		this.usersort = usersort;
	}


	public User() {
		// TODO Auto-generated constructor stub
	}

}
