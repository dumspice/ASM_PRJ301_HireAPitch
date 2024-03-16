/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class PitchType {
    private int id;
    private String type;

    public PitchType(int id, String type) {
        this.id = id;
        this.type = type;
    }

    public PitchType() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "PitchType{" + "id=" + id + ", type=" + type + '}';
    }
    
    public PitchType getPitchType(int id) {
        if(id == 1) return new PitchType(1, "Hà Nội");
        if(id == 2) return new PitchType(2, "Hồ Chí Minh");
        if(id == 3) return new PitchType(3, "Đà Nẵng");
        return null;
    }
    
    
}
