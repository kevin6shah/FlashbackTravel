<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
try {
	String comment = request.getParameter("comment");
	String username = session.getAttribute("username").toString();
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FlashbackTravel", "kevin6shah", "*********");
	Statement st = con.createStatement();
	if (username.equals("admin")) st.executeUpdate("delete from comment where comment_text='" + comment + "'");
	else st.executeUpdate("delete from comment where username='" + username + "' and comment_text='" + comment + "'");
	response.sendRedirect("../index.jsp");
} catch (Exception e) {
	out.println("Error Deleting!");
}
%>