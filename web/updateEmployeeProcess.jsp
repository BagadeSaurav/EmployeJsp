<%@ page import="dao.EmployeeDao" %>
<%@ page import="model.Employee" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Employee Process</title>
</head>
<body>

<%
    // Retrieve form parameters
    int employeeId = Integer.parseInt(request.getParameter("employeeId"));
    String employeeName = request.getParameter("employeeName");
    String designation = request.getParameter("designation");
    float salary = Float.parseFloat(request.getParameter("salary"));

    // Create an Employee object with updated details
    Employee updatedEmployee = new Employee(employeeId, employeeName, designation, salary);

    // Update employee details in the database
    EmployeeDao edao = new EmployeeDao();
    boolean isUpdated = edao.updateEmployee(updatedEmployee);

    // Display success or failure message based on the update result
    if (isUpdated) {
%>
    <h1>Employee updated successfully.</h1>
<%
    } else {
%>
    <h1>Failed to update employee.</h1>
<%
    }
%>
<p><a href="Employee.jsp">Back to Employee List</a></p>
</body>
</html>
