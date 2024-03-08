/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.util.ArrayList;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext{
    public ArrayList<User> getAllUsers(){
        ArrayList<User> list = new ArrayList<>();
        try {
            String sql="select * from [User]";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                User u = new User();
                u.setId(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setDisplay_name(rs.getString(4));
                u.setPhone_number(rs.getString(5));
                u.setEmail(rs.getString(6));
                u.setAvatar(rs.getString(7));
                list.add(u);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
   public boolean phoneExisted(String phone) {
        ArrayList<User> userList = getAllUsers();
        for (User user : userList) {
            if (user.getPhone_number()!= null && user.getPhone_number().equals(phone)) {
                return true; 
            }
        }
        return false; 
    }
    
 
    public boolean emailExisted(String email) {
        ArrayList<User> userList = getAllUsers();
        for (User user : userList) {
            if (user.getEmail() != null && user.getEmail().equals(email)) {
                return true; 
            }
        }
        return false;
    }
    
  
    public boolean usernameExisted(String username) {
        ArrayList<User> userList = getAllUsers();
        for (User user : userList) {
            if (user.getUsername() != null && user.getUsername().equals(username)) {
                return true; 
            }
        }
        return false; 
    }
    
    public void insert(String username, String password, String displayName, String phoneNumber, String email, String avatar) {
        try {
            // Prepare SQL statement with parameters
            String sql = "INSERT INTO [User](Username, [Password], Display_name, Phone_number, Email, Avatar) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            // Set values for parameters
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, displayName);
            st.setString(4, phoneNumber);
            st.setString(5, email);
            st.setString(6, avatar);
            
            // Execute the statement
            st.executeUpdate();
            st.close();
        } catch (SQLException e) {
            System.out.println("Error occurred while inserting user: " + e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        UserDAO uDao = new UserDAO();
        ArrayList<User> list = uDao.getAllUsers();
        for (User u : list) {
            System.out.println(u);
        }
    }
}
