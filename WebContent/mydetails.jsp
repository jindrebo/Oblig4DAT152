<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My details</title>
</head>
<body>
	<h3>My details</h3>
	<p><font color="red"><c:out value="${message}"/></font></p>
	<p>First name: <c:out value="${user.firstname}"/><br>
	   Last name: <c:out value="${user.lastname}"/><br>
	   Mobile phone: <c:out value="${user.mobilephone}"/></p>
	<br>
	<p><b>My personal search history</b></p>
	<p>
	<c:forEach var="searchItem" items="${myhistory}">
		${searchItem.datetime} 
		<a href="dosearch?user=${user.username}&searchkey=${searchItem.searchkey}">
		<c:out value="${searchItem.searchkey}"/></a><br>
	</c:forEach><br>
	</p>
	<br>
	<p><a href="searchpage">Back to Main search page</a></p>
	<p><a href="updatepassword.jsp">Update Password</a></p>
	<p>${updaterole}"</p>
	<p><b>You are logged in as <c:out value="${user.username}"/>. <a href="logout">Log out</a></b></p>
</body>
</html>