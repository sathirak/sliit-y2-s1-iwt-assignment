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
	
	<h1>Customer Account Delete</h1>
	
	<form action="delete" method="post">
		Customer ID <input type="text" name="cusid" value="<%= id %>" readonly><br>
		Name <input type="text" name="name" value="<%= name %>" readonly><br>
		email <input type="text" name="email" value="<%= email %>" readonly><br>
		Phone Number <input type="text" name="phone" value="<%= phone %>" readonly><br>
		User Name <input type="text" name="uname" value="<%= userName %>" readonly><br>
		
		<input type="submit" name="submit" value="delete My Account"><br>
		
	</form>

</body>
</html>