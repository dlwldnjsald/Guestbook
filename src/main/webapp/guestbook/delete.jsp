<%@page import="himedia.vo.GuestbookVo"%>
<%@page import="java.sql.*"%>

<%@page import="himedia.dao.GuestbookDaoOracleImpl"%>
<%@page import="himedia.dao.GuestbookDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
try {
	// Retrieve parameters
	String password = request.getParameter("password");
	Long no = Long.parseLong(request.getParameter("no"));

	// db
	ServletContext context = getServletContext();
	String dbuser = context.getInitParameter("dbuser");
	String dbpass = context.getInitParameter("dbpass");

	// instance
	GuestbookDao dao = new GuestbookDaoOracleImpl(dbuser, dbpass);
	GuestbookVo vo = dao.getNo(no);

	// Delete 
	boolean success = dao.delete(no);

	if (success) {
		// Redirect if successful
		response.sendRedirect("list.jsp");
	} else {
		// Display error message if deletion fails
		out.println("<h1>Error</h1>");
		out.println("<p>삭제를 실패하였습니다.</p>");
	}
} catch (NumberFormatException e) {
	// Handle NumberFormatException
	out.println("<h1>Error</h1>");
	out.println("<p>유효하지 않은 번호입니다.</p>");
} catch (NullPointerException e) {
	// Handle NullPointerException
	out.println("<h1>Error</h1>");
	out.println("<p>게시물을 찾을 수 없습니다.</p>");
} catch (Exception e) {
	// Handle other exceptions
	out.println("<h1>Error</h1>");
	out.println("<p>서버 오류가 발생했습니다.</p>");
	e.printStackTrace();
}
%>
