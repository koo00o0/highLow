package com.thchoi.game;

import java.util.Scanner;

public class Game {

	Scanner scan = new Scanner(System.in);
	
	int cardArray = 100;
	int magnification  = 5;
	int gameCount = 5;
	int inputMoney= 0;
	
	
	
	//게임 입장료
	public void Admissiongame(Money m,Admin a) {
		System.out.println("-------------------------------------");
		System.out.println("현재 보유 금액은 ["+m.userMoney+"] 원 입니다.");
		System.out.println("배팅하실 금액을 입력하여 주십시오.");
		inputMoney = scan.nextInt();
		if(inputMoney<=m.userMoney) {
			m.userMoney-=inputMoney;
			m.adminMoneybox +=inputMoney;
			System.out.println("결제가 완료되었습니다. 현재 잔액 ["+m.userMoney+"] 원입니다.");
			System.out.println("게임에서 승리시 ["+(inputMoney*magnification)+"] 원을 획득합니다.");
			Startgame(m,a);
		}else {
			System.out.println("보유하신 금액이 ["+(m.userMoney-inputMoney)+"] 원 부족합니다.");
			System.out.println("충전 후 이용바랍니다.");
		}
	}
	
	//게임시작
	private void Startgame(Money m,Admin a) {
		
		System.out.println("*********************************");
		System.out.println("하이로우 게임이 시작되었습니다!!!");
		System.out.println("1~"+cardArray+" 의 숫자를 입력해주세요.");
		System.out.println("*********************************");
		if(a.manipulation.equals("no")) {
			Nomalgame(m);
			//정상적인 게임
		}else if(a.manipulation.equals("yes")){
			//승률조작이 들어간게임
			int ranRationum = (int)((Math.random()*100)+1);
			if(ranRationum>a.ratioNum) {
				//지는게임
				Losegame(m);
			}else if(ranRationum<=a.ratioNum) {
				//이기는게임
				Wingame(m);
			}
		}
	}
	
	//정상적인 게임
	private void Nomalgame(Money m) {
		int ranNum = (int)((Math.random()*100)+1);
		for(int i=0; i<gameCount; i++) {
			int selectNum = scan.nextInt();
			// 기회가 끝났을 때
			if(gameCount==i+1) {
				System.out.println("["+(i+1)+"] 번의 기회가 끝났습니다."+"정답은 : ["+ranNum+"] 입니다.");
			}else if(gameCount==i+2){
			// 마지막 기회일 때
				if(ranNum==selectNum) {
					System.out.println("축하드립니다 정답입니다!!"+(inputMoney*magnification)+"원이 지급됩니다.");
					m.userMoney= m.userMoney+(inputMoney*magnification);
					m.adminMoneybox -=inputMoney;
				}else if(ranNum>selectNum) {
					System.out.println("<@입력하신 숫자가 정답보다 낮습니다@>");
					System.out.println(gameCount-(i+1)+"번 남았습니다."+"!!!마지막 기회입니다!! 신중히 선택해주세요.");
				}else if(ranNum<selectNum) {
					System.out.println("<@입력하신 숫자가 정답보다 큽니다@>");
					System.out.println(gameCount-(i+1)+"번 남았습니다."+"!!!마지막 기회입니다!! 신중히 선택해주세요.");
				}
			}else {
			// 나머지의 경우
				if(ranNum==selectNum) {
					System.out.println("축하드립니다 정답입니다!!"+(inputMoney*magnification)+"원이 지급됩니다.");
					m.userMoney= m.userMoney+(inputMoney*magnification);
					m.adminMoneybox -=inputMoney;
				}else if(ranNum>selectNum) {
					System.out.println("<@입력하신 숫자가 정답보다 낮습니다@>");
					System.out.println(gameCount-(i+1)+"번 남았습니다!!");
				}else if(ranNum<selectNum) {
					System.out.println("<@입력하신 숫자가 정답보다 큽니다@>");
					System.out.println(gameCount-(i+1)+"번 남았습니다!!");
				}
			}
		}
	}
	
	

	//(유저)무조건 이기는 게임
	private void Wingame(Money m) {
		int ranNum = (int)((Math.random()*(gameCount-1))+1);
		int endNum = cardArray;
		int startNum = 1;
		for(int i=0;i<gameCount;i++) {
			int selectNum = scan.nextInt();
			int arrayNum = (endNum+startNum)/2;
			
			if(ranNum==i) {
				System.out.println("축하드립니다 정답입니다!!"+(inputMoney*magnification)+"원이 지급됩니다.");
				m.userMoney= m.userMoney+(inputMoney*magnification);
				m.adminMoneybox -=inputMoney;
				break;
			}else {
				if(selectNum<arrayNum) {
					System.out.println("<@입력하신 숫자가 정답보다 작습니다. 더 큰 숫자를 입력해주세요.@>");
					System.out.println(gameCount-(i+1)+"번 남았습니다!!");
					if(selectNum>=startNum) {
						startNum = selectNum;
					}
				}else if(selectNum>=arrayNum) {
					System.out.println("<@입력하신 숫자가 정답보다 큽니다 더 작은 숫자를 입력해주세요.@>");
					System.out.println(gameCount-(i+1)+"번 남았습니다!!");
					if(selectNum<=endNum) {
						endNum = selectNum;
					}
				}
			}
		}
	}

	
	
	//(유저)무조건 지는 게임
	private void Losegame(Money m) {
		int endNum = cardArray;
		int startNum = 1;
		for(int i=0;i<gameCount;i++) {
			int selectNum = scan.nextInt();
			int arrayNum = (endNum+startNum)/2;
			if(selectNum<arrayNum) {
				if(gameCount==i+1) {
					if(selectNum>=startNum) {
						startNum = selectNum;
					}
				}else {
					System.out.println("<@입력하신 숫자가 정답보다 작습니다. 더 큰 숫자를 입력해주세요.@>");
					System.out.println(gameCount-(i+1)+"번 남았습니다!!");
					if(selectNum>=startNum) {
						startNum = selectNum;
					}
				}
			}else if(selectNum>=arrayNum) {
				if(gameCount==i+1) {
					if(selectNum<=endNum) {
						endNum = selectNum;
					}
				}else {
					System.out.println("<@입력하신 숫자가 정답보다 큽니다 더 작은 숫자를 입력해주세요.@>");
					System.out.println(gameCount-(i+1)+"번 남았습니다!!");
					if(selectNum<=endNum) {
						endNum = selectNum;
					}
				}
			}
			if(gameCount==i+1) {
				int resultNum = startNum+((endNum-startNum)/2);
				System.out.println("["+(i+1)+"] 번의 기회가 끝났습니다."+"정답은 : ["+resultNum+"] 입니다.");
			}
		}
	}	
	
	
	
	
	
	
}
