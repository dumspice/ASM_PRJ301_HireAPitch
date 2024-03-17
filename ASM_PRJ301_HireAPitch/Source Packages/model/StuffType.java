/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dumspicy
 */
public class StuffType {
    private int type_id_Stuff;
    private String type;

    public StuffType() {
    }

    public StuffType(int type_id_Stuff, String type) {
        this.type_id_Stuff = type_id_Stuff;
        this.type = type;
    }

    public int getType_id_Stuff() {
        return type_id_Stuff;
    }

    public void setType_id_Stuff(int type_id_Stuff) {
        this.type_id_Stuff = type_id_Stuff;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "StuffType{" + "type_id_Stuff=" + type_id_Stuff + ", type=" + type + '}';
    }
    
    
}
