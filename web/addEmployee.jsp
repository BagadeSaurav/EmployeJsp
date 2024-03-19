<%@page contentType="text/html" pageEncoding="UTF-8" import="model.Employee, dao.EmployeeDao"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Employee</title>
</head>
<body>
    <h1>Add Employee</h1>
    
    <% 
    // Retrieve form data
    int employeeId = Integer.parseInt(request.getParameter("employeeId"));
    String employeeName = request.getParameter("employeeName");
    String designation = request.getParameter("designation");
    float salary = Float.parseFloat(request.getParameter("salary"));

    // Create Employee object
    Employee employee = new Employee(employeeId, employeeName, designation, salary);

    // Instantiate EmployeeDao
    EmployeeDao employeeDao = new EmployeeDao();

    // Add employee to database
    employeeDao.addEmployee(employee);
    %>

    <p>Employee added successfully.</p>

    <p><a href="Employee.jsp">Back to Employee List</a></p>
</body>
</html>
