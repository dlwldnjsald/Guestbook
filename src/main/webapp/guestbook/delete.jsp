<%@page import="himedia.vo.GuestbookVo"%>
<%@page import="java.sql.*"%>

<%@page import="himedia.dao.GuestbookDaoOracleImpl"%>
<%@page import="himedia.dao.GuestbookDao"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- delete.jsp: 실제로 방명록 항목을 삭제하는 페이지입니다. 
	사용자가 입력한 비밀번호를 확인하고, 
	올바른 비밀번호인 경우에만 해당 방명록 항목을 삭제합니다.
	
	delete.jsp에서는 올바른 비밀번호를 입력받았는지 확인하고, 삭제를 진행합니다. 
	이후 삭제가 성공했는지에 따라 적절한 응답을 제공해야 합니다. --%>

<%
	try {
		// Retrieve parameters 비번, 방명록번호no
		String password = request.getParameter("password");
		
		Long no = null;
	    try {
	        no = Long.parseLong(request.getParameter("no"));
	    } catch (NumberFormatException e) {
	        throw new Exception("유효하지 않은 번호입니다.");
	    }
	
		// db연결 정보 획득 : ServletContext를 사용
		ServletContext context = getServletContext();
		String dbuser = context.getInitParameter("dbuser");
		String dbpass = context.getInitParameter("dbpass");
	
		// instance
		GuestbookDao dao = new GuestbookDaoOracleImpl(dbuser, dbpass);
	
		// Delete 메서드 호출
		boolean success = dao.delete(no);

			if (success) {
				// Redirect :방명록 목록 페이지로 리다이렉션
				response.sendRedirect(request.getContextPath() + "guestbook/list.jsp");
			
			} else {
				// error 
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
