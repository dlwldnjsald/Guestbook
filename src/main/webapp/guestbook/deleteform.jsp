
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- deleteform.jsp: 삭제할 방명록 항목을 확인하는 페이지입니다. 
	사용자는 비밀번호를 입력하여 방명록을 삭제할 수 있습니다. 
	이 페이지에서는 삭제를 확인하는 버튼과 
	메인 페이지로 돌아가는 링크가 제공됩니다.
	
	deleteform.jsp에서는 삭제할 항목을 확인하는 페이지이므로, 
	사용자가 올바른 비밀번호를 입력했는지 확인하는 로직이 필요합니다. 
	또한, 삭제를 진행하는 delete.jsp로 
	올바른 파라미터를 전달해야 합니다.
	해당 방명록의 번호no가 deleteform.jsp로 전달 --%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
    <%-- 전달된 방명록 번호 받기 --%>
    <% String no = request.getParameter("no"); %>
    <form method="POST" action="<%= request.getContextPath() %>/guestbook/delete.jsp?no=<%= no %>">
        <input type='hidden' name="id" value="">
        <table>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password"></td>
                <td><input type="submit" value="확인"></td>
                <td><a href="<%= request.getContextPath() %>/guestbook/list.jsp">메인으로 돌아가기</a></td>
            </tr>
        </table>
    </form>
</body>
</html>