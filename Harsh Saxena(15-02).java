import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseTest {
    public static void main(String[] args) {
        DatabaseConnection dbConnection = new DatabaseConnection();
        System.out.println(dbConnection.createConnection());
    }

    public Connection createConnection() {
        Connection connection = null;
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish a connection to the database
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/saturday", "root", "root");
        } catch (Exception e) {
            // Print any exceptions that occur
            System.out.println("Error: " + e.getMessage());
        }
        return connection;
    }
}