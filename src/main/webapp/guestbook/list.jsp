﻿
<%@page import="java.sql.*" %>

<%@page import="java.util.List" %>
<%@page import="himedia.dao.GuestbookDaoOracleImpl" %>
<%@page import="himedia.dao.GuestbookDao" %>
<%@page import="himedia.vo.GuestbookVo" %>


<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>방명록</title>
	
</head>

<body>	
		
	<form action="<%= request.getContextPath() %>/guestbook/add.jsp" method="POST">
	
		<table border=1 width=500>
			<tr>
			
				<td>이름</td>
				<td><input type="text" name="name"></td>
				
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			
			<tr>
				<td colspan=4><textarea name="content" cols=60 rows=5></textarea></td>
			</tr>
			
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
			
		</table>
	
	</form>
	<br/>

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
         
</body>
</html>