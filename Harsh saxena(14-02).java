import java.sql.*;

public class DatabaseConnection {
    public static void main(String[] args) {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver loaded successfully.");

            // Establish a connection to the database
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/friday", "root", "root");
            System.out.println("Connection established.");

            // Create a statement object to execute queries
            Statement statement = connection.createStatement();
            System.out.println("Statement created.");

            // Execute a query to retrieve data from the student table
            ResultSet resultSet = statement.executeQuery("SELECT * FROM student");

            // Process the result set
            while (resultSet.next()) {
                System.out.println(resultSet.getInt(1) + " " + resultSet.getString(2) + " " + resultSet.getString(3));
            }

            // Close the connection
            connection.close();
            System.out.println("Connection closed.");
        } catch (Exception e) {
            System.out.println("An error occurred. Please check your program.");
            e.printStackTrace(); // Optional: Print the stack trace for debugging
        }
    }
}