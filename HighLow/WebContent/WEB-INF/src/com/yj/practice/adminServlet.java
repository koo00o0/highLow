package com.yj.practice;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;

public class adminServlet  extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("ID");
		String check = req.getParameter("CHECK");
		String mani = req.getParameter("MANI");
		
		User u = null;
		System.out.println("왜 안들어와 ?");
		if(check.equals("IDCHECK")) {
			System.out.println("아이디체크들어옴?");
			for(int i=0; i<loginServlet.userList.size();i++) {
				u = loginServlet.userList.get(i);
				System.out.println("123123123");
			}
				if(u.id.equals(id)) {
					System.out.println();
					String result ="T^"+u.name;
					resp.getWriter().print(result);
				   return;
				}else {
					System.out.println("아이디를 못찾는 건가?");
					return;
				}
			
			
		}else if(check.equals("MANICHECK")) {
			if(mani.equals("on")) {
				for(int i=0; i<loginServlet.userList.size();i++) {
					u = loginServlet.userList.get(i);
					if(u.id.equals(id)) {
						u.manipulation = "yes";
						resp.getWriter().print("T^"+u.id);
						break;
					}
				}
			}else if(mani.equals("off")) {
				for(int i=0; i<loginServlet.userList.size();i++) {
					u = loginServlet.userList.get(i);
					if(u.id.equals(id)) {
						u.manipulation = "no";
						resp.getWriter().print("F^"+u.id);
						break;
					}
				}
			}
		}
		
		else if(check.equals("SAVE")) {
			int ratio = Integer.parseInt(req.getParameter("RATIO"));
			for(int i=0; i<loginServlet.userList.size();i++) {
				u = loginServlet.userList.get(i);
				if(u.id.equals(id)) {
					u.ratioNum = ratio;
					resp.getWriter().print(u.id+"^"+u.name+"^"+u.ratioNum);
					break;
				}
			}
		}
		
		
		
		
		
	}
}
