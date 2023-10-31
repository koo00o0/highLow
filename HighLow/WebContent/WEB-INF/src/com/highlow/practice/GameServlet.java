package com.highlow.practice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/game")
public class GameServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cmd = req.getParameter("cmd");
		if(cmd.equals("nomalGame")) {
			nomalGame(req,resp);
			return;
		}
	}
	public void nomalGame(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Admin a = new Admin();
		
		int gameCount = Integer.parseInt("gameConut");
		gameCount += 1; 
		
		if(gameCount==5) {
			System.out.println("게임 기회 소진");
		}else if(a.randomNum>a.inputNum) {
			System.out.println("숫자 up");
			
			
		}
		
		
	}
}
