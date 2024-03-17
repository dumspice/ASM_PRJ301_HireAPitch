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
                s.setType_id_Stuff(rs.getInt(7));
                listStuff.add(s);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
        }
        return listStuff;
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
                s.setType_id_Stuff(rs.getInt(7));
                return s;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public static void main(String[] args) {
        StuffDAO sDAO = new StuffDAO();
        ArrayList<Stuff> list = sDAO.gettAllStuff();
        for (Stuff stuff : list) {
            System.out.println(stuff);
        }
    }
}
