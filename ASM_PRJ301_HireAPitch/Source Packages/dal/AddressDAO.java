/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Statement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import model.Address;

/**
 *
 * @author dumspicy
 */
public class AddressDAO extends DBContext{
    public Map<Integer, Address> getMapAllAddress(){
        Map<Integer, Address> list = new HashMap<>();
        try {
            String sql = "select * from Address";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                Address a = new Address();
                a.setAddressId(rs.getInt(1));
                a.setAddressName(rs.getString(2));
                list.put(a.getAddressId(), a);
            }
            rs.close();
            st.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public static void main(String[] args) {
        AddressDAO aDAO = new AddressDAO();
        Map<Integer, Address> listAdd = aDAO.getMapAllAddress();
        for(int aid : listAdd.keySet()){
            System.out.println(listAdd.get(aid));
        }
    }
}
