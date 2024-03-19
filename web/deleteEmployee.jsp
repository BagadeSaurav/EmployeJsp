<%@ page import="dao.EmployeeDao" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Employee</title>
</head>
<body>

<%
    // Retrieve employee ID from the request
    int employeeId = Integer.parseInt(request.getParameter("employeeId"));

    // Delete employee from the database using the ID
    EmployeeDao edao = new EmployeeDao();
    boolean isDeleted = edao.deleteEmployee(employeeId);

    // Display success or failure message based on the deletion result
    if (isDeleted) {
%>
    <h1>Employee deleted successfully.</h1>
<%
    } else {
%>
    <h1>Failed to delete employee.</h1>
<%
    }
%>
    <p><a href="Employee.jsp">Back to Employee List</a></p>
</body>
</html>
