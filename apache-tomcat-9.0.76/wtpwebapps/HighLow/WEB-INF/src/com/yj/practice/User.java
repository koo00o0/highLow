package com.yj.practice;

public class User {

	String id;
	String pw;
	String name;
	
	int gameCount = 0;
	int startNum = 1;
	int endNum = 100;
	int inputNum = 0;
	
	public User(String id,String pw, String name) {
		this.id = id;
		this.pw = pw;
		this.name = name;
	}
	
	
	public User() {
		
	}
	String manipulation = "no";
	int ratioNum = 0;
	
	int ratioRannum = (int)(Math.random()*100+1);
	int gameRannum = (int)(Math.random()*100+1);
	int winRannum = (int)(Math.random()*4+2);
	
	
	public void Rshuffle() {
		this.ratioRannum = (int)(Math.random()*100+1);
	}
	public void Gshuffle() {
		this.gameRannum = (int)(Math.random()*100+1);
	}
	public void Wshuffle() {
		this.winRannum = (int)(Math.random()*4+2);
	}

 }

