/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Stuff;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author dumspicy
 */
public class StuffDAO extends DBContext{
    public ArrayList<Stuff> gettAllStuff(){
        ArrayList<Stuff> listStuff = new ArrayList<>();
        try {
            String sql = "select * from Stuff";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                Stuff s = new Stuff();
                s.setStuffId(rs.getInt(1));
                s.setStuffName(rs.getString(2));
                s.setSize(rs.getString(3));
                s.setAmountExist(rs.getInt(4));
                s.setPrice(rs.getInt(5));
                s.setImage(rs.getString(6));
                s.setType(rs.getString(7));
                listStuff.add(s);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
        }
        return listStuff;
    }
    
    public void add(Stuff stuff) {
        try {
            // Prepare the SQL statement to insert a new stuff
            String sql = "INSERT INTO Stuff (Stuff_name, size, amount_Exist, price, [image], [type]) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, stuff.getStuffName());
            preparedStatement.setString(2, stuff.getSize());
            preparedStatement.setInt(3, stuff.getAmountExist());
            preparedStatement.setInt(4, stuff.getPrice());
            preparedStatement.setString(5, stuff.getImage());
            preparedStatement.setString(6, stuff.getType());

            // Execute the SQL statement
            preparedStatement.executeUpdate();
            
            // Close the statement
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Stuff getStuffById(int id){
        try {
            String sql = "SELECT * FROM Stuff WHERE Stuff_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Stuff s = new Stuff();
                s.setStuffId(rs.getInt(1));
                s.setStuffName(rs.getString(2));
                s.setSize(rs.getString(3));
                s.setAmountExist(rs.getInt(4));
                s.setPrice(rs.getInt(5));
                s.setImage(rs.getString(6));
                s.setType(rs.getString(7));
                return s;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public void delete(int id) {
        try {
            String sql = "DELETE FROM [Stuff] WHERE Stuff_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.executeUpdate();
            
            statement.close();
        } catch (Exception e) {
        }
    }
    
    public static void main(String[] args) {
        StuffDAO sDAO = new StuffDAO();
        ArrayList<Stuff> list = sDAO.gettAllStuff();
        for (Stuff stuff : list) {
            System.out.println(stuff);
        }
    }
}
