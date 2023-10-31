package com.highlow.practice;

import java.util.ArrayList;

public class User {
	public static ArrayList<User> userList = new ArrayList<User>();
	
	String id;
	String pw;
	String name;
	
	public User(String id,String pw,String name) {
		this.id = id;
		this.pw = pw;
		this.name = name;
	}
	public User() {
		
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
