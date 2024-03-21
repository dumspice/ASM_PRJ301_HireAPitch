/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dumspicy
 */
public class FDS {
    private int FDS_id;
    private String FDS_name;
    private int amount;
    private int price;
    private String image;
    private String Type_FDS;

    public FDS() {
    }

    public FDS(int FDS_id, String FDS_name, int amount, int price, String image, String Type_FDS) {
        this.FDS_id = FDS_id;
        this.FDS_name = FDS_name;
        this.amount = amount;
        this.price = price;
        this.image = image;
        this.Type_FDS = Type_FDS;
    }

    public int getFDS_id() {
        return FDS_id;
    }

    public void setFDS_id(int FDS_id) {
        this.FDS_id = FDS_id;
    }

    public String getFDS_name() {
        return FDS_name;
    }

    public void setFDS_name(String FDS_name) {
        this.FDS_name = FDS_name;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getType_FDS() {
        return Type_FDS;
    }

    public void setType_FDS(String Type_FDS) {
        this.Type_FDS = Type_FDS;
    }

    @Override
    public String toString() {
        return "FDS{" + "FDS_id=" + FDS_id + ", FDS_name=" + FDS_name + ", amount=" + amount + ", price=" + price + ", image=" + image + ", Type_FDS=" + Type_FDS + '}';
    }
    
    
}
