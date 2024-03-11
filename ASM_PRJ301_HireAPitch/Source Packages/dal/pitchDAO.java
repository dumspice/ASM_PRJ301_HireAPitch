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
import model.Staff;

/**
 *
 * @author dumspicy
 */
public class pitchDAO extends DBContext{
    public ArrayList<Pitch> getAllPitch(){
        ArrayList<Pitch> list = new ArrayList<>();
        try{
            String sql = "select * from Pitch";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                Pitch p = new Pitch();
                p.setPitchId(rs.getInt(1));
                p.setPitchName(rs.getString(2));
                p.setAddress(rs.getString(3));
                p.setPrice(rs.getFloat(4));
                p.setImage(rs.getString(5));
                p.setPitchType(getPitchTypeById(rs.getInt(6)));
                p.setAddressId(rs.getInt(7));
                p.setStaff(getStaffById(rs.getInt(8)));
                list.add(p);
            }
            rs.close();
            st.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public ArrayList<Pitch> choosePitch(int typeId, int addressId) {
        ArrayList<Pitch> list = new ArrayList<>();
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
                p.setPrice(rs.getFloat(4));
                p.setImage(rs.getString(5));
                p.setPitchType(getPitchTypeById(rs.getInt(6)));
                p.setAddressId(rs.getInt(7));
                p.setStaff(getStaffById(rs.getInt(8)));
                list.add(p);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public Pitch getPitchById(int id) {
        ArrayList<Pitch> list = new ArrayList<>();
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
                p.setPrice(rs.getFloat(4));
                p.setImage(rs.getString(5));
                p.setPitchType(getPitchTypeById(rs.getInt(6)));
                p.setAddressId(rs.getInt(7));
                p.setStaff(getStaffById(rs.getInt(8)));
                return p;
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public PitchType getPitchTypeById(int id) {
       String sql = "select * from Type_Pitch where Type_id_Pitch = ?";
       try {
           PreparedStatement st = connection.prepareStatement(sql);
           st.setInt(1, id);
           ResultSet rs = st.executeQuery();
           if(rs.next()) {
               PitchType t = new PitchType(rs.getInt(1),
                                         rs.getString(2));
               return t;
           }
       } catch(SQLException e) {
           System.out.println(e);
       }
       return null;
    }
    
    public Staff getStaffById(int id) {
        String sql = "select * from Staff where Staff_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                 Staff s = new Staff(rs.getInt(1),
                              rs.getString(2), 
                              rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                               rs.getString(6));
                 return s;
            }
        } catch(SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public static void main(String[] args) {
        pitchDAO pDAO = new pitchDAO();
        ArrayList<Pitch> listP = pDAO.getAllPitch();
        for (Pitch pitch : listP) {
            System.out.println(pitch);
        }
    }
}
