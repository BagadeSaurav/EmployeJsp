<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, model.Employee, dao.EmployeeDao"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>Index Employee</title>
</head>
<body>
<h1>List all</h1>
<%
    EmployeeDao edao = new EmployeeDao();
    List<Employee> lst = edao.GetAllEmployee();
%>

<table border="1">
    <thead>
    <tr>
        <th>Employee ID</th>
        <th>Employee Name</th>
        <th>Designation</th>
        <th>Salary</th>
        <th>Update</th>
        <th>delete</th>
        
    </tr>
    </thead>
    <tbody>
    <%
        for (Employee e : lst) {
    %>
    <tr>
        <td><%= e.getEmployee_id() %></td>
        <td><%= e.getEmployee_name() %></td>
        <td><%= e.getDesignation() %></td>
        <td><%= e.getSalary() %></td>
        <td>
            <form action="updateEmployee.jsp" method="post">
                <input type="hidden" name="employeeId" value="<%= e.getEmployee_id() %>" >
                <input type="submit" value="Update">
            </form>
           
        </td>
        <td><form action="deleteEmployee.jsp" method="post">
                <input type="hidden" name="employeeId" value="<%= e.getEmployee_id() %>">
                <input type="submit" value="Delete">
            </form>
        </td>        
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<h1>Add Employee</h1>
<form action="addEmployee.jsp" method="post" onsubmit="return validateForm()">
    Employee ID: <input type="text" name="employeeId" required><br>
    Employee Name: <input type="text" name="employeeName" required><br>
    Designation: <input type="text" name="designation" required><br>
    Salary: <input type="text" name="salary" required><br>
    <input type="submit" value="Add Employee">
</form>

</body>
</html>
