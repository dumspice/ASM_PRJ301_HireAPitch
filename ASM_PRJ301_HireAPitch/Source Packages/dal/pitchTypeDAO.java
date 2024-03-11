/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import model.PitchType;

/**
 *
 * @author dumspicy
 */
public class pitchTypeDAO extends DBContext{
    public Map<Integer, PitchType> getMapAllPitchType(){
        Map<Integer, PitchType> list = new HashMap<>();
        try{
            String sql = "select * from Type_Pitch";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                PitchType pt = new PitchType();
                pt.setId(rs.getInt(1));
                pt.setType(rs.getString(2));
                list.put(pt.getId(), pt);
            }
            st.close();
            rs.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public static void main(String[] args) {
        pitchTypeDAO ptDAO = new pitchTypeDAO();
        Map<Integer, PitchType> listPt = ptDAO.getMapAllPitchType();
        for (int ptid : listPt.keySet()) {
            System.out.println(listPt.get(ptid));
        }
    }
}
