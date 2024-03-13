/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Pitch {
    private int pitchId;
    private String pitchName;
    private String address;
    private int price;
    private String image;
    private PitchType pitchType;
    private int addressId;
    private User user;

    public Pitch() {
    }

    public Pitch(int pitchId, String pitchName, String address, int price, String image, PitchType pitchType, int addressId, User user) {
        this.pitchId = pitchId;
        this.pitchName = pitchName;
        this.address = address;
        this.price = price;
        this.image = image;
        this.pitchType = pitchType;
        this.addressId = addressId;
        this.user = user;
    }

    public int getPitchId() {
        return pitchId;
    }

    public void setPitchId(int pitchId) {
        this.pitchId = pitchId;
    }

    public String getPitchName() {
        return pitchName;
    }

    public void setPitchName(String pitchName) {
        this.pitchName = pitchName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getPrice() {
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

    public PitchType getPitchType() {
        return pitchType;
    }

    public void setPitchType(PitchType pitchType) {
        this.pitchType = pitchType;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Pitch{" + "pitchId=" + pitchId + ", pitchName=" + pitchName + ", address=" + address + ", price=" + price + ", image=" + image + ", pitchType=" + pitchType + ", addressId=" + addressId + ", user=" + user + '}';
    }
    
    
}
