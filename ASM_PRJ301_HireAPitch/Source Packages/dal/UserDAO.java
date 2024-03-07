/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.User;

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
    public static void main(String[] args) {
        UserDAO uDao = new UserDAO();
        ArrayList<User> list = uDao.getAllUsers();
        for (User u : list) {
            System.out.println(u);
        }
    }
}
