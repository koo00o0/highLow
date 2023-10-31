package com.yj.practice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;

public class loginServlet  extends HttpServlet{

	public static ArrayList<User> userList = new ArrayList<User>(); 
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String id = req.getParameter("ID");
	String pw = req.getParameter("PW");
	String name = req.getParameter("name");

	 User u =new User(id,pw,name);
	 RequestDispatcher rd = null;
     req.setCharacterEncoding("UTF-8");
     
	 System.out.println("시작");

		for(int i=0;i<loginServlet.userList.size();i++) {
			u = loginServlet.userList.get(i);
				System.out.println("로그인 아이디 입력전");
				
			if( id.equals(u.id) && pw.equals(u.pw) ) {	
				System.out.println("로그인 성공");
				HttpSession session = req.getSession();
				session.setAttribute("USERID", u.id);
				rd = req.getRequestDispatcher("/html/highLow.html");
				System.out.println(loginServlet.userList.size());
				
				break;
			}else {
				System.out.println("로그인 실패..");
				rd=req.getRequestDispatcher("/index.html");
				System.out.println(loginServlet.userList.size());
			}
		}
		
			rd.forward(req, resp);
		

	}
}
