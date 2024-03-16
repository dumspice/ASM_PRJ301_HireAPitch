/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Pitch;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.PitchType;

/**
 *
 * @author dumspicy
 */
public class pitchDAO extends DBContext {

    public ArrayList<Pitch> getAllPitch() {
        ArrayList<Pitch> list = new ArrayList<>();
        UserDAO uDao = new UserDAO();
        try{
            String sql = "select * from Pitch";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                Pitch p = new Pitch();
                p.setPitchId(rs.getInt(1));
                p.setPitchName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getInt(4));
                p.setImage(rs.getString(5));
                p.setPitchType(getPitchTypeById(rs.getInt(6)));
                p.setAddressId(rs.getInt(7));
                list.add(p);
            }
            rs.close();
            st.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public void delete(int pitchId) {
        try {
            String sql = "DELETE FROM Pitch WHERE Pitch_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pitchId);
            statement.executeUpdate();
            
            statement.close();
        } catch (Exception e) {
        }
    }
    
    public void update(Pitch pitch) {
        try {
            String sql = "UPDATE Pitch SET Pitch_name = ?, [Address] = ?, Price = ?, [Image] = ?, [Type_id_Pitch] = ?, Address_id = ? WHERE Pitch_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, pitch.getPitchName());
            statement.setString(2, pitch.getAddress());
            statement.setInt(3, pitch.getPrice());
            statement.setString(4, pitch.getImage());
            statement.setInt(5, pitch.getPitchType().getId());
            statement.setInt(6, pitch.getAddressId());
            statement.setInt(7, pitch.getPitchId());

            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            System.out.println("Error updating pitch: " + e.getMessage());
        }
    }
    
    public void insert(Pitch pitch) {
        try {
            String sql = "INSERT Pitch(Pitch_name, [Address], Price, [Image], [Type_id_Pitch], Address_id) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, pitch.getPitchName());
            statement.setString(2, pitch.getAddress());
            statement.setInt(3, pitch.getPrice());
            statement.setString(4, pitch.getImage());
            statement.setInt(5, pitch.getPitchType().getId());
            statement.setInt(6, pitch.getAddressId());
            
            statement.executeUpdate();
            
            statement.close();
        } catch (Exception e) {
            System.out.println("Error inserting pitch: " + e.getMessage());
        }
    }
    
    public ArrayList<Pitch> choosePitch(int typeId, int addressId) {
        ArrayList<Pitch> list = new ArrayList<>();
        UserDAO uDao = new UserDAO();
        try {
            String sql = "SELECT * FROM Pitch WHERE [Type_id_Pitch] = ? AND Address_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, typeId);
            ps.setInt(2, addressId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pitch p = new Pitch();
                p.setPitchId(rs.getInt(1));
                p.setPitchName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getInt(4));
                p.setImage(rs.getString(5));
                p.setPitchType(getPitchTypeById(rs.getInt(6)));
                p.setAddressId(rs.getInt(7));
                list.add(p);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public String getRegionById(int id) {
        try {
            String sql = "SELECT Address_name FROM [Address] WHERE Address_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
        
    }
    
    public Pitch getPitchById(int id) {
        ArrayList<Pitch> list = new ArrayList<>();
        UserDAO uDao = new UserDAO();
        try {
            String sql = "SELECT * FROM Pitch WHERE Pitch_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Pitch p = new Pitch();
                p.setPitchId(rs.getInt(1));
                p.setPitchName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getInt(4));
                p.setImage(rs.getString(5));
                p.setPitchType(getPitchTypeById(rs.getInt(6)));
                p.setAddressId(rs.getInt(7));
                return p;
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public ArrayList<Pitch> getPitchByName(String name) {
        ArrayList<Pitch> list = new ArrayList<>();
        try {
            String sql = "select * from Pitch where Pitch_name like ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,"%" + name + "%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Pitch p = new Pitch();
                p.setPitchId(rs.getInt(1));
                p.setPitchName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getInt(4));
                p.setImage(rs.getString(5));
                p.setPitchType(getPitchTypeById(rs.getInt(6)));
                p.setAddressId(rs.getInt(7));
                list.add(p);
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public PitchType getPitchTypeById(int id) {
        String sql = "select * from Type_Pitch where Type_id_Pitch = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                PitchType t = new PitchType(rs.getInt(1),
                        rs.getString(2));
                return t;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public ArrayList<Pitch> getLastestPitch() {
        ArrayList<Pitch> list = new ArrayList<>();
        try {
            String sql = "select top 4 * from Pitch\n"
                    + "order by Pitch_id desc";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                Pitch p = new Pitch();
                p.setPitchId(rs.getInt(1));
                p.setPitchName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getInt(4));
                p.setImage(rs.getString(5));
                p.setPitchType(getPitchTypeById(rs.getInt(6)));
                p.setAddressId(rs.getInt(7));
                list.add(p);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    

    public static void main(String[] args) {
        pitchDAO pDAO = new pitchDAO();
        ArrayList<Pitch> listP = pDAO.getPitchByName("sân");
        for (Pitch pitch : listP) {
            System.out.println(pitch);
        }
    }
}
