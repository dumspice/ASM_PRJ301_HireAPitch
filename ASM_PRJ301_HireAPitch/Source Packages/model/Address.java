/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package model;

/**
 *
 * @author dumspicy
 */
public class Address {
    private int addressId;
    private String addressName;

    public Address() {
    }

    public Address(int addressId, String addressName) {
        this.addressId = addressId;
        this.addressName = addressName;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName;
    }

    @Override
    public String toString() {
        return "Address{" + "addressId=" + addressId + ", addressName=" + addressName + '}';
    }
    
    
}
