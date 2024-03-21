/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.FDS;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
/**
 *
 * @author dumspicy
 */
public class FDS_DAO extends DBContext{
    public ArrayList<FDS> getAllFoodAndDrink(){
        ArrayList<FDS> listFDS = new ArrayList<>();
        try {
            String sql = "select * from FDS";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                FDS f = new FDS();
                f.setFDS_id(rs.getInt(1));
                f.setFDS_name(rs.getString(2));
                f.setAmount(rs.getInt(3));
                f.setPrice(rs.getInt(4));
                f.setImage(rs.getString(5));
                f.setType_FDS(rs.getString(6));
                listFDS.add(f);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listFDS;
    }
    
    public FDS getFoodAndDrinkById(int id){
        try {
            String sql = "SELECT * FROM FDS WHERE FDS_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                FDS f = new FDS();
                f.setFDS_id(rs.getInt(1));
                f.setFDS_name(rs.getString(2));
                f.setAmount(rs.getInt(3));
                f.setPrice(rs.getInt(4));
                f.setImage(rs.getString(5));
                f.setType_FDS(rs.getString(6));
                return f;
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public static void main(String[] args) {
        FDS_DAO fDAO = new FDS_DAO();
        ArrayList<FDS> listFDS = fDAO.getAllFoodAndDrink();
        System.out.println(listFDS);
        
    }
}
