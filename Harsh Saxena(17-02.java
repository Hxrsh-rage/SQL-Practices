package CRUD;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    public static void main(String[] args) {
        DatabaseConnection dbConnection = new DatabaseConnection();
        System.out.println(dbConnection.establishConnection());
    }

    public Connection establishConnection() {
        Connection connection = null;
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            // Create a connection to the database
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud", "root", "root");
        } catch (Exception e) {
            System.out.println("Connection error: " + e.getMessage());
        }
        return connection;
    }
}


package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CRUDOperations {

    public static void main(String[] args) {
        CRUDOperations operations = new CRUDOperations();
        
        // Insert new user data
        operations.addUser ("1", "Jinu", "jinu@gmail.com");
        operations.addUser ("2", "Jawad", "jawad@gmail.com");
        
        // Retrieve user data
        operations.fetchUser ("2");
        
        // Update user data
        operations.modifyUser ("2", "22", "Jawad2", "jawad2@gmail.com");
        
        // Remove user data
        operations.removeUser ("1");
    }

    public void addUser (String serialNumber, String userName, String userEmail) {
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection connection = dbConnection.establishConnection();
        PreparedStatement preparedStatement = null;

        try {
            String insertQuery = "INSERT INTO user(sl_no, name, email) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, serialNumber);
            preparedStatement.setString(2, userName);
            preparedStatement.setString(3, userEmail);
            System.out.println("Executing: " + preparedStatement);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error while adding user: " + e.getMessage());
        }
    }

    public void fetchUser (String serialNumber) {
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection connection = dbConnection.establishConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            String selectQuery = "SELECT * FROM user";
            preparedStatement = connection.prepareStatement(selectQuery);
            System.out.println("Executing: " + preparedStatement);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                System.out.println("Serial Number: " + resultSet.getString("sl_no"));
                System.out.println("Name: " + resultSet.getString("name"));
                System.out.println("Email: " + resultSet.getString("email"));
                System.out.println("---------------");
            }
        } catch (Exception e) {
            System.out.println("Error while fetching user: " + e.getMessage());
        }
    }

    public void modifyUser (String serialNumber, String newSerialNumber, String userName, String userEmail) {
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection connection = dbConnection.establishConnection();
        PreparedStatement preparedStatement = null;

        try {
            String updateQuery = "UPDATE user SET sl_no=?, name=?, email=? WHERE sl_no=?";
            preparedStatement = connection.prepareStatement(updateQuery);
            preparedStatement.setString(1, newSerialNumber);
            preparedStatement.setString(2, userName);
            preparedStatement.setString(3, userEmail);
            preparedStatement.setString(4, serialNumber);
            System.out.println("Executing: " + preparedStatement);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error while updating user: " + e.getMessage());
        }
    }

    public void removeUser (String serialNumber) {
        DatabaseConnection dbConnection = new DatabaseConnection();
        Connection connection = dbConnection.establishConnection();
        PreparedStatement preparedStatement = null;

        try {
            String deleteQuery = "DELETE FROM user WHERE sl_no=?";
            preparedStatement = connection.prepareStatement(deleteQuery);
            preparedStatement.setString(1, serialNumber);
            System.out.println("Executing: " + preparedStatement);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error while deleting user: " + e.getMessage());
        }
    }
}