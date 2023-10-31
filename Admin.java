package com.thchoi.game;

import java.util.Scanner;

public class Admin {

	String adminId = "admin";
	String adminPw = "1234";
	String manipulation = "no";
	
	int ratioNum = 10;
	int gameMoney = 2000;
	
	Scanner scan = new Scanner(System.in);
	
	
	
	public void Adminlogin(Money m, Game g) {
		System.out.println("-------------------------------");
		System.out.println("##관리자 페이지에 진입합니다.");
		System.out.println("관리자 ID를 입력해주세요.");
		String aId = scan.next();
		System.out.println("관리자 비밀번호를 입력해주세요.");
		String aPw = scan.next();
		System.out.println("-------------------------------");
		if(aId.equals(adminId)&&aPw.equals(adminPw)) {
			Adminpage(m,g);
			
		}else {
			System.out.println("-------------------------------");
			System.out.println("로그인에 실패하였습니다. 홈으로 돌아갑니다.");
			System.out.println("-------------------------------");
		}
	}
	
	
	
	private void Adminpage(Money m, Game g) {
		adminout : while(true) {
			System.out.println("---------------------------------------");
			System.out.println("1. 오늘의 매출 확인");
			System.out.println("2. 게임조작 on/off => 게임 시작금액 및 유저 승률 조작");
			System.out.println("3. 게임 배율변경");
			System.out.println("4. 게임 숫자범위 변경");
			System.out.println("0. 관리자 페이지 나가기");
			System.out.println("---------------------------------------");
			
			int adminChoice = scan.nextInt();
			if(adminChoice==1) {
				Adminmoney(m);
			}else if(adminChoice==2) {
				Manipulation();
			}else if(adminChoice==3) {
				Magnification(g);
			}else if(adminChoice==4) {
				Gamecount(g);
			}else if(adminChoice==0) {
				System.out.println("유저페이지로 돌아갑니다.");
				break adminout;
			}else {
				System.out.println("옳바른 숫자를 입력해주세요.");
			}
		}
	}
	
	public void Adminmoney(Money m) {
		System.out.println("오늘의 매출은 ["+m.adminMoneybox+"]원 입니다.");
	}
	
	public void Manipulation() {
		
		System.out.println("공정한 게임을 하시려면 no, 게임조작모드를 키시려면 yes를 입력해주세요.");
		manipulation = scan.next();
		
		if(manipulation.equals("yes")) {
			System.out.println("게임 시작금액을 변경하여 주십시오.");
			gameMoney = scan.nextInt();
			System.out.println("유저의 승률을 입력하여 주십시오.");	
			ratioNum = scan.nextInt();	
			System.out.println("변경이 완료되었습니다. 현재 게임시작금액 ["+gameMoney+"] ,승률 :[" +ratioNum+"]% 입니다.");
		}else if(manipulation.equals("no")) {
			
		}else {
			System.out.println("옳바른 값을 입력해주세요.");
		}
		
	}
	
	public void Magnification(Game g) {
		System.out.println("게임의 배율을 변경해주세요.");
		g.magnification = scan.nextInt();
		System.out.println("변경이 완료되었습니다. 배율은 ["+g.magnification+"]배 입니다.");
	}
	
	public void Gamecount(Game g) {
		System.out.println("숫자의 범위를 변경해주세요.");
		g.gameCount = scan.nextInt();
		System.out.println("변경이 완료되었습니다. 숫자의 범위는 [1~"+g.gameCount+"] 입니다.");
	}
	
	
	
}
