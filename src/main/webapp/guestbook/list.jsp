
<%@page import="himedia.vo.GuestbookVo"%>
<%@page import="java.util.List"%>
<%@page import="himedia.dao.GuestbookDao"%>
<%@page import="himedia.dao.GuestbookDaoOracleImpl"%>
<%@page import="java.sql.*" %>

<%
//	DB 접속 정보를 컨텍스트 파라미터로부터 받아오기
ServletContext context = getServletContext();
String dbuser = context.getInitParameter("dbuser");
String dbpass = context.getInitParameter("dbpass");
%>


<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>방명록</title>
	<%-- list.jsp: 방명록을 보여주는 페이지입니다. 
	이 페이지에서는 방명록 항목을 표시하고, 
	각 항목마다 삭제 링크를 통해 해당 항목을 삭제할 수 있습니다.
	
	list.jsp에서는 삭제 링크를 클릭했을 때, 
	deleteform.jsp로 올바른 방명록 번호를 전달해야 합니다--%>
	
		
		
</head>

<body>	

<%
	GuestbookDao dao = new GuestbookDaoOracleImpl(dbuser, dbpass);
	List<GuestbookVo> list = dao.getList();
	
	for (GuestbookVo vo : list) {
%>
		
	<form method="POST"
			action="<%= request.getContextPath() %>/guestbook/add.jsp" 
			>
	
		<table border=1 width=500>
			<tr>
			
				<td>이름</td>
				<td><input type="text" name="name"
					value="<%= vo.getName() %>"></td>
				
				<td>비밀번호</td>
				<td><input type="password" name="pass"
					value="<%= vo.getPassword() %>"></td>
			</tr>
			
			<tr>
				<td colspan=4>
				<textarea name="content" cols=60 rows=5
						value="<%= vo.getContent() %>"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan=4 align=right>	
				<input type="submit" value=" 확인 "></td>
			</tr>
			
		</table>
	
	</form>
	<br/>
<%

	}
%>


	<table width=510 border=1>
		<tr>
			
			<td>[1]</td>
			<td>홍길동</td>
			<td>2018-01-15</td>
			<td><a href="<%= request.getContextPath() %>/guestbook/deleteform.jsp">삭제</a></td>
		
		</tr>
		<tr>
			 <td colspan=4>안녕하세요<br/>첫번째글입니다.</td>
			
		</tr>
		
	</table>
        <br/>

	<table width=510 border=1>
		<tr>
			<td>[1]</td>
			<td>장길산</td>
			<td>2018-01-15</td>
			<td><a href="<%= request.getContextPath() %>/guestbook/deleteform.jsp">삭제</a></td>
		</tr>
		
		<tr>
			<td colspan=4>안녕하세요<br/>두번째글입니다.</td>
		</tr>
	</table>
        <br/>
        
     <p>
		<a href="<%= request.getContextPath() %>/guestbook/">목록</a>	 
	</p>		   
         
</body>
</html>