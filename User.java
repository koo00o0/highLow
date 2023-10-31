package com.thchoi.game;

import java.util.Scanner;

public class User {
	String userName;
	String userId;
	String userPw;
	
	Scanner scan = new Scanner(System.in);
	
	
	
	public void Userlogin(Money m,Admin a,Game g) {
		 while(true) {
			System.out.println("-------------------------------");
			System.out.println("로그인창입니다.");
			System.out.println("-------------------------------");
			System.out.println("ID를 입력해주세요.");
			String uId = scan.next();
			System.out.println("비밀번호를 입력해주세요.");
			String uPw = scan.next();
			System.out.println("-------------------------------");
			if(uId.equals(userId)&&uPw.equals(userPw)) {
				System.out.println("-------------------------------");
				System.out.println(userName+"님 환영합니다. 즐거운 시간 되십시오.");
				System.out.println("-------------------------------");
				Userpage(m,a,g);
			}else {
				System.out.println("-------------------------------");
				System.out.println("로그인에 실패하였습니다. 다시 로그인해주세요.");
				System.out.println("-------------------------------");
			}
		
		}
	}
	
	public void Userpage(Money m,Admin a,Game g) {
		while(true) {
			System.out.println("---------------------------------------");
			System.out.println("현재금액 : ["+m.userMoney+"] 원");
			System.out.println("---------------------------------------");
			System.out.println("1. 게임입장       입장료 : ["+a.gameMoney+"]원 / 배율:["+g.magnification+"]배");
			System.out.println("2. 입금하기");
			System.out.println("3. 현금 인출하기");
			System.out.println("---------------------------------------");
			int menuChoice = scan.nextInt();
			if(menuChoice==1) {
				if(a.gameMoney<=m.userMoney) {
					m.userMoney = m.userMoney - a.gameMoney;
					m.adminMoneybox = m.adminMoneybox + a.gameMoney;
					g.Admissiongame(m,a);
				}else {
					System.out.println("입장료가 부족합니다. 충전 후 이용바랍니다.");
				}
			}else if(menuChoice==2) {
				//유저 입금(돈 충전)
				m.Moneycharge();
			}else if(menuChoice==3) {
				//유저 현금인출
				m.Withdrawal();
			}else if(menuChoice==123) {
				//관리자 페이지 입장
				a.Adminlogin(m,g);
			}else {
				System.out.println("옳바른 메뉴를 선택해주세요.");
			}
			
		}
		
	}
	
	
	
	
	
	
	
	
	
}
