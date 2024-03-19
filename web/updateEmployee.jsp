<%@page contentType="text/html" pageEncoding="UTF-8" import="dao.EmployeeDao, model.Employee"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Employee</title>
</head>
<body>

<%
    // Retrieve employee ID from the request
    int employeeId = Integer.parseInt(request.getParameter("employeeId"));

    // Fetch employee details from the database using the ID
    EmployeeDao edao = new EmployeeDao();
    Employee employee = edao.getEmployeeById(employeeId);

    // Display a form to update employee details
%>
<h1>Update Employee</h1>
<form action="updateEmployeeProcess.jsp" method="post">
    <input type="hidden" name="employeeId" value="<%= employee.getEmployee_id() %>">
    Employee Name: <input type="text" name="employeeName" value="<%= employee.getEmployee_name() %>"><br>
    Designation: <input type="text" name="designation" value="<%= employee.getDesignation() %>"><br>
    Salary: <input type="text" name="salary" value="<%= employee.getSalary() %>"><br>
    <input type="submit" value="Update Employee">
</form>
 <p><a href="Employee.jsp">Back to Employee List</a></p>
</body>
</html>
