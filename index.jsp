<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="description" content="The Beauty of Banff and Jasper">
    <title>Banff & Jasper | Vacation Blog</title>
    <link rel="shortcut icon" type="image/png" href="Assets/logo.png">
    <link href="https://fonts.googleapis.com/css?family=Crimson+Pro:200i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:300&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/main.css">
  </head>
  <body>
    <img id="logo" src="Assets/logo.png" width="45px" height="39px">
    <nav>
      <a href="index.jsp">Home</a>
      <a class="resources" href="HTML/resources.html">Resources</a>
      <a class="videos" href="HTML/videos.html">Videos</a>
      <a href="HTML/about.html">About Me</a>
    </nav>
    <header>
      <h1>The Beauty Of Banff and Jasper</h1>
      <p>Kevin Shah</p>
      <a href="HTML/blog.html">Read</a>
      <img width="100%" src="https://i.imgur.com/6TPASGt.jpg" title="Yoho National Park">
    </header>
    <section id="quote">
      <p>"I guess maybe the most beautiful sound in the Canadian Rockies is just silence."</p>
      <p class="author">- Eddie Hunter</p>
    </section>
    <section id="explore">
      <h2>Explore More</h2>
      <img id="down-arrow-icon" width="35" src="https://cdn.iconscout.com/icon/free/png-256/double-down-arrow-861727.png">
      <p></p>
      <a href="#" class="first-img"><div class="text">Edith Cavell</div></a>
      <a href="#" class="second-img"><div class="text">Peyto Lake</div></a>
      <a href="#" class="third-img"><div class="text">Columbia Icefield</div></a>
      <a href="#" class="fourth-img"><div class="text">Lake Louise</div></a>
      <a href="#" class="fifth-img"><div class="text">Moraine Lake</div></a>
      <a href="#" class="sixth-img"><div class="text">Emerald Lake</div></a>
    </section>
    <div id="comment-form">
    	<form action="JSP/register.jsp" method="post">
    		<div class = "name">
    			<div class = "fname">
	    			<input type="text" name="firstname" required="required" maxlength="20" placeholder="First Name"/>
	    		</div>
	    		<div class = "lname">
	    			<input type="text" name="lastname" required="required" maxlength="20" placeholder="Last Name"/><br/>
    			</div>
    		</div>
    		<textarea class="comment" name="comment" required="required" maxlength="400" placeholder="Add a comment..."></textarea><br/>
    		<button>Post</button>
    	</form>
    <% 
    	try {
    		String username = session.getAttribute("username").toString();
    		if (!username.equals("")) out.println("<a class='login' href='JSP/logout.jsp'>Logout</a><br/>");
    	} catch (Exception e) {
    		%><a class='login' href="JSP/login.jsp">Login</a><%
    	}
    %>
    </div>
    <div id="comments">
    <h2>Comments</h2>
    <%	
    	try {
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/FlashbackTravel", "kevin6shah", "*********");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from user u, comment c where u.username = c.username order by c.time_created desc");
			while (rs.next()) {
				%><div class="user"><%
				try {
					if (rs.getString("username").equals(session.getAttribute("username")) || session.getAttribute("username").equals("admin")) {
						%><a href="JSP/deleteComment.jsp?comment=<%=rs.getString("comment_text")%>">delete</a><%
					}
				} catch (Exception e) {}
				out.println("<b>" + rs.getString("firstname") +  " " +  rs.getString("lastname") + "</b>" + "<br/>");
				out.println("<div class='comment_text'>" + rs.getString("comment_text") + "</div>");
				%></div><%
			}
    	} catch (Exception e) {
    		out.println("Database Error!");
    	}
    %>
    </div>
    <div id="share">
      <p>Share</p>
      <ul class="share-buttons">
        <li><a href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fwww.flashbacktravel.com%2F&quote=Flashback%20Travel" title="Share on Facebook" target="_blank"><img alt="Share on Facebook" src="Assets/images/simple_icons_black/Facebook.png" /></a></li>
        <li><a href="https://twitter.com/intent/tweet?source=https%3A%2F%2Fwww.flashbacktravel.com%2F&text=Flashback%20Travel:%20https%3A%2F%2Fwww.flashbacktravel.com%2F" target="_blank" title="Tweet"><img alt="Tweet" src="Assets/images/simple_icons_black/Twitter.png" /></a></li>
        <li><a href="http://pinterest.com/pin/create/button/?url=https%3A%2F%2Fwww.flashbacktravel.com%2F&media=https://i.imgur.com/JK1Vo5L.jpg&description=Check%20out%20this%20travel%20blog%20on%20places%20like%20Banff%20and%20Jasper.%20I%20think%20you'll%20love%20it." target="_blank" title="Pin it"><img alt="Pin it" src="Assets/images/simple_icons_black/Pinterest.png" /></a></li>
        <li><a href="http://www.reddit.com/submit?url=https%3A%2F%2Fwww.flashbacktravel.com%2F&title=Flashback%20Travel" target="_blank" title="Submit to Reddit"><img alt="Submit to Reddit" src="Assets/images/simple_icons_black/Reddit.png" /></a></li>
        <li><a href="http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.flashbacktravel.com%2F&title=Flashback%20Travel&summary=Check%20out%20this%20travel%20blog%20on%20places%20like%20Banff%20and%20Jasper.%20I%20think%20you'll%20love%20it.&source=https%3A%2F%2Fwww.flashbacktravel.com%2F" target="_blank" title="Share on LinkedIn"><img alt="Share on LinkedIn" src="Assets/images/simple_icons_black/LinkedIn.png" /></a></li>
        <li><a href="mailto:?subject=Flashback%20Travel&body=Check%20out%20this%20travel%20blog%20on%20places%20like%20Banff%20and%20Jasper.%20I%20think%20you'll%20love%20it.:%20https%3A%2F%2Fwww.flashbacktravel.com%2F" target="_blank" title="Send email"><img alt="Send email" src="Assets/images/simple_icons_black/Email.png" /></a></li>
      </ul>
    </div>
    <footer>
      <p>Copyright &copy; Kevin Shah. All rights reserved</p>
    </footer>
  </body>
</html>
