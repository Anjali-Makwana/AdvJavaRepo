package com.signup.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.signup.model.User;
import com.signup.utils.DbConnection;

public class UserDao {

    public void saveUser(User user) {
        try (Connection connection = DbConnection.getConnection()) {
            String query = "INSERT INTO student (first_name, last_name, email, mobile, address, gender, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getMobile());
            preparedStatement.setString(5, user.getAddress());
            preparedStatement.setString(6, user.getGender());
            preparedStatement.setString(7, user.getPassword());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to check if an email is already registered
    public boolean isEmailRegistered(String email) {
        boolean isRegistered = false;
        try (Connection connection = DbConnection.getConnection()) {
            String query = "SELECT * FROM student WHERE email = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                isRegistered = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isRegistered;
    }

    // Method to validate user credentials
    public Boolean validateUser(String email, String password) {
    	boolean validateUser = false;
        try (Connection connection = DbConnection.getConnection()) {
            String query = "SELECT * FROM student WHERE email = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
            	validateUser = true;  
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return validateUser;
    }

    // Additional method to update user password (used in ChangePasswordServlet)
    public void updatePassword(String email, String newPassword) {
        try (Connection connection = DbConnection.getConnection()) {
            String query = "UPDATE student SET password = ? WHERE email = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, email);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public User getValidatedUser(String email, String password) {
        User user = null;
        try (Connection connection = DbConnection.getConnection()) {
            String query = "SELECT * FROM student WHERE email = ? AND password = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setFirstName(resultSet.getString("first_name"));
                user.setLastName(resultSet.getString("last_name"));
                user.setEmail(resultSet.getString("email"));
                user.setMobile(resultSet.getString("mobile"));
                user.setAddress(resultSet.getString("address"));
                user.setGender(resultSet.getString("gender"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
