package com.highlow.practice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("들어옴?");
		String cmd = req.getParameter("cmd");
		RequestDispatcher rd =null;

		if(cmd.equals("check")) {
			idCheck(req,resp);
			System.out.println("어디가?");
			return;
		}else if(cmd.equals("join")) {
			System.out.println("회원가입 완료 로직");
			loginJoin(req,resp);
			return;
		}
	}

	public void idCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("중복체크 들어옴?");
		String id = req.getParameter("ID");
		System.out.println("id : " + id);
		User u = new User();
		boolean isFail = false;
		System.out.println("user list size : " + User.userList.size());
		
		if(User.userList.size()==0) {
			System.out.println("123123");
			resp.getWriter().print("T");
			return;
		} 
		for(int i=0; i<User.userList.size();i++) {
			
			u=User.userList.get(i);
			System.out.println(u.id + "," + id);
			if(u.id.equals(id)) {
				isFail = true;
				break;
			}
		}	
		if(isFail) {
			System.out.println("아이디 중복");
			resp.getWriter().print("F");
		}else {
			resp.getWriter().print("T");
		}
	}
//	public void loginJoin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("회원가입 페이지");
//		String id = req.getParameter("ID");
//		String pw = req.getParameter("PW");
//		String name = req.getParameter("NAME");
//		User u = new User(id,pw,name);
//		boolean isFail = false;
//
//		if(User.userList.size()==0) {
//			User.userList.add(new User(id,pw,name));
//			resp.getWriter().print("T");
//		}else {
//			for(int i=0; i<User.userList.size();i++) {	
//				System.out.println(u.id);
//				u=User.userList.get(i);
//				if(u.id.equals(id)) {
//					isFail = true;
//					break;
//				}
//			}
//			if(isFail) {
//				System.out.println("회원가입 불가능");
//				resp.getWriter().print("F");
//			}else {	
//				System.out.println("아이디 잘 들어가 ???");
//				System.out.println(u.id);
//
//				User.userList.add(new User(id,pw,name));
//				System.out.println(User.userList.size());
//				System.out.println(id);
//				resp.getWriter().print("T");
//			}
//		}
//	}
	public void loginJoin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("데이터베이스 들어옴???");
		req.setCharacterEncoding("UTF-8");
		String id =req.getParameter("ID");
		String pw = req.getParameter("PW");
		String name = req.getParameter("NAME");
	    Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
	        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	        String jdbcUsername = "highlow";
	        String jdbcPassword = "1234";
	        Class.forName(jdbcDriver);
//	        Connection conn = DriverManager.getConnection(jdbcUrl);
	        conn = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
		       
	        pstmt= conn.prepareStatement("SELECT * FROM USERLIST WHERE id = ?");
	        //"id" 열이 지정된 값과 일치하는 모든 열을 선택
	        pstmt.setString(1, id);
	        //id값이 ?에 해당하는 부분에 문자열 id를 설정
	        rs = pstmt.executeQuery();
	        //ResultSet 객체는 행(row) 단위로 데이터를 읽을 수 있음

	        if (rs.next()) { // 이미 존재하는 아이디인 경우
		            System.out.println("회원가입 실패");
		            resp.getWriter().print("F");
		        } else { // 새로운 아이디인 경우
		        	System.out.println("사용가능");
		            pstmt = conn.prepareStatement("INSERT INTO USERLIST (id, pw, name) VALUES (?, ?, ?)");
		            // 쿼리를 실행하기 위해 prepareStatement 객체 생성을 하고 
		            pstmt.setString(1, id);
		            pstmt.setString(2, pw);
		            pstmt.setString(3, name);
		            pstmt.executeUpdate();

//		            resp.getWriter().print("T");
		        }
	        System.out.println("id: "+id+"pw: "+pw+"name: "+name);
	        pstmt.close();
	        conn.close(); // 수정된 부분: Connection 객체를 닫는 코드 추가
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		resp.getWriter().print("T");
		
	}
}
