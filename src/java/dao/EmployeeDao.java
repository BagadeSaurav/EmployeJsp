package dao;
import model.Employee;
import java.util.*;
import java.sql.*;       


public class EmployeeDao {
    
    Connection con;
    Statement st;
    ResultSet rs;
    
    public EmployeeDao()
    {
        try
        {
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","saurav");
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
    
    public List<Employee> GetAllEmployee()
    {
        List<Employee> lst = new ArrayList<>();
        try
        {
            st = con.createStatement();
            rs = st.executeQuery("select employee_id,employee_name,designation,salary from employee");
            
            while(rs.next())
            {
                Employee e = new Employee(rs.getInt("employee_id"),rs.getString("employee_name"),rs.getString("designation"),rs.getFloat("salary"));
                lst.add(e);
            }
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return lst;
    }
    
     public void addEmployee(Employee employee) {
        try {
            // Assuming you have prepared statement to prevent SQL injection
            PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO employee (employee_id, employee_name, designation, salary) VALUES (?, ?, ?, ?)");
            preparedStatement.setInt(1, employee.getEmployee_id());
            preparedStatement.setString(2, employee.getEmployee_name());
            preparedStatement.setString(3, employee.getDesignation());
            preparedStatement.setFloat(4, employee.getSalary());
            
            int rowsAffected = preparedStatement.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("Employee added successfully.");
            } else {
                System.out.println("Failed to add employee.");
            }
        } catch (SQLException e) {
            System.out.println("Error occurred while adding employee: " + e.getMessage());
        }
    }
       public boolean updateEmployee(Employee employee) {
        try {
            PreparedStatement pst = con.prepareStatement("update employee set employee_name=?, designation=?, salary=? where employee_id=?");
            pst.setString(1, employee.getEmployee_name());
            pst.setString(2, employee.getDesignation());
            pst.setFloat(3, employee.getSalary());
            pst.setInt(4, employee.getEmployee_id());
            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean deleteEmployee(int employeeId) {
        try {
            PreparedStatement pst = con.prepareStatement("delete from employee where employee_id=?");
            pst.setInt(1, employeeId);
            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    public Employee getEmployeeById(int employeeId) {
    try {
        PreparedStatement pst = con.prepareStatement("select employee_id, employee_name, designation, salary from employee where employee_id=?");
        pst.setInt(1, employeeId);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            return new Employee(rs.getInt("employee_id"), rs.getString("employee_name"), rs.getString("designation"), rs.getFloat("salary"));
        } else {
            return null; // Employee not found
        }
    } catch (SQLException e) {
        System.out.println(e.getMessage());
        return null;
    }
}

}

