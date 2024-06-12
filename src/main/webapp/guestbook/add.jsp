<%@ page import="java.sql.*" %>
<%@page import="jakarta.servlet.http.HttpServletResponse" %>

<%@page import="himedia.dao.GuestbookDao"%>
<%@ page import="himedia.dao.GuestbookDaoOracleImpl" %>
<%@ page import="himedia.vo.GuestbookVo" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- add.jsp: 방명록에 새로운 항목을 추가하는 페이지입니다
. 	사용자는 이름, 비밀번호, 내용을 입력하여 
	방명록에 추가할 수 있습니다.
	
	add.jsp에서는 사용자로부터의 입력을 받고, 
	이를 데이터베이스에 추가해야 합니다. 
	이를 위해서는 사용자가 제출한 데이터가 유효한지 확인하는 로직이 필요합니다. 
	또한, 제출된 데이터를 데이터베이스에 추가하는 기능을 구현해야 합니다.--%>

<%
	// DB 접속 정보 확인
	ServletContext context = getServletContext();
	String dbuser = context.getInitParameter("dbuser");
	String dbpass = context.getInitParameter("dbpass");

	
	//	폼 입력 데이터	
	String names = request.getParameter("name");
	String passwords = request.getParameter("pass");
	String contents = request.getParameter("content");
	
	
	//GuestbookVo 객체 vo를 생성하고, 위 파라미터 담아주기
	GuestbookVo vo = new GuestbookVo(names, passwords, contents);
	//GuestbookDaoOracleImpl 객체 dao를 생성한 후에, 
	GuestbookDao dao = new GuestbookDaoOracleImpl(dbuser, dbpass);
	
	//성공시 dao객체에 위의 vo객체를 사용하여 insert수행위한 호출
	boolean success = dao.insert(vo);
	
	if (success) { //	INSERT 성공시 리다이렉트 to "/guestbook/"
		response.sendRedirect(request.getContextPath() + "/guestbook/");
	
	}else {
		response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "데이터 입력 중 오류가 발생했습니다.");
	}
		
		
%>