package com.highlow.practice;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/main")
public class LoginServlet extends HttpServlet {
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(" 로그,인 페이지");
//		String id = req.getParameter("ID");
//		System.out.println(id);
//		String pw = req.getParameter("PW");
//		User u = new User();
//		RequestDispatcher rd = null;
//		
//		for(int i=0; i<User.userList.size();i++) {
//			u = User.userList.get(i);
//			
//			if(u.id.equals(id) && u.pw.equals(pw)) {
//				
//				System.out.println(u.id);
//				System.out.println("회원가입 완료");
//				rd=req.getRequestDispatcher("/jsp/game.jsp");
//				break;
//			}else {
//				System.out.println("회원가입 실패");
//				rd=req.getRequestDispatcher("/html/LoginPage.html");
//
//			}
//		}
//		rd.forward(req, resp);
		
		
		req.setCharacterEncoding("UTF-8");	
		Connection conn=null;
		//DB연동 객체 생성
		
		PreparedStatement pstmt=null;
		//SQL문을 데이터베이스에 보내기위한 객체
		
		ResultSet rs = null;
		//SQL 질의에 의해 생성된 테이블을 저장하는 객체
		
		RequestDispatcher rd = null;
		try {
						
		    // 1. 클라이언트에서 전송한 아이디와 비밀번호를 가져온다.
		    String id = req.getParameter("id");
		    String pw = req.getParameter("pw");
			System.out.println(id);
			System.out.println(pw);
            User u = new User();
            u.setId(id);
            u.setPw(pw);
			String jdbcDriver = "oracle.jdbc.driver.OracleDriver";
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
			String jdbcUsername = "highlow";
			String jdbcUserpassword = "1234";
		    Class.forName(jdbcDriver);

		    // 2. 데이터베이스에서 아이디에 해당하는 사용자의 정보를 가져온다.
		    conn = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcUserpassword);
		    pstmt = conn.prepareStatement("SELECT * FROM USERLIST WHERE id =? AND pw =?");
		    System.out.println(u.getId());
		    pstmt.setString(1, u.getId());
		    pstmt.setString(2, u.getPw());
		    rs = pstmt.executeQuery();
		    //쿼리 실행문 

		    // 3. 사용자의 비밀번호를 가져와서 입력된 비밀번호와 비교한다.
		        if (rs.next()) {
		            // 4. 로그인에 성공하면 세션에 사용자 정보를 저장한다.
//		            User u = new User();
//		            u.setId(id);
//		            u.setPw(pw);
//		            user.setName(rs.getString("name"));
		        	System.out.println("로그인 성공");
		            HttpSession session = req.getSession();
		            session.setAttribute("session_id", u.getId());
//		            req.getSession().setAttribute("session_id", u.getId());
		            resp.sendRedirect("jsp/game.jsp");
		            return;
		        }
		    // 로그인에 실패한 경우
		    req.setAttribute("error", "아이디 또는 비밀번호가 잘못되었습니다.");
//		    req.getRequestDispatcher("html/LoginPage.html").forward(req, resp);
            resp.sendRedirect("html/LoginPage.html");

        	System.out.println("로그인 실패");
		} catch (Exception e) {
		    e.printStackTrace();
		    // 예외 처리
		} finally {
		    try {
		        if (rs != null) rs.close();
		        if (pstmt != null) pstmt.close();
		        if (conn != null) conn.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
	}
}
