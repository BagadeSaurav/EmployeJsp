<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%
    // Check if the user is logged in
    String username = (String) session.getAttribute("username");

    if (username != null) {
%>
        <!DOCTYPE html>
        <html>
        <head>
            <title>Welcome</title>
        </head>
        <body>
            <h2>Welcome, <%= username %>!</h2>
            <p>Login successful.</p>
            
             <p><a href="Employee.jsp"> Employee </a></p>
        </body>
        </html>
<%
    } else {
        // Redirect to the login page if the user is not logged in
        response.sendRedirect("login.jsp");
    }
%>
