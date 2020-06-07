<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.setAttribute("firstname", request.getParameter("firstname"));
	session.setAttribute("lastname", request.getParameter("lastname"));
	session.setAttribute("comment", request.getParameter("comment"));
	if (session.getAttribute("firstname").equals("") || session.getAttribute("lastname").equals("") || session.getAttribute("comment").equals("")) {
		out.println("Null values detected");
	} else {
		try {
			if (!session.getAttribute("username").equals("")) {
				response.sendRedirect("insertComment.jsp");
			}
		} catch (Exception e) {}
%>
	<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<meta name="description" content="The Beauty of Banff and Jasper">
			<title>Banff & Jasper | Register User</title>
			<link rel="shortcut icon" type="image/png" href="../Assets/logo.png">
		    <link href="https://fonts.googleapis.com/css?family=Crimson+Pro:200i&display=swap" rel="stylesheet">
		    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:300&display=swap" rel="stylesheet">
		    <link rel="stylesheet" type="text/css" href="../css/main.css">
		</head>
	<body>
		<img id="logo" src="../Assets/logo.png" width="45px" height="39px">
	    <nav>
	      <a href="../index.jsp">Home</a>
	      <a class="resources" href="../HTML/resources.html">Resources</a>
	      <a class="videos" href="../HTML/videos.html">Videos</a>
	      <a href="../HTML/about.html">About Me</a>
	    </nav>
		<form id="form" action="insertComment.jsp" method="post">
			<h1>Registration Form</h1>
			Username <input type="text" name="username"/><br/>
			Password <input type="password" name="password"/><br/>
			<button>Submit</button>
		</form>
		<footer>
      		<p>Copyright &copy; Kevin Shah. All rights reserved</p>
    	</footer>
	</body>
	</html>
<% } %>