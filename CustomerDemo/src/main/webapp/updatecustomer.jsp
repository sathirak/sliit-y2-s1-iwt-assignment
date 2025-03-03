<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String userName = request.getParameter("uname");
		String password = request.getParameter("pass");
	%>

	<form action="update" method="post">
		Customer ID <input type="text" name="cusid" value="<%= id %>" readonly><br>
		Name <input type="text" name="name" value="<%= name %>"><br>
		email <input type="text" name="email" value="<%= email %>"><br>
		Phone Number <input type="text" name="phone" value="<%= phone %>"><br>
		User Name <input type="text" name="uname" value="<%= userName %>"><br>
		password <input type="password" name="pass" value="<%= password %>"><br>
		
		<input type="submit" name="submit" value="Update My Data"><br>
		
	</form>

</body>
</html>