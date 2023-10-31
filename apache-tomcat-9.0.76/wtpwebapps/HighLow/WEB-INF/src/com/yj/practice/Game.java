package com.yj.practice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Game extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			

		String session_id = (String)req.getSession().getAttribute("USERID");
		joinServlet j = new joinServlet();
		boolean isSuccess = false;
		RequestDispatcher rd = null; 	
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		if(j.Idcheckb(session_id)) {
			isSuccess = true;	
		}
		
        if(isSuccess) {
        	User u = j.Idchecka(session_id);
			int startNum = Integer.parseInt(req.getParameter("startNum"));
			int endNum = Integer.parseInt(req.getParameter("endNum"));
			int gameCount = Integer.parseInt(req.getParameter("gameCount"));
			int inputNum = Integer.parseInt(req.getParameter("inputNum"));
			
			u.startNum=startNum;
			u.endNum=endNum;
			u.inputNum=inputNum;
			u.gameCount=gameCount+1;
			System.out.println("왜 안들어가?????");
			
			if(u.manipulation.equals("no")) {
				System.out.println("정상적인 게임 진입");
				String result = Nomalgame(u);
				resp.getWriter().print(result);

			}else if(u.manipulation.equals("yse")) {
				System.out.println("조작된 게임에 진입");
				if(u.ratioNum>u.ratioRannum) {
					System.out.println("이기는 게임 진입");
					String result = Wingame(u);
					resp.getWriter().print(result);
					
				}else if(u.ratioNum<u.ratioRannum) {
					System.out.println("지는 게임 진입");
					String result = Losegame(u);
					resp.getWriter().print(result);
				}
			}
        }
	}
	public String Nomalgame(User u) {
		String result_nomalGame = "";
		
		if(u.gameRannum==u.inputNum) {
			//정답~!	
			u.gameCount = 0;
			u.startNum = 1;
			u.endNum = 100;
			result_nomalGame = u.gameCount+"^"+u.startNum+"^"+u.endNum+"^정답입니다!!";
			u.Gshuffle();
		}else if(u.gameCount==5) {
			u.gameCount = 0;
			u.startNum = 1;
			u.endNum = 100;
			result_nomalGame = u.gameCount+"^"+u.startNum+"^"+u.endNum+"^기회가 모두 소진되었습니다. 정답은["+u.gameRannum+"]입니다.";		
			u.Gshuffle();
		}else if(u.gameRannum>u.inputNum) {
			u.startNum = u.inputNum;
			result_nomalGame = u.gameCount+"^"+u.startNum+"^"+u.endNum+"^입력한 값보다 큰 숫자입니다.";
		//입력한 값보다 큽니다
		}else{
			u.endNum = u.inputNum;
			result_nomalGame = u.gameCount+"^"+u.startNum+"^"+u.endNum+"^입력한 값보다 작은 숫자입니다.";
		//입력한 값보다 작습니다.
		}
		return result_nomalGame;
	}
	
	public String Wingame(User u) {
		
		String result_winGame = "";
		int middleNum= (u.startNum+u.endNum)/2;
		
		if(middleNum>u.inputNum) {
			u.startNum=u.inputNum;
			result_winGame= u.gameCount+"^"+u.startNum+"^"+u.endNum+"^입력한 값보다 큰 숫자입니다.";
		}else if(middleNum<u.inputNum){
			u.endNum=u.inputNum;
			result_winGame= u.gameCount+"^"+u.startNum+"^"+u.endNum+"^입력한 값보다 작은 숫자입니다.";

		}else if(u.winRannum == u.gameCount) {
			u.gameCount = 0;
			u.startNum = 1;
			u.endNum = 100;
			result_winGame = u.gameCount+"^"+u.startNum+"^"+u.endNum+"^정답입니다!!";
			u.Wshuffle();
			u.Rshuffle();
		}
		return result_winGame;
		
	}
	
	
	public String Losegame(User u) {
		
		String result_Losegame = "";
		int middleNum= (u.startNum+u.endNum)/2;
		int LosegameResult = u.startNum+(u.endNum-u.startNum)/2;

		if(middleNum>u.inputNum) {
			u.startNum=u.inputNum;
			result_Losegame= u.gameCount+"^"+u.startNum+"^"+u.endNum+"^입력한 값보다 큰 숫자입니다.";
		}else if(middleNum<u.inputNum){
			u.endNum=u.inputNum;
			result_Losegame= u.gameCount+"^"+u.startNum+"^"+u.endNum+"^입력한 값보다 작은 숫자입니다.";
		
		}else if(u.gameCount==5) {
			u.gameCount = 0;
			u.startNum = 1;
			u.endNum = 100;
			result_Losegame = u.gameCount+"^"+u.startNum+"^"+u.endNum+"^기회가 모두 소진되었습니다. 정답은["+LosegameResult+"]입니다.";
			u.Rshuffle();
		}
		return result_Losegame;
	}
			

			
			
			
			
			
	
}
