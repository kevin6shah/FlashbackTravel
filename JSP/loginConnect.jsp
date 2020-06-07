<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
try {
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if (username.equals("admin") && password.equals("*********")) {
		session.setAttribute("username", "admin");
		response.sendRedirect("../index.jsp");
	}
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FlashbackTravel", "kevin6shah", "*********");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from user where binary username='" + username + "' and binary password='" + password + "'");
	if (rs.next()) {
		session.setAttribute("username", username);
		response.sendRedirect("../index.jsp");
	} else {
		out.println("Error logging in");
	}
} catch (Exception e) {
	out.println("Error Connecting!");
}
%>