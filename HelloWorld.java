package com.thchoi.game;

import java.util.Scanner;

public class HelloWorld {

	public static void main(String[] args) {
	
	Scanner scan = new Scanner(System.in);	
		
	User u = new User();
	Money m = new Money();
	Admin a = new Admin();
	Game g = new Game();
		
	System.out.println("아이디를 생성해주세요.");
	u.userId = scan.next();
	System.out.println("비밀번호를 생성해주세요.");
	u.userPw = scan.next();
	System.out.println("이름을 입력해주세요.");
	u.userName = scan.next();
					
	
	u.Userlogin(m,a,g);
		
		
	}
}