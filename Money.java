package com.thchoi.game;

import java.util.Scanner;

public class Money {
	
	Scanner scan = new Scanner(System.in);

	
	//user 돈
	int userMoney = 1000;
	
	
	// admin 매출
	int adminMoneybox = 0;
	
	
	
	
	
	
	//유저 돈 충전
	public void Moneycharge() {
		System.out.println("충전할 금액을 입력해주세요.");
		int moneyC = scan.nextInt();
		userMoney += moneyC;
	}
	
	//유저 현금 인출
	public void Withdrawal() {
		System.out.println("인출하실 금액을 입력하여 주십시오.");
		int drawalMoney = scan.nextInt();
		if(userMoney>1000000) {
			System.out.println("관리자 승인 후 인출을 도와드리도록 하겠습니다.");
		}else {
			System.out.println(" ["+drawalMoney+"] 원 인출이 완료되었습니다.");
			userMoney -= drawalMoney;
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
