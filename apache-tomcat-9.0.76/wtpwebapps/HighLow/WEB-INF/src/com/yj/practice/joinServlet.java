package com.yj.practice;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTMLDocument.HTMLReader.SpecialAction;

public class joinServlet extends HttpServlet{
   
   @Override
   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      
      String id = req.getParameter("ID");
      String pw = req.getParameter("PW");
      String name = req.getParameter("NAME");
      String check = req.getParameter("CHECK");
      
      boolean isFail = false;
      RequestDispatcher rd = null;
      User u = new User(id,pw,name);
      req.setCharacterEncoding("UTF-8");
      resp.setContentType("text/html; UTF-8");
      System.out.println(u.name);
      System.out.println(check);
      if(check==null){
         
         System.out.println("회원가입 진입");
         
         
         if(loginServlet.userList.size()==0 ) {
        	 System.out.println("회원가입 성공..");
             loginServlet.userList.add(new User(id,pw,name));
             rd=req.getRequestDispatcher("/index.html");
        	 
     	 
        }else {
            for(int i=0; i<loginServlet.userList.size(); i++) {
                System.out.println("회원가입 들어가보자!!");
                u=loginServlet.userList.get(i);
                
                if(id.equals(u.id)) {
                	isFail = true;
                }
            }
	        	if(isFail) {
	             System.out.println(id);
	             System.out.println(u.id);
	             System.out.println("회원가입 실패..");
	             rd=req.getRequestDispatcher("/html/userJoin.html");

	        	} else{
	              System.out.println("회원가입 성공..");
	              loginServlet.userList.add(new User(id,pw,name));
	              rd=req.getRequestDispatcher("/index.html");
	              System.out.println(loginServlet.userList.size());
		        }
            
        } 
         rd.forward(req, resp);
      }else {
         System.out.println("중복확인");
         if(loginServlet.userList.size()==0) {      
            resp.getWriter().print("T");
            System.out.println("중복환인 잘되냐??");
         }else {
            for(int i=0; i<loginServlet.userList.size();i++) {
               u=loginServlet.userList.get(i);
               if(id.equals(u.id)) {
            	   isFail = true;
               }
            }
               System.out.println(u.id);
               System.out.println(id);
               if(isFail) {
                  resp.getWriter().print("F");   
               }else {
                  resp.getWriter().print("T");
               }
            
         }
      }
   }
   
	public boolean Idcheckb(String id) {
	    for(int i=0; i<loginServlet.userList.size(); i++) {
	        User u = loginServlet.userList.get(i);
	        if(id.equals(u.id)) {
	            return true;
	        }
	        // u.id 찾는값 id입력값 u.id가 돌면서 찾다가 같은 값이 있으면 return
	    }
	    return false;
	}
	public User Idchecka(String id) {
		for(int i=0; i<loginServlet.userList.size();i++) {
			User u = loginServlet.userList.get(i);
			if(id.equals(u.id)) {
				return u;
			}
		}

		User ua = null;
		return ua; 
	}
   
   
}