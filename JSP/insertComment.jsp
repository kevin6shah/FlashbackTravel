<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
try {
	String firstname = session.getAttribute("firstname").toString();
	String lastname = session.getAttribute("lastname").toString();
	String comment = session.getAttribute("comment").toString();
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FlashbackTravel", "kevin6shah", "*********");
	Statement st = con.createStatement();
	boolean first = true;
	String username = "";
	try {
		username = session.getAttribute("username").toString();
		first = false;
	} catch (Exception e) {}
	if (first) {
		username = request.getParameter("username");
		String password = request.getParameter("password");
		st.executeUpdate("insert into user(username, firstname, lastname, password) values ('" + username + "', '" + firstname + "', '" + lastname + "', '" + password + "')");
		try {
			st.executeUpdate("insert into comment(username, comment_text) values ('" + username + "', '" + comment + "')");
		} catch (Exception e) {
			out.println("Error inserting comment!");
		}
		session.setAttribute("username", username);
	} else {
		try {
			st.executeUpdate("insert into comment(username, comment_text) values ('" + username + "', '" + comment + "')");
		} catch (Exception e) {
			out.println("Error inserting comment!");
		}
	}
	response.sendRedirect("../index.jsp");
} catch (Exception e) {
	out.println("Error Registering!");
}
%>