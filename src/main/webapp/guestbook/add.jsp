<%@ page import="java.sql.*" %>

<%@page import="himedia.dao.GuestbookDao"%>
<%@ page import="himedia.dao.GuestbookDaoOracleImpl" %>
<%@ page import="himedia.vo.GuestbookVo" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// DB 접속 정보 확인
	ServletContext context = getServletContext();

	String dbuser = context.getInitParameter("dbuser");
	String dbpass = context.getInitParameter("dbpass");

	
	//	폼 입력 데이터	
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String content = request.getParameter("content");
	
	
	GuestbookVo vo = new GuestbookVo(name, pass, content);
	GuestbookDao dao = new GuestbookDaoOracleImpl(dbuser, dbpass);
	
	boolean success = dao.insert(vo);
	
	if (success) {
		response.sendRedirect(request.getContextPath() + "/guestbook/");
	
	}else {
		
			%>
			<h1>Error</h1>
			<p>데이터 입력 중 오류가 발생했습니다</p>
			<%
			
	}

%>