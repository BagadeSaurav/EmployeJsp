<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%
    // Retrieve user inputs
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Check if the username and password are valid (in a real application, you would check against a database)
    if (username.matches("[a-zA-Z]+") && password.matches("[a-zA-Z]+") ) {
        // Set a session attribute to track the user's login status
        session.setAttribute("username", username);

        // Redirect to a success page
        response.sendRedirect("success.jsp");
    } else {
        // Redirect to a failure page
        response.sendRedirect("failure.jsp");
    }
%>
