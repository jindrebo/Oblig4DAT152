<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Password Update for Existing User</title>
</head>
<body>
	<h3>Update Password for existing user</h3>
	<p><font color="red"><c:out value="${message}"/></font></p>
	<form action=updatepassword method="post">
	<input type="hidden" name="token" value="${token}">
	<table>
	<tr>
		<td><p>New Password </td><td><input type="password" name="passwordnew" placeholder="new password" /></td>
	</tr>
	<tr>
		<td><p>Confirm New Password </td> <td><input type="password" name="confirm_passwordnew" placeholder="confirm new password" /></td>
	</tr>
	<tr>	
		<td><p><input type="submit" value="Update Password"/></p></td>
	</tr>
	</table>
	</form>
	
	<br>
	<p><a href="searchpage">Back to Main search page</a></p>
	<p><b>You are logged in as <c:out value="${user.username}"/>. <a href="logout">Log out</a></b></p>

</body>
</html>