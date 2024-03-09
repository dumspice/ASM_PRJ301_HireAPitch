/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author dumspicy
 */
public class Pitch {
    private int pitchId;
    private String pitchName;
    private String address;
    private float price;
    private String image;
    private int pitchTypeId;
    private int addressId;
    private int staffId;

    public Pitch() {
    }

    public Pitch(int pitchId, String pitchName, String address, float price, String image, int pitchTypeId, int addressId, int staffId) {
        this.pitchId = pitchId;
        this.pitchName = pitchName;
        this.address = address;
        this.price = price;
        this.image = image;
        this.pitchTypeId = pitchTypeId;
        this.addressId = addressId;
        this.staffId = staffId;
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

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPitchTypeId() {
        return pitchTypeId;
    }

    public void setPitchTypeId(int pitchTypeId) {
        this.pitchTypeId = pitchTypeId;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public int getStaffId() {
        return staffId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    @Override
    public String toString() {
        return "Pitch{" + "pitchId=" + pitchId + ", pitchName=" + pitchName + ", address=" + address + ", price=" + price + ", image=" + image + ", pitchTypeId=" + pitchTypeId + ", addressId=" + addressId + ", staffId=" + staffId + '}';
    }
    
}
