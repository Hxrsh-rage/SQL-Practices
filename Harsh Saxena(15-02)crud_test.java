import java.sql.Connection;
import java.sql.PreparedStatement;

public class DataInsertionTest {
    public static void main(String[] args) {
        DataInsertionTest dataTest = new DataInsertionTest();

        // Inserting sample user data into the database
        dataTest.insertData("1", "Shubham", "shubham@gmail.com");
        dataTest.insertData("2", "Shubham", "shubhamraj@gmail.com");
    }

    public void insertData(String serialNumber, String userName, String userEmail) {
        DB_Connection dbConnection = new DB_Connection();
        Connection connection = dbConnection.connection();
        PreparedStatement preparedStatement = null;

        try {
            // Prepare the SQL statement for inserting user data
            preparedStatement = connection.prepareStatement("INSERT INTO user(sl_no, name, email) VALUES (?, ?, ?)");
            preparedStatement.setString(1, serialNumber);
            preparedStatement.setString(2, userName);
            preparedStatement.setString(3, userEmail);
            System.out.println("Executing: " + preparedStatement);
            preparedStatement.executeUpdate(); // Execute the insert operation
        } catch (Exception e) {
            // Print any exceptions that occur during the operation
            System.out.println("An error occurred: " + e.getMessage());
        } finally {
            // Close resources if necessary (not shown here for simplicity)
        }
    }
}