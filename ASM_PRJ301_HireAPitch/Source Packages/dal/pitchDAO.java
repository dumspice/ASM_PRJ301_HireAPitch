/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Pitch;

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
                p.setPitchTypeId(rs.getInt(6));
                p.setAddressId(rs.getInt(7));
                p.setStaffId(rs.getInt(8));
                list.add(p);
            }
            rs.close();
            st.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public static void main(String[] args) {
        pitchDAO pDAO = new pitchDAO();
        ArrayList<Pitch> listP = pDAO.getAllPitch();
        for (Pitch pitch : listP) {
            System.out.println(pitch);
        }
    }
}
